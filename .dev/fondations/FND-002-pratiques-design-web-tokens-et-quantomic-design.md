# Pratiques de design web, sémantique des *tokens* et formalisation de **Quantomic Design** — recherche

> **Statut** : essai de fondation (tâche 5 du ticket `004`).
> **Date** : 2026-06-13.
> **Objectif** : établir une base factuelle rigoureuse sur (1) l'**histoire** et les
> **tendances actuelles** du design web, (2) la **sémantique** et les **processus de bout en
> bout** (la « verticale » conception → intégration), (3) les **outils** et les choix
> sémantiques qu'ils imposent, (4) une **analyse critique d'Atomic Design** ; puis à
> **formaliser** la méthodologie **Quantomic Design** que noumanity entend adopter.
>
> ⚠️ **Note de rigueur** : chaque affirmation factuelle importante est rattachée à une source
> (voir §10). L'écosystème évolue vite ; les états (versions de specs, d'outils) sont vérifiés
> à **juin 2026** et devront être revalidés. Les sections §8–§9 (Quantomic Design) sont une
> **proposition interne noumanity**, explicitement distinguée de l'état de l'art.
>
> *Contexte d'origine* : l'exemple `workdir/webapp/examples/blog` (analysé au ticket 004,
> tâche 4 — voir [`04-analyse-topologie-branding.md`](../tickets/TKT-004-branding-noumanity/04-analyse-topologie-branding.md))
> implémente déjà une cascade de jetons `Brand → Topology → Flavor → Atom`. Le présent essai
> fournit le **socle théorique** qui la justifie et la généralise.

---

## 1. Cadrage : objet, périmètre, définitions

### 1.1 Ce qu'on cherche

On veut comprendre **comment l'industrie web a appris à produire des interfaces cohérentes,
à plusieurs, de façon reproductible** — et où vit le **« sens »** (la sémantique) dans cette
chaîne. L'enjeu pratique pour noumanity : produire des **médias riches** (site, slides,
documents) avec une **identité uniforme**, sans que chaque intégrateur ait à décider.

### 1.2 Périmètre

- **Dans le périmètre** : architectures et méthodologies CSS, *design systems*, *design
  tokens*, Atomic Design, outillage de la chaîne conception→intégration, CSS moderne.
- **Hors périmètre** : frameworks applicatifs (React/Vue/…) au-delà de leur impact sur le
  style ; accessibilité et performance (mentionnées seulement quand elles touchent la
  sémantique).

### 1.3 Trois définitions de travail

- **Sémantique** (ici) : le fait qu'un nom porte une **intention** (« couleur primaire »,
  « fond de page ») plutôt qu'une **valeur** (« #fa4d1f ») ou une **présentation** (« orange »).
  Toute l'histoire qui suit est une **montée progressive en sémantique**.
- **Design token** : *« une entité nommée qui stocke une décision de design »*, **agnostique
  de la plateforme**, transformable vers n'importe quel format cible (CSS, iOS, Android…).
  Le terme est une **méthodologie**, pas une simple variable [1][2].
- **La verticale** : la chaîne de production **de bout en bout**, du **designer** au **rendu
  intégré**, en passant par le mainteneur de *design system* et l'intégrateur — chacun
  produisant et consommant des artefacts.

---

## 2. Histoire : de la cascade non maîtrisée aux *tokens*

L'architecture front-end a évolué **par couches successives**, chacune répondant à une
douleur de la précédente [3][4].

### 2.1 La préhistoire (≈ 2000-2008) : CSS global, cascade subie

CSS est globalement **scopé au document** : tout sélecteur peut tout atteindre. À l'échelle,
la **cascade** et la **spécificité** deviennent des sources de régressions (« je change une
couleur ici, ça casse là »). Pas de modularité, pas de sémantique partagée.

### 2.2 2008-2014 : modularité et sémantique de classes

- **OOCSS** (Nicole Sullivan, 2008-2009) : repérer les **motifs visuels répétés**, en faire
  des **objets réutilisables** ; séparer **structure** et **habillage** [4].
- **BEM** (Yandex) : `Block__Element--Modifier`, une **convention de nommage** qui rend la
  sémantique d'un composant **explicite et locale** [4].
