# ADR-001 — Stack technologique du générateur de présentation

- **Statut** : Accepté
- **Date** : 2026-06-12 (précisions intégrées le 2026-06-13)
- **Décideurs** : Jérémy Viau-Trudel (noumanity)
- **Tickets** : `002` (structure & abstraction Markdown), `003` (choix de la stack),
  `004` (branding noumanity)

---

## 1. Contexte

Le dépôt produit **une** présentation (Rencontres Linux du Québec) et doit la générer de
façon reproductible. Contraintes directrices :

- **« Le plus simple pour l'utilisateur »** : interfaces explicites et découvrables.
- L'humain **édite du Markdown, jamais du LaTeX** (abstraction du ticket 002 : 1 slide =
  1 fichier `.md` + en-tête YAML, qui choisit un `model`).
- **Pas de langage supplémentaire inutile** (notamment **pas de Python**).
- **Lua** (usage + dépendances) est acceptable et bienvenu.
- **Méfiance** envers pandoc pour un rendu pro et finement configurable.
- Identité visuelle **noumanity** à respecter, **sans valeurs codées en dur**.

## 2. Décision (résumé)

> **Beamer + LuaLaTeX**, thème **`beamerthemeNoumanity`** (base *metropolis*), piloté par un
> prétraitement **bash + Lua** (`texlua` : YAML + `lunamark` + `etlua`). **Ni Python ni
> pandoc.** Bibliographie **`biblatex` + `biber`**. Branding externalisé dans
> **`branding.yml`**. Build via **`latexmk`**.

## 3. Décisions détaillées

### 3.1 Rendu
- **Classe** : **Beamer** (standard, mature, overlays, thèmes = nos `model`).
- **Moteur** : **LuaLaTeX** (polices de marque via `fontspec`, scriptage `\directlua`).
- **Thème** : **`beamerthemeNoumanity`**, **étendant *metropolis*** (surcharge
  couleurs/polices de marque).
- *Alternatives écartées* : powerdot, classes anciennes, slides « faites main » en TikZ.

### 3.2 Prétraitement (la « glue »)
- **Orchestration / CLI** : **bash** — `scripts/dev.sh` (`gen` / `clean` / `--help`),
  `activate` (alias + `PATH`, vérif. dépendances).
- **Langage de prétraitement** : **Lua via `texlua`** (déjà fourni par TeX Live → pas de
  runtime supplémentaire) :
  - **YAML** : lecture de `config.yaml`, `branding.yml`, en-têtes de slides.
  - **Markdown → LaTeX** (corps de slide) : **`lunamark`**.
  - **Templating** (gabarits `model` + génération des **overlays**) : **`etlua`**
    (délimiteurs `<% %>`, sans collision avec `{}` / `$` de LaTeX).
- *Alternatives écartées* :
  - **`pandoc + yq`** : capable, mais impose ses conventions de mapping et jugé peu fiable
    pour un rendu pro → écarté comme cœur du générateur.
  - **Python + Jinja2** : très capable, mais **ajoute un langage** → écarté.

### 3.3 Conventions de contenu
- **`model`** = un gabarit `templates/models/<model>.tex` (etlua).
- **`variation`** ⇒ **overlays Beamer** (`\only` / `\onslide` / `\uncover`) sur **une même
  frame**, générés depuis le champ `variation`.
- Modèles de départ : **`title`** et **`plain`** (ticket 002).

### 3.4 Code source (démo)
- **`listings`** (pur LaTeX, zéro dépendance externe, build reproductible).
- *Alternative écartée* : **`minted`** (exige Python/Pygments + `-shell-escape`).

### 3.5 Bibliographie
- **`biblatex` + `biber`** (pas BibTeX classique).
- **Un `.bib` central** faisant partie du contenu : **`slides/references.bib`**.
- `\addbibresource` + frame « Sources » via `\printbibliography`. **`latexmk` lance `biber`**
  automatiquement.

### 3.6 Paquets — « ne charger que les paquets utilisés »
- **Chargement piloté par les modèles** : chaque gabarit déclare ses besoins
  (`%% requires: …`) ; `dev.sh` émet l'**union dédupliquée** des `\usepackage` des modèles
  réellement utilisés.
- **Socle obligatoire** : `beamer`, `fontspec`, `babel` (french) + `csquotes`, `tikz`,
  `xcolor`, `graphicx`, `hyperref`, `listings`, `microtype`.
