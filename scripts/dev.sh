#!/usr/bin/env bash
# dev.sh - outil de génération de la présentation
#
# Usage (après `. activate`) :
#   dev.sh gen      - génère dist/presentation.pdf
#   dev.sh clean    - vide workdir/
#   dev.sh --help   - affiche ce message
#
# Variable attendue : PRESENTATION_ROOT (positionnée par `. activate`)

set -euo pipefail

ROOT="${PRESENTATION_ROOT:-$(cd "$(dirname "$0")/.." && pwd)}"
SLIDES_SRC="$ROOT/.dev/artefacts/presentation"
TEMPLATES="$ROOT/templates"
WORKDIR="$ROOT/workdir"
DIST="$ROOT/dist"
WORKDIR_TEX="$WORKDIR/tex"
WORKDIR_ASSETS="$WORKDIR/assets"

usage() {
    grep '^#' "$0" | sed 's/^# //' | sed 's/^#//'
    exit 0
}

clean() {
    rm -rf "$WORKDIR/tex" "$WORKDIR/assets" \
           "$WORKDIR"/main.tex "$WORKDIR"/main.pdf \
           "$WORKDIR"/*.aux "$WORKDIR"/*.log \
           "$WORKDIR"/*.nav "$WORKDIR"/*.snm \
           "$WORKDIR"/*.toc "$WORKDIR"/*.out \
           "$WORKDIR"/build.log 2>/dev/null || true
    echo "[OK] workdir nettoyé"
}

gen() {
    mkdir -p "$WORKDIR_TEX" "$WORKDIR_ASSETS" "$DIST"

    # Copier le thème dans workdir/ pour que pdflatex le trouve
    cp "$TEMPLATES/theme/"*.sty "$WORKDIR/"

    # Rendre chaque slide
    local slide_tex_files=()
    for slide_dir in "$SLIDES_SRC"/slide-*/; do
        local content_md="$slide_dir/content.md"
        [ -f "$content_md" ] || continue
        local name; name=$(basename "$slide_dir")
        local out="$WORKDIR_TEX/${name}.tex"
        python3 "$ROOT/scripts/render_slide.py" \
            "$content_md" \
            "$ROOT/config.yaml" \
            "$out" \
            "$TEMPLATES" \
            "$WORKDIR_ASSETS"
        slide_tex_files+=("$out")
    done

    if [ ${#slide_tex_files[@]} -eq 0 ]; then
        echo "[ERREUR] Aucun content.md trouvé dans $SLIDES_SRC/slide-*/" >&2
        exit 1
    fi

    # Générer workdir/main.tex
    local main_tex="$WORKDIR/main.tex"
    {
        cat "$TEMPLATES/preamble.tex"
        echo '\begin{document}'
        for f in "${slide_tex_files[@]}"; do
            echo "\\input{$f}"
        done
        echo '\end{document}'
    } > "$main_tex"

    # Compiler (deux passes pour les références croisées Beamer)
    local compile_cmd
    compile_cmd="pdflatex -interaction=nonstopmode -output-directory=$WORKDIR $main_tex"
    $compile_cmd > "$WORKDIR/build.log" 2>&1
    $compile_cmd >> "$WORKDIR/build.log" 2>&1

    if [ -f "$WORKDIR/main.pdf" ]; then
        cp "$WORKDIR/main.pdf" "$DIST/presentation.pdf"
        echo "[OK] dist/presentation.pdf généré"
    else
        echo "[ERREUR] Compilation LaTeX échouée - voir workdir/build.log" >&2
        tail -40 "$WORKDIR/build.log" >&2
        exit 1
    fi
}

case "${1:-}" in
    gen)    gen ;;
    clean)  clean ;;
    --help) usage ;;
    "")     usage ;;
    *)      echo "[ERREUR] Commande inconnue : $1" >&2; usage ;;
esac