- **SMACSS** (Jonathan Snook, 2011) : **catégoriser** les règles (base, layout, module,
  state, theme) [4].
- **ITCSS** (Harry Roberts, 2014) : organiser le CSS en **triangle inversé** par
  **spécificité croissante** (settings → tools → generic → elements → objects → components →
  utilities) [4].

> 🔑 **Lecture** : ces méthodologies inventent la **discipline du nommage** et l'idée qu'une
> feuille de style a une **architecture**. La sémantique passe de l'implicite (« le rouge »)
> à l'explicite (« .button--danger »).

### 2.3 2015-2020 : le composant comme unité, et le scope

- **CSS Modules** (2015) : **scope local** automatique des classes → fin des collisions [3].
- **CSS-in-JS** (Styled Components, Emotion, 2016-2020) : le style **colocalisé** avec le
  composant, paramétré par les *props* → sémantique portée par le **composant**, au prix d'un
  **coût runtime** [3].
- **Zero-runtime CSS-in-JS** (Linaria, Vanilla Extract, 2019-2020) : mêmes bénéfices,
  **extraction à la compilation** → retour vers du CSS statique [3].

### 2.4 2017+ : l'inversion utility-first (Tailwind)

**Tailwind CSS** (2017) pousse l'**utility-first** : des classes atomiques mono-propriété
(`p-4`, `text-center`) composées dans le balisage [3][4]. C'est une **inversion sémantique
assumée** : on **renonce à nommer l'intention au niveau du composant** pour la **déléguer à
un vocabulaire de contraintes** (l'échelle d'espacements, la palette). La sémantique remonte
alors dans la **configuration du thème** (les *tokens*), pas dans des noms de classes.

### 2.5 2013 : Atomic Design (la composition)

**Brad Frost** publie **Atomic Design** (2013) : une **métaphore de composition** en cinq
niveaux — **atom → molecule → organism → template → page** [5]. Ce n'est *pas* une techno mais
un **modèle mental** pour assembler des interfaces du plus petit au plus grand. (Analyse
critique en §7.)

### 2.6 2014 : les *design tokens* (la sémantique portable)

**Jina Anne**, chez **Salesforce**, forge le terme **« design token »** en **2014** en
construisant le **Lightning Design System** [1][2]. L'idée : stocker une **décision de design
une seule fois**, sous un **nom**, et la **distribuer partout** — non seulement vers un fichier
CSS, mais vers **iOS, Android, Java, PHP…**, le token étant **agnostique de la plateforme** et
sa valeur **transformée** vers chaque cible [1]. Citation fondatrice : *« dire que les design
tokens ne sont que des variables, c'est comme dire que le responsive design n'est que des media
queries »* — c'est une **méthodologie** [1].

> 🔑 **Bascule historique** : avec les tokens, la **sémantique se détache du langage de rendu**.
> Elle devient une **donnée** portable et versionnable, consommable par n'importe quel support
> — exactement le besoin de noumanity (slides **et** web depuis une même marque).

### 2.7 2020-2026 : convergence et standardisation

- **DTCG / W3C** : le **Design Tokens Format Module** atteint sa **première version stable
  (2025.10)** le **28 octobre 2025** [6][7]. *Important* : ce n'est **pas** une norme W3C ni
  sur le *Standards Track* — c'est le travail d'un **Community Group** [6]. Il standardise un
  **format JSON** d'échange : *aliases* (références par accolades **et** JSON Pointer),
  **theming**, et les **espaces colorimétriques modernes** (Display P3, **OKLCH**, tout CSS
  Color Module 4) [6][7].
- **Figma** : le **Dev Mode** (lancé 2023, fortement enrichi en 2025) expose la **chaîne
  d'alias** d'une variable (collection → **mode/thème** → valeur brute) ; **import/export de
  variables** alignés sur la spec DTCG (nov. 2025) ; **Code Connect** et une **GitHub Action**
  officielle qui **synchronise les variables Figma vers des tokens CSS via *pull request*** [8].
- **Tailwind v4** : passage à une approche **CSS-first** avec la directive **`@theme`** ; les
  tokens deviennent **des variables CSS natives** exposées au runtime, et l'on **change de
  thème** via `.dark` ou `[data-theme="…"]` **sans recompiler** [9][10].
