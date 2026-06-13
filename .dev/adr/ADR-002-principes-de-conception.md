# ADR-002 — Principes de conception

- **Statut** : `unstable` (collection vivante — sera complétée/raffinée)
- **Date** : 2026-06-12
- **Portée** : générateur de présentation + outillage de marque (tickets 002, 003, 004)

> **Objet** : centraliser les **principes de conception** énoncés au fil des tickets, pour
> qu'ils guident les décisions (et l'ADR-001). Document **instable** : on y ajoute les
> principes au fur et à mesure qu'ils émergent.

## Principes

### P1 — « Le plus simple pour l'utilisateur »
Interfaces **explicites et découvrables**. L'humain édite du **Markdown**, jamais du LaTeX
(le rendu est un détail caché). Une commande = une intention (`dev.sh gen`, `imagen.sh logotipo color`).
- *Origine* : ticket 003 (proposition) ; ticket 002 (abstraction Markdown).
- *Implication* : CLI claires, `--help`, sorties prévisibles (stdout), valeurs par défaut sensées.

### P2 — Pas de langage supplémentaire inutile
N'introduire un nouveau langage **que** s'il apporte une valeur nette. En particulier,
**éviter Python** quand bash + Lua + outils CLI suffisent.
- *Origine* : ticket 003 (tâche 4).
- *Implication* : stack bash + Lua/`texlua` + outils CLI (potrace, ImageMagick…). `imagen.sh` est en bash pur.

### P3 — Ne rien coder en dur (externaliser la configuration)
Les valeurs variables (marque, présentation) vivent dans des fichiers de données
(`branding.yml`, `config.yaml`), pas dans le code/template.
- *Origine* : ticket 003 (tâche 6) « ne pas coder en dur les valeurs de branding ».
- *Implication* : le template est **agnostique** ; il est seulement contraint par la **topologie** (cf. P7).

### P4 — Minimalisme des dépendances (« ne charger que l'utilisé »)
Ne charger/installer que ce qui sert réellement. Pour LaTeX : préambule **piloté par les
modèles** (union des paquets des modèles employés).
- *Origine* : ticket 003 (tâches 3-4).
- *Implication* : surface réduite, builds plus rapides et reproductibles.

### P5 — « Utilisez SVG si possible »
Stocker les primitives graphiques en **SVG** (vectoriel, éditable, recolorable). Les formats
raster/PDF sont **dérivés**, jamais la source.
- *Origine* : ticket 004 (tâche 3).
- *Implication* : `assets/branding/` ne contient que des **primitives SVG** ; `imagen.sh`
  produit du SVG sur stdout.

### P6 — « Lazy generating » (génération paresseuse + cache)
Générer une ressource **au dernier moment**, et **conserver les artefacts intermédiaires**
pour les **réutiliser** plutôt que les regénérer.
- *Origine* : ticket 004 (tâche 3).
- *Implication* : `dev.sh` produit PNG/PDF depuis les SVG **seulement quand nécessaire**, dans
  `workdir/`, et réutilise l'existant. `imagen.sh` met en cache ses bitmaps/tracés
  (`assets/.cache/`).

### P7 — Séparation des préoccupations : contenu ⟂ rendu, et template ⟂ marque
Le **contenu** (Markdown) est indépendant du **rendu** (LaTeX). Le **template** est
indépendant des **valeurs de marque** : il n'en connaît que la **topologie** (2 couleurs,
2 polices, logo + isotipo à variations).
- *Origine* : tickets 002 et 003/006.
- *Implication* : on peut changer de thème, de marque, ou (à terme) de moteur de rendu sans
  toucher au contenu.

## Tableau de synthèse

| # | Principe | Origine | En une ligne |
|---|---|---|---|
| P1 | Le plus simple pour l'utilisateur | t.003/002 | CLI explicites, Markdown, stdout |
| P2 | Pas de langage inutile | t.003 | éviter Python ; bash + Lua + CLI |
| P3 | Ne rien coder en dur | t.003/006 | `branding.yml`, `config.yaml` |
| P4 | Minimalisme des dépendances | t.003 | charger seulement l'utilisé |
| P5 | SVG si possible | t.004 | primitives vectorielles |
| P6 | Lazy generating | t.004 | générer tard, cacher, réutiliser |
| P7 | Séparation des préoccupations | t.002/003 | contenu⟂rendu, template⟂marque |

## TODO (statut unstable)

- Confirmer la formulation de chaque principe avec Jérémy.
- Ajouter les principes qui émergeront des prochains tickets.
- Une fois stabilisé : passer le statut à `accepted` et référencer ces principes depuis
  l'ADR-001 et les tickets.
