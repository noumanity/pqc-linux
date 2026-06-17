#!/usr/bin/env python3
"""render_slide.py - convertit un content.md en frame LaTeX Beamer.

Usage:
    render_slide.py <content.md> <config.yaml> <output.tex> <templates_dir> <workdir_assets>
"""

import os
import re
import subprocess
import sys

import yaml

# Correspondances noms de champs français → anglais canonique
FIELD_MAP = {
    "Titre":        "title",
    "Auteurs":      "authors",
    "Démo":         "demo",
    "Préparé pour": "event",
    "Date":         "date",
    "Lieu":         "location",
}

# Caractères LaTeX dangereux (NB : backslash en premier)
_TEX_SUBS = [
    ("\\", r"\textbackslash{}"),
    ("{",  r"\{"),
    ("}",  r"\}"),
    ("&",  r"\&"),
    ("%",  r"\%"),
    ("$",  r"\$"),
    ("#",  r"\#"),
    ("_",  r"\_"),
    ("~",  r"\textasciitilde{}"),
    ("^",  r"\^{}"),
]


def parse_frontmatter(path):
    with open(path, encoding="utf-8") as fh:
        raw = fh.read()
    if not raw.startswith("---"):
        return {}, raw
    end = raw.find("\n---", 3)
    if end == -1:
        return {}, raw
    front = raw[3:end].strip()
    body = raw[end + 4:].strip()
    # Le préfixe '@' (notation IDE pour chemin repo-relatif) est invalide en YAML.
    front = re.sub(r"@(?=[./\w])", "", front)
    return yaml.safe_load(front) or {}, body


def normalize_fields(meta):
    out = {}
    for k, v in meta.items():
        canonical = FIELD_MAP.get(k, k.lower())
        out[canonical] = v
    return out


def tex_escape(text):
    if not isinstance(text, str):
        text = str(text)
    for old, new in _TEX_SUBS:
        text = text.replace(old, new)
    return text


def render_markdown_body(body):
    """Convertit le corps Markdown en LaTeX via pandoc (listes, gras, emphase…).

    Renvoie une chaîne vide si le corps est vide. Pandoc est requis ; en cas
    d'absence, on se rabat sur un échappement minimal pour ne pas casser la
    compilation.
    """
    body = (body or "").strip()
    if not body:
        return ""
    try:
        result = subprocess.run(
            ["pandoc", "--from=markdown", "--to=latex", "--wrap=none"],
            input=body, capture_output=True, text=True, check=True,
        )
        return result.stdout.strip()
    except (FileNotFoundError, subprocess.CalledProcessError) as exc:
        print(f"[WARN] pandoc indisponible, repli sur échappement brut ({exc})",
              file=sys.stderr)
        return tex_escape(body)


def sanitize_filename(name):
    return re.sub(r"[^A-Za-z0-9._-]", "_", os.path.splitext(name)[0])


def resolve_asset(raw_path, root, workdir_assets):
    """Résout un chemin d'asset (strip '@'), convertit si besoin (SVG→PDF, webp→PNG)."""
    if isinstance(raw_path, str) and raw_path.startswith("@"):
        raw_path = raw_path[1:]

    # Dénormaliser les espaces échappés shell (\ ) en espaces réels
    raw_path = raw_path.replace("\\ ", " ")

    # Chemin tel quel
    candidate = os.path.join(root, raw_path)

    # Repli : .dev/assets/ → assets/branding/
    if not os.path.exists(candidate):
        alt = raw_path.replace(".dev/assets/", "assets/branding/")
        alt_candidate = os.path.join(root, alt)
        if os.path.exists(alt_candidate):
            candidate = alt_candidate
        else:
            print(f"[WARN] Asset introuvable : {raw_path}", file=sys.stderr)
            return None

    ext = os.path.splitext(candidate)[1].lower()
    stem = sanitize_filename(os.path.basename(candidate))

    if ext == ".svg":
        target = os.path.join(workdir_assets, stem + ".pdf")
        if not os.path.exists(target):
            subprocess.run(
                ["inkscape", "--export-type=pdf", f"--export-filename={target}", candidate],
                check=True, capture_output=True,
            )
        return target

    if ext == ".webp":
        target = os.path.join(workdir_assets, stem + ".png")
        if not os.path.exists(target):
            subprocess.run(["convert", candidate, target], check=True, capture_output=True)
        return target

    return candidate