- **CSS moderne** (largement disponible 2023-2025) fournit enfin nativement les briques qui
  exigeaient naguère des préprocesseurs ou du JS : **custom properties** (`--x`), **`@layer`**
  (cascade maîtrisée), **container queries**, **`:has()`**, **nesting**, **OKLCH** et
  **`color-mix()`** [3][7]. La trajectoire va vers une **optimisation à la compilation** et un
  CSS de nouveau **déclaratif** [3].

---

## 3. La sémantique des tokens : où vit le « sens »

L'industrie a convergé vers une **stratification des tokens en niveaux**, du brut au
contextuel [8] :

| Niveau | Aussi appelé | Contient | Exemple |
|---|---|---|---|
| **Primitive / global** | *option*, *base* | valeurs **brutes**, sans intention | `orange-500 = #fa4d1f` |
| **Semantic / alias** | *decision*, *flavor* | **intention**, thémable | `color-primary = {orange-500}` |
| **Component** | *atom token* | rôle **par composant/support** | `button-bg = {color-primary}` |

La règle d'or, partagée par Salesforce, le DTCG et les *handoffs* Figma modernes : **un
composant ne consomme jamais une valeur brute**, seulement un token **sémantique** ou
**de composant** ; on **structure les collections Figma pour refléter cette architecture à 3
couches** afin que les changements se **propagent** de façon fiable [8].

> 🔑 C'est **exactement** la cascade de `examples/blog` : `--brand-*` (primitive) →
> `--fl-*` (*flavor* = semantic, thémable via `.dark`) → `--color-*` (atom = component). La
> nouveauté noumanity (la couche **Topology**) est analysée en §8.

---

## 4. La verticale conception → intégration : rôles, artefacts, interfaces

La valeur des tokens n'est pas (seulement) technique : elle est **organisationnelle**. Ils
forment l'**interface contractuelle** entre des **rôles** aux compétences distinctes [1][8].

### 4.1 Les rôles et leurs artefacts

| Rôle | Produit | Consomme | Outil typique |
|---|---|---|---|
| **Designer** | *primitive* + *semantic tokens*, maquettes | brief de marque | Figma (variables, modes) |
| **Mainteneur de design system / template** | *component tokens*, composants, thèmes | tokens sémantiques | Style Dictionary, Tokens Studio |
| **Intégrateur** | pages, écrans | *component tokens*, composants | Tailwind, CSS, framework |
| **IA** (rôle émergent) | génère maquettes / code / tokens | tokens + specs | outils IA de design (62 % des équipes en 2024 [5]) |

### 4.2 Le *handoff* moderne : du « pixel-peeping » à la référence de token

Le transfert designer→développeur s'est déplacé d'une **inspection de pixels** vers une
**référence de token** : dans Figma Dev Mode, le développeur lit la **collection**, le **mode**
et l'**alias** jusqu'à la valeur brute ; une **GitHub Action** peut transformer une mise à jour
de variable en **PR de tokens CSS** [8]. La chaîne devient **automatisable et traçable** :

```
Figma variables ──(export DTCG/JSON)──► Style Dictionary ──(transforms)──► CSS / iOS / Android…
       ▲                                                                         │
       └──────────────── GitHub Action / PR (boucle de synchronisation) ◄────────┘
```

### 4.3 Le token comme **contrat**

Le point décisif : **chaque rôle ne dépend que de l'interface de tokens du rôle amont**, jamais
de ses détails internes. Le designer peut changer une primitive ; tant que le **token
sémantique** garde son nom, l'intégrateur n'a **rien** à refaire. C'est une **séparation des
préoccupations** appliquée à l'organisation — et la condition d'un **travail à plusieurs sans
friction**, y compris quand certains rôles sont tenus par une **IA**.

---

## 5. Les outils et la sémantique qu'ils **imposent**

Aucun outil n'est neutre : chacun **incarne une théorie** de la sémantique [3][6][8][9].