- **Adoptés (ticket 003 §5)** : **`booktabs`** (tableaux), **`fontawesome5`** (icônes),
  **`qrcode`** (appel à l'action).

### 3.7 Branding (ticket 004 / 006)
- **Aucune valeur de marque en dur** : tout vient de **`branding.yml`** (dans `assets/branding/`).
- **Topologie figée** : **2 couleurs** (orange `#FA4D1F` + **noir** `#000000`), **2 polices**
  (**ABeeZee** = titres et emphases très fortes ; **Arimo** = corps — Google Fonts libres),
  **logo + isotipo** chacun à variations.
- Le prétraitement Lua génère `branding.tex` : `\definecolor{brand-primary}…`, `fontspec`,
  macros `\brandLogo[variant]` / `\brandIsotipo[variant]`.
- Fichiers de marque dans **`assets/branding/`** (récupérés au ticket 004 ; logo
  « transformation numérique » **exclu**).

### 3.8 Build
- **`latexmk -lualatex -outdir=workdir`** (gère toc, biber, overlays).
- Compilation dans **`workdir/`** ; PDF final copié dans **`dist/presentation.pdf`**.

### 3.9 Structure du dépôt (ticket 002, v2)
```
activate, branding.yml, config.yaml
scripts/dev.sh
slides/        (*.md + references.bib)
templates/     (main.tex, models/, variations/, theme/)
assets/        (branding/, images/, backgrounds/, fonts/, code/)
dist/          (PDF final)        workdir/  (temporaire, gitignored)
```

## 4. Dépendances système (TeX Live)

```
texlive-luatex                 # lualatex + texlua (Lua de prétraitement)
texlive-latex-recommended      # beamer
texlive-latex-extra            # listings, tikz extras, booktabs, qrcode
texlive-fontawesome5           # fontawesome5  (ou texlive-fonts-extra)
texlive-fonts-extra            # polices de marque (Arimo, ABeeZee) — SOURCE PRÉFÉRÉE
#   repli si indisponible : curl depuis Google Fonts -> assets/fonts/
texlive-lang-french            # babel french, csquotes
texlive-bibtex-extra biber     # biblatex + biber
latexmk
# Modules Lua : lunamark, etlua, parseur YAML (lyaml/tinyyaml) via luarocks
```

## 5. Conséquences

**Positives**
- **Un seul écosystème** (TeX Live + Lua) : pas de langage en plus, build cohérent.
- Auteur **ne touche jamais au LaTeX** ; contenu et marque **découplés** du rendu.
- **Reproductible** (zéro `-shell-escape`, dépendances explicites).
- **Réutilisable** : changer `branding.yml` suffit pour une autre marque à même topologie.

**Négatives / risques**
- **`lunamark`** couvre un sous-ensemble de Markdown (suffisant pour des slides, mais moins
  riche que pandoc sur les cas limites).
- **Modules Lua** (lunamark, etlua, YAML) à gérer via `luarocks` (acceptable, acté par le
  décideur).
- **`etlua`/Lua** : montée en compétence légère vs un simple `{{champ}}`.

## 6. Migration / porte de sortie

L'abstraction Markdown (contenu ⟂ gabarits) **préserve** la possibilité de **changer de
moteur** plus tard (pandoc, reveal.js…) **sans réécrire le contenu**. Pandoc reste un
**plan B** documenté, non retenu aujourd'hui.

## 7. Références (livrables sources)

- `.dev/tickets/TKT-002-template-latex-costumisé-noumanity/01-proposition-structure.md`
- `.dev/tickets/TKT-003-choix-de-la-stack/01-revue-outils-latex.md`
- `.dev/tickets/TKT-003-choix-de-la-stack/02-analyse-lua.md`
- `.dev/tickets/TKT-003-choix-de-la-stack/03-precisions-et-validation.md`
- `.dev/tickets/TKT-003-choix-de-la-stack/04-reponse-q4-lua-et-rendu.md`
- `.dev/tickets/TKT-003-choix-de-la-stack/05-fonctionnalites-additionnelles.md`
- `.dev/tickets/TKT-003-choix-de-la-stack/06-branding-parametrable.md`
- `.dev/tickets/TKT-003-choix-de-la-stack/04-reponse-q4-lua-et-rendu.md`, `05-fonctionnalites-additionnelles.md`
- `assets/branding/branding.yml`, `assets/branding/` (ticket 004)