def format_logos(paths):
    if not paths:
        return ""
    items = [
        r"\includegraphics[height=1.1cm]{" + p + "}"
        for p in paths
    ]
    return r"\hspace{1.5em}".join(items)


def render_template(template, ctx):
    def sub(m):
        key = m.group(1)
        val = ctx.get(key, "")
        return str(val) if val is not None else ""
    return re.sub(r"\{\{(\w+)\}\}", sub, template)


def main():
    if len(sys.argv) < 6:
        print(__doc__)
        sys.exit(1)

    content_md, config_yaml, output_tex, templates_dir, workdir_assets = sys.argv[1:6]
    root = os.environ.get(
        "PRESENTATION_ROOT",
        os.path.abspath(os.path.join(os.path.dirname(content_md), "../../../..")),
    )
    os.makedirs(workdir_assets, exist_ok=True)

    meta, body = parse_frontmatter(content_md)
    meta = normalize_fields(meta)

    with open(config_yaml, encoding="utf-8") as fh:
        config = yaml.safe_load(fh) or {}

    # Modèle : champ `model` explicite en priorité ; sinon heuristique de repli
    # (une page avec des auteurs mais sans corps est une page de titre).
    model = meta.get("model")
    if not model:
        if "authors" in meta:
            model = "title"
        else:
            model = config.get("default_model", "plain")

    tpl_path = os.path.join(templates_dir, "models", f"{model}.tex")
    with open(tpl_path, encoding="utf-8") as fh:
        template = fh.read()

    # Contexte : globaux d'abord, slide-level par-dessus
    ctx = {}
    ctx.update(config)
    ctx.update(meta)

    # Background
    bg_raw = ctx.get("background", "")
    if bg_raw:
        bg_path = resolve_asset(bg_raw, root, workdir_assets)
        if bg_path:
            ctx["background_block"] = (
                "\\begin{tikzpicture}[remember picture, overlay]\n"
                "  \\node[at=(current page.center)] {%\n"
                "    \\includegraphics[width=\\paperwidth,height=\\paperheight]"
                "{" + bg_path + "}};\n"
                "\\end{tikzpicture}"
            )
        else:
            ctx["background_block"] = ""
    else:
        ctx["background_block"] = ""

    # Auteurs
    authors = ctx.get("authors", [])
    if isinstance(authors, str):
        authors = [authors]
    ctx["authors_formatted"] = r" \\ ".join(tex_escape(a) for a in authors)

    # Champs texte courants
    ctx["title_tex"]    = tex_escape(ctx.get("title", ""))
    ctx["subtitle_tex"] = tex_escape(ctx.get("subtitle", ""))
    ctx["event_tex"]    = tex_escape(ctx.get("event", ""))
    ctx["date_tex"]     = tex_escape(ctx.get("date", ""))
    ctx["demo_tex"]     = tex_escape(ctx.get("demo", ""))

    # Logos
    logos_raw = ctx.get("logos", [])
    logo_paths = [
        p for lr in logos_raw
        if (p := resolve_asset(lr, root, workdir_assets)) is not None
    ]
    ctx["logos_formatted"] = format_logos(logo_paths)

    # Corps Markdown rendu en LaTeX (ignoré par le modèle title, utilisé par plain)
    ctx["content"] = render_markdown_body(body)

    rendered = render_template(template, ctx)

    os.makedirs(os.path.dirname(output_tex), exist_ok=True)
    with open(output_tex, "w", encoding="utf-8") as fh:
        fh.write(rendered)
    print(f"[OK] {output_tex}")


if __name__ == "__main__":
    main()