- **Style Dictionary** (créé par Danny Banks chez Amazon ; équipe Tokens Studio rejointe en
  août 2023) : tokens **JSON** → cibles multiples via des *transforms*. Impose une pensée
  **« source unique, multi-plateforme »** ; sépare nettement *primitive*/*semantic*/*component*
  [1][6].
- **Tokens Studio (Figma)** : édition de tokens dans Figma, **alignée DTCG** ; impose la
  discipline des **alias** et des **thèmes** [6][8].
- **Figma variables + Dev Mode** : impose les **modes** (= thèmes/contextes) comme primitive de
  premier ordre ; rend l'**alias chain** visible [8].
- **DTCG (format JSON)** : impose un **vocabulaire de `$type`** (color, dimension, fontFamily…)
  et la résolution d'**alias** ; le « contrat » d'**interopérabilité** entre outils [6][7].
- **Tailwind v4 (`@theme`)** : impose le **CSS-first** ; les tokens **sont** des variables CSS,
  thémables sans build, mais la sémantique vit surtout dans l'**échelle d'utilitaires** [9][10].
- **CSS « vanilla » (custom properties + `@layer`)** : le **socle commun** ; impose peu, mais
  fournit les **primitives d'exécution** (héritage, thème par scope, cascade par couches) [3].

> 🔑 **Pour noumanity** : viser une **source de vérité au format DTCG** (interopérable Figma ↔
> code) **exportée** vers (a) du **CSS** (web, cf. `examples/blog`) et (b) le **`branding.yml`**
> du générateur Beamer (slides). Une marque, deux cibles, **zéro divergence**.

---

## 6. Tendances actuelles (2024-2026), en bref

- **Standardisation** : DTCG 1.0 (2025.10) adopté par Figma/Sketch/Penpot → l'**échange de
  tokens** devient un acquis [6][7][8].
- **CSS-first / zero-config** : Tailwind v4, retour du CSS déclaratif, fin des *configs* JS
  lourdes [9][10].
- **Couleur perceptuelle** : **OKLCH** et CSS Color 4 → palettes **cohérentes** et calculables
  (clair/sombre, états) [6][7].
- **Theming natif** : `.dark`/`[data-theme]` + variables CSS → multi-thème **sans rebuild** [9].
- **IA dans la verticale** : génération top-down de layouts/code, en **tension** avec
  l'assemblage bottom-up d'Atomic Design (§7) [5].

---

## 7. Analyse critique d'Atomic Design

### 7.1 Ce qu'Atomic Design a apporté

Un **vocabulaire de composition partagé** (atom→molecule→organism→template→page) qui a
**démocratisé** la pensée *design system* et reste, en 2025, un **socle fondamental** pour
construire des systèmes scalables [5]. Sa force : un **modèle mental** simple, indépendant de
toute techno.

### 7.2 Les limites documentées

1. **Rigidité des 5 niveaux** : beaucoup de composants **n'entrent pas proprement** dans une
   case (éléments **contextuels** ou **multifonctions**) ; la frontière molecule/organism est
   notoirement **arbitraire** [5].
2. **Ambiguïté de nommage à l'échelle** : en contexte **entreprise**, les catégories
   corrèlent mal avec les applications réelles ; la complexité de l'UI a **explosé** depuis
   2013 [5].
3. **Pas de couche *tokens* à l'origine** : Atomic Design décrit la **composition** mais **pas
   la sémantique des valeurs** (couleur, espacement, typo). C'est précisément le **chaînon
   manquant** que les *design tokens* (2014) sont venus combler.
4. **Bottom-up vs IA top-down** : les outils IA (62 % des équipes en 2024) génèrent des layouts
   **de haut en bas**, ce qui **entre en conflit** avec l'assemblage **ascendant** d'Atomic
   Design [5].
5. **Adaptabilité** : le modèle gère mal les éléments qui **répondent au contexte**
   (préférences utilisateur, appareil, accessibilité) — il décrit des **pièces**, pas des
   **états** [5].

### 7.3 Le verdict de l'auteur lui-même

À la **SmashingConf New York 2024** (« Is Atomic Design Dead? »), **Brad Frost** indique que
s'il devait refaire Atomic Design, il **mettrait l'accent sur les *design tokens*** — devenus
la **couche de fondation** que son concept d'origine n'avait pas [5].

> 🔑 **Conclusion** : Atomic Design est **nécessaire mais non suffisant**. Il résout la
> **composition** (axe vertical atom→page) et laisse ouverte la **sémantique des valeurs** et la
> **séparation des rôles**. C'est exactement l'espace que noumanity veut combler.

---

## 8. Formalisation : **Quantomic Design** *(proposition noumanity)*

> ⚠️ **Proposition interne**, pas un standard de l'industrie. Elle **compose** des briques
> éprouvées (Atomic Design [5] + cascade de tokens primitive/semantic/component [1][8]) et y
> ajoute deux apports propres : une couche **Topology** et une **séparation explicite des
> rôles** comme contrat.

### 8.1 Définition

**Quantomic Design** est une méthodologie de design qui **croise deux axes orthogonaux** :

1. **L'axe de composition** (hérité d'Atomic Design) : `atom → molecule → organism → template
   → page` — *comment on assemble l'interface*.
2. **L'axe de la cascade de tokens** (la contribution structurante) :
   `Brand → Topology → Flavor → Atom` — *d'où viennent les valeurs et leur sens*.

Chaque **couche de tokens** est un **« token » au sens fort** : un *ensemble structuré, complet
et cohérent de données*, **stockable** et **consommable** dans des contextes variés (web,
slides, natif), et **produit/consommé par un rôle précis**.

### 8.2 Étymologie

*Quantomic* = **Atomic** (hommage à la composition de Frost) + **Quantum**. Les *tokens* y
jouent le rôle de la **fonction d'onde** : une **abstraction complexe mais structurante** qui
**encode l'état** (les décisions de design) sous une forme **dense et transportable**, qu'on
**« mesure »** (résout/transforme) différemment selon le **contexte** de rendu.

### 8.3 La cascade `Brand → Topology → Flavor → Atom`

| Couche Quantomic | Équivalent littérature | Rôle producteur | Contenu | Dans `examples/blog` |
|---|---|---|---|---|
| **Brand** | *primitive / global tokens* [8] | Direction de marque | valeurs brutes figées (orange `#fa4d1f`), paires clair/sombre | `--brand-*` |
| **Topology** | *(apport noumanity)* | Architecte de marque | **contrat** : *quels* tokens une marque **doit** exposer (schéma/invariant) | implicite (à formaliser) |
| **Flavor** | *semantic / alias tokens* [1][8] | Designer système | palette **sémantique** thémable (primary, neutres, états, bg/fg) | `--fl-*` (+ `.dark`) |
| **Atom** | *component tokens* [8] | Intégrateur / template | **rôles** par support (web, slides) | `--color-*` |

**L'apport `Topology`** est le **point original** : une couche de **contrat structurel** entre
la marque (Brand) et son interprétation (Flavor). Elle répond à un défaut observé au ticket 004
(le « secondaire » valait blanc, noir **ou** sable selon la source) : **figer *ce que* la marque
expose** garantit que *n'importe quel* intégrateur, humain ou IA, produit une expression
**uniforme** — sans décision laissée à sa charge.

### 8.4 Les deux axes sont orthogonaux (et c'est l'idée clé)

- L'axe **composition** (atom→page) répond à *« comment je construis cet écran ? »*.
- L'axe **cascade de tokens** (Brand→Atom) répond à *« d'où viennent ses valeurs et leur
  sens ? »*.

Un **atom** (au sens composition, ex. un bouton) **consomme** des **atom tokens** (au sens
cascade, ex. `--color-filter-bg`). Les deux « atom » se rencontrent à l'intégration : c'est là
que **composition** et **sémantique** se **résolvent** ensemble en pixels.

### 8.5 Les rôles et le contrat (la « verticale » noumanity)

Quantomic érige la **séparation des rôles en principe**, le token étant l'**interface** :

```
Marque ──Brand──► Architecte ──Topology──► Designer système ──Flavor──► Intégrateur ──Atom──► Page
 (humain)            (humain/IA)              (humain/IA)                  (humain/IA)
```

Chaque rôle **ne dépend que du token amont** ; il peut être tenu par un **humain ou une IA**
indifféremment, ce qui **minimise les frictions** du travail multi-spécialités — l'objectif
explicite du projet.

---

## 9. Application à noumanity & recommandations

1. **Adopter la cascade Quantomic comme topologie de marque canonique** (cf. ticket 004 t.4),
   et la **documenter** comme contrat (couche *Topology*).
2. **Source de vérité unique au format DTCG** [6][7] : éditée dans Figma (variables/modes [8]),
   versionnée, et **transformée** (Style Dictionary [1]) vers :
   - **CSS** pour le web (cf. `examples/blog`),
   - **`branding.yml`** pour le générateur Beamer (slides ; cf. ADR-001/002).
3. **Couleur en OKLCH** [6][7] pour des dérivations clair/sombre et états **calculables et
   cohérentes**.
4. **Theming natif** (`.dark`/`[data-theme]` + variables CSS [9]) — pas de rebuild.
5. **Intégrer l'IA comme rôle de la verticale** : lui fournir le **contrat de Topology** + les
   *flavors* comme **entrées**, pour qu'elle produise des *atoms*/pages **conformes par
   construction**.
6. **Conserver Atomic Design pour la composition** (atom→page), **complété** par la cascade de
   tokens pour la sémantique — exactement la leçon de Frost lui-même [5].

---

## 10. Sources

1. Smashing Magazine — *Smashing Podcast Ep.3 with Jina Anne: What Are Design Tokens?* (origine du terme, Salesforce, 2014 ; « méthodologie, pas variables »). https://www.smashingmagazine.com/2019/11/smashing-podcast-episode-3/
2. Design Systems Collective — *The incomplete history of Design Tokens* (D. Lewis). https://www.designsystemscollective.com/the-incomplete-history-of-design-tokens-61581c573e5d
3. ThamizhElango Natarajan — *The Complete Evolution of CSS Architecture: From Chaos to Compile-Time Optimization* (Medium, janv. 2026). https://thamizhelango.medium.com/the-complete-evolution-of-css-architecture-from-chaos-to-compile-time-optimization-1524ef4e69b2
4. *Methodologies — BEM, OOCSS, SMACSS, ACSS, ITCSS for CSS Architecture* (Medium) ; *The State of CSS 2019: Methodologies*. https://2019.stateofcss.com/technologies/methodologies/
5. Brad Frost — *Atomic Design* (atomicdesign.bradfrost.com) ; *Is Atomic Design Dead?* SmashingConf NY 2024 (https://www.youtube.com/watch?v=-3Pji_frbII) ; *Is Atomic Design Still Relevant in 2025?* (Design Systems Collective). https://atomicdesign.bradfrost.com/chapter-2/
6. W3C Design Tokens Community Group — *Design Tokens specification reaches first stable version* (2025-10-28). https://www.w3.org/community/design-tokens/2025/10/28/design-tokens-specification-reaches-first-stable-version/
7. Design Tokens Format Module 2025.10 (draft stable ; OKLCH/CSS Color 4, alias, theming). https://www.designtokens.org/tr/drafts/format/
8. Figma — *Design Tokens: How to Sync Design and Code* & *Schema 2025: Design Systems Recap* (Dev Mode, modes, alias chain, Code Connect, GitHub Action variables→CSS). https://www.figma.com/resource-library/design-tokens/ ; https://www.figma.com/blog/schema-2025-design-systems-recap/
9. Tailwind Labs — *Tailwind CSS v4.0* (directive `@theme`, CSS-first, variables au runtime). https://tailwindcss.com/blog/tailwindcss-v4 ; *Theme variables*. https://tailwindcss.com/docs/theme
10. Mavik Labs — *Design Tokens That Scale (Tailwind v4 + CSS Variables)*. https://www.maviklabs.com/blog/design-tokens-tailwind-v4-2026/
11. Style Dictionary — *Design Tokens Community Group* (Danny Banks/Amazon ; Tokens Studio, août 2023). https://styledictionary.com/info/dtcg/

> *À revalider à l'approche de toute publication* : statut/version DTCG, version majeure de
> Tailwind, état des variables Figma (import/export DTCG). L'écosystème *design tokens* évolue
> rapidement (2024-2026).
