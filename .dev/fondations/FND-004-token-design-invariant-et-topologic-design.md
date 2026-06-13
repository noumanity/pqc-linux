# Token Design : l'invariant du « token », clarification mathématique, et positionnement de **Topologic Design** — recherche

> **Statut** : essai de fondation (tâche 6 du ticket `004`). **Étend [FND-002](FND-002-pratiques-design-web-tokens-et-quantomic-design.md).**
> **Date** : 2026-06-13.
> **Objectif** : (1) définir **ce qu'est un *token*** en parcourant ses incarnations
> (philosophie, linguistique, compilation, sécurité, économie, **blockchain**, **IA**, **design**)
> et en dégager l'**invariant** ; (2) faire l'**histoire** et l'**analyse critique** du *Design
> Token* et de son **outillage** ; (3) **clarifier le vocabulaire mathématique** employé
> (espace, topologie, morphisme) en corrigeant les approximations ; (4) **positionner Topologic
> Design** (ex-*Quantomic Design*) comme **héritier** du Design Token ouvrant des perspectives
> nouvelles.
>
> ⚠️ **Note de rigueur** : trois registres sont **distingués explicitement** tout du long —
> (a) **faits sourcés** (rattachés à §13) ; (b) **métaphore/formalisme mathématique**, donné
> comme **analogie outillée**, jamais comme théorème ; (c) **proposition noumanity** (Topologic
> Design), clairement étiquetée. États techniques vérifiés à **juin 2026**, à revalider.

---

## 1. Avertissement méthodologique

- Le concept de *token* est **polysémique** : chaque domaine a sa définition. On compare des
  **usages**, on ne réduit pas l'un à l'autre.
- Les **définitions mathématiques** (espace, topologie, morphisme) sont des **faits de manuel**
  ; leur **application au design** est une **analogie** que l'on assume comme telle.
- *Topologic Design* est un **travail en cours** de noumanity : ce qui en relève est marqué
  **(proposition)**.

## 2. Cadrage, thèse et définitions

### 2.1 Question

> *Y a-t-il un **invariant** entre les usages du mot « token » — et si oui, en quoi le **Design
> Token** en est-il une instance, et **Topologic Design** un prolongement ?*

### 2.2 Périmètre

- **Dans** : la **notion** de token (transverse), le **Design Token** (histoire, outils,
  critique), le **vocabulaire mathématique** structurant, le **positionnement** de Topologic
  Design.
- **Hors** : l'implémentation concrète du branding noumanity (cf. ticket 004, tâche 4,
  [`04-analyse-topologie-branding.md`](../tickets/TKT-004-branding-noumanity/04-analyse-topologie-branding.md)) ; les détails de
  chaînes crypto/IA au-delà de ce qui éclaire l'invariant.

### 2.3 Définitions de travail

- **Token** (proposé, §5) : une **indirection nommée** — un symbole discret, identifié, qui
  **tient lieu** d'une valeur/d'un sens/d'un droit, **défini une fois** et **résolu/consommé**
  ailleurs.
- **Design Token** : application de ce patron aux **décisions de design** (cf. FND-002).
- **Topologic Design** *(proposition)* : un design **par invariants** — on fige l'**essence**
  (identité + intention) et on laisse le **réalisé** se déformer pour épouser chaque support.

### 2.4 Thèse

Le mot « token » recouvre **un même geste** : *introduire un intermédiaire stable pour
coordonner du sens ou de la valeur entre des contextes et des acteurs hétérogènes*. Le Design
Token est ce geste **appliqué au design** ; Topologic Design en est une **lecture par
l'invariance** qui s'inscrit dans l'évolution de l'industrie tout en visant le **livrable
final**.

---

## 3. Qu'est-ce qu'un token ? — panorama transverse

On parcourt les domaines du plus abstrait au plus appliqué.

### 3.1 Philosophie & linguistique : la distinction *type / token* (la racine)

C'est l'**origine conceptuelle**. Charles S. **Peirce** introduit en **1906** la distinction
**type ↔ token** : le **type** est l'entité **abstraite et générale** (≈ une classe) ; le
**token** est son **occurrence concrète**, spatio-temporelle (≈ une instance) [1][2]. Exemple
canonique : dans « *the cat sat on the mat* », il y a **trois** *tokens* du **type** « the »
selon qu'on compte les occurrences ou les formes [1]. **Idée clé** : un token **instancie** un
type ; il **porte une identité** tout en **renvoyant** à un général.

### 3.2 Compilation : le *token* lexical

Un **analyseur lexical** découpe le code en **tokens** : des **lexèmes classés** (catégorie +
valeur), p. ex. `IDENT("x")`, `NUMBER(42)`. Le token est un **handle** que le parseur consomme
— une **abstraction de surface** au-dessus des caractères bruts. *(fait de manuel ; cf. théorie
des langages.)*

### 3.3 Sécurité / authentification : le *token* porteur de droits

Un **access token** / **session token** est un **porteur d'autorité** : il **représente** une
identité et des **revendications** (*claims*), **émis une fois** puis **présenté** à chaque
ressource. Le token **découple** la preuve d'accès des **identifiants** d'origine. *(fait de
manuel ; OAuth/JWT.)*

### 3.4 Économie / physique : le jeton comme substitut de valeur

Le **jeton** d'arcade, de casino, de transport : un **stand-in** matériel pour de la valeur,
**fongible**, **émis** par une autorité et **accepté** dans un périmètre. La portabilité et la
substituabilité priment sur la matière.

### 3.5 Blockchain : le token comme unité de valeur/droit sur un registre

Sur une chaîne, un **token** est une **unité inscrite et vérifiée** sur un registre distribué
[3]. Taxonomie usuelle [3][4] :

- **Fongibles** (ex. BTC, ERC-20) : **interchangeables**, valeur uniforme.
- **Non-fongibles (NFT)** : **uniques**, non interchangeables 1-pour-1.
- par usage : **paiement**, **utility** (accès à un service), **security** (représente un actif
  financier ; aux É.-U. qualifié via le **test de Howey**) [3].

Le token y est une **représentation** transférable d'un **actif/droit**, dont l'**identité** et
la **provenance** sont garanties par le registre.

### 3.6 Intelligence artificielle : le token comme unité de traitement du sens

Pour un LLM, un **token** est la **plus petite unité** en laquelle on découpe le texte, ensuite
convertie en **ID numérique** puis en **embedding** — un **vecteur** qui capture du sens [5][6].
La **tokenisation sub-mot** (entre caractère et mot) est dominante [5][6] :

- **BPE** (*Byte Pair Encoding*) : **ascendant**, fusionne itérativement les paires les plus
  fréquentes ; utilisé par GPT [5][6].
- **WordPiece** : variante qui fusionne pour **maximiser la vraisemblance** ; BERT [6].
- **SentencePiece** : **bibliothèque** opérant sur le **flux brut** (espace → marqueur `▁`),
  sans pré-découpage par langue [6].

Le token y est l'**atome de sens manipulable** : une **unité discrète** sur laquelle se fait le
calcul, **portant** une part de signification.

### 3.7 Design : le token comme décision de design (cf. FND-002)

Le **design token** (Jina Anne, Salesforce, **2014**) stocke une **décision de design** sous un
**nom**, **agnostique de la plateforme**, **transformable** vers chaque cible [7]. *« Dire que
les design tokens ne sont que des variables, c'est comme dire que le responsive design n'est que
des media queries »* — c'est une **méthodologie** [7]. (Détail historique/outillage : §6–§7.)

---

## 4. (Tableau) Les tokens, d'un domaine à l'autre

| Domaine | Ce que le token **représente** | Émis/défini par | Consommé/résolu par |
|---|---|---|---|
| Philo/linguistique | une **occurrence** d'un type | l'usage | le décompte / l'interprétation |
| Compilation | un **lexème classé** | le *lexer* | le *parser* |
| Sécurité | des **droits/claims** | l'émetteur (IdP) | les ressources |
| Économie/physique | de la **valeur** | une autorité | un périmètre d'acceptation |
| Blockchain | un **actif/droit** | un contrat/registre | portefeuilles, marchés |
| IA / LLM | une **unité de sens** | le *tokenizer* | le modèle (embeddings) |
| Design | une **décision de design** | designer / *design system* | code, slides, natif |

---

## 5. L'invariant : l'essence commune de « token »

En recoupant §3–§4, l'**essence** se dégage — et elle **est** la distinction type/token de
Peirce, généralisée [1][2] :

> **Un token est une *indirection nommée et identifiée* : un symbole discret qui *tient lieu*
> d'une réalité de valeur ou de sens, *définie une fois* puis *transportée, échangée, résolue
> ou composée* dans de multiples contextes — découplant le *handle* de son *référent*.**

Quatre propriétés invariantes :

1. **Indirection** — le token **n'est pas** la chose ; il y **renvoie** (type ↔ token).
2. **Identité** — il est **nommé/identifiable**, donc **réutilisable** et **traçable**.
3. **Define-once / use-everywhere** — défini **à un endroit**, consommé **partout**.
4. **Portabilité / substituabilité** — il **traverse** les contextes ; sa **valeur résolue**
   peut varier (par plateforme, par thème) sans que son **identité** change.

**Quel problème résout-il ?** La **coordination du sens/de la valeur** entre des **acteurs et
des contextes hétérogènes**. Le token est le **point de contrat** qui permet à plusieurs
(humains, machines, IA) de **partager une décision** sans la **recopier** — donc sans **diverger**.

**Quelle réalité décrit-il ?** Celle d'un **système distribué de significations** : dès qu'une
**même décision** doit valoir en **plusieurs lieux**, on a besoin d'un **représentant stable**.
Le token **est** ce représentant. *(C'est exactement le besoin du branding noumanity — cf.
ticket 004, tâche 4.)*

---

## 6. Historique de la notion de Design Token (extension de FND-002 §2)

- **2014** — Jina Anne forge « design token » au **Salesforce Lightning Design System** ;
  valeur **transformée** vers iOS/Android/web depuis une **source agnostique** [7].
- **fin 2010s** — diffusion : **Style Dictionary** (créé par **Danny Banks**, Amazon) transforme
  des tokens JSON vers de multiples cibles ; l'équipe **Tokens Studio** rejoint l'effort en
  **août 2023** [8].
- **2014→2025** — montée des **niveaux** de tokens (primitive → semantic → component) comme
  standard *de facto* du *handoff* [8] (cf. FND-002 §3).
- **2025-10-28** — le **W3C Design Tokens Community Group** publie la **première version stable**
  (2025.10) du **format** : alias, *theming*, **OKLCH**/CSS Color 4 ; **pas** une norme W3C mais
  un format d'**interopérabilité** adopté par Figma/Sketch/Penpot [9][10].

**Tendance lourde** : du *bricolage* de variables vers un **format standard interopérable** —
le token devient une **monnaie d'échange** entre outils et rôles.

---

## 7. Outils — fonctionnement, forces, faiblesses, échecs (extension de FND-002 §5)

| Outil | Ce qu'il fait | Forces | Faiblesses / échecs |
|---|---|---|---|
| **Style Dictionary** [8] | tokens JSON → cibles multiples (*transforms*) | source unique, multi-plateforme, extensible | courbe d'entrée ; config verbeuse ; gouvernance des *transforms* |
| **Tokens Studio (Figma)** [8][9] | éditer des tokens dans Figma, alignés DTCG | au plus près du design ; alias/thèmes | dérive possible Figma↔code si pas de CI |
| **Figma variables + Dev Mode** [9] | *modes* (thèmes), chaîne d'alias visible, export DTCG | *handoff* = référence de token, plus du *pixel-peeping* | couverture partielle ; dépend de la discipline de collections |
| **DTCG (format)** [9][10] | JSON d'échange (`$type`, alias, theming, OKLCH) | **interopérabilité**, pérennité | jeune ; pas une norme W3C ; extensions encore mouvantes |
| **Tailwind v4 `@theme`** [11] | tokens = variables CSS, utilitaires générés | CSS-first, thème sans rebuild | sémantique surtout dans l'échelle d'utilitaires ; couplage au framework |
| **CSS natif (`--var`, `@layer`)** | socle d'exécution (héritage, thème par scope) | universel, zéro dépendance | n'impose **aucune** discipline → tout reste à structurer |

**Comment ils échouent** : (a) **sur-abstraction** (des tokens pour tout, illisibles) ;
(b) **nommage** incohérent (le talon d'Achille, cf. Atomic Design, FND-002 §7) ;
(c) **désynchronisation** design↔code sans automatisation (CI/PR) ;
(d) **angle mort du livrable final** : l'outillage excelle sur *primitive→component*, beaucoup
moins sur **la composition du livrable** lui-même.

---

## 8. Interlude mathématique — *espace*, *topologie*, *morphisme* (clarification demandée)

> Le ticket demande explicitement : *« topologie de token » est-il le bon terme ? quelle est la
> différence entre **espace** et **topologie** ?* Voici la mise au point — et **où le vocabulaire
> dérape**.

### 8.1 Ensemble → espace → topologie

- **Ensemble** : une collection d'éléments, **sans structure**.
- **Espace** : un **ensemble muni d'une structure**. Selon la structure : *espace vectoriel*
  (structure linéaire), *espace métrique* (une distance), *espace topologique* (une topologie).
- **Topologie** : une **structure précise** sur un ensemble `X` — une famille `𝒯` de
  « **ouverts** » vérifiant des axiomes (`∅` et `X` ouverts ; **unions quelconques** et
  **intersections finies** d'ouverts sont ouvertes). Elle encode la **proximité / la continuité
  sans recourir à une distance**. Un *espace topologique* est le **couple** `(X, 𝒯)`.

> ✅ **Donc** : **« espace » ≠ « topologie »**. La *topologie* est **la structure** ; l'*espace*
> est **l'ensemble + la structure**. Une même base peut porter **plusieurs** topologies.

### 8.2 Où « topologie de token » dérape (et comment le dire juste)

Ce que vous appelez « topologie de token » désigne en réalité **l'organisation structurée et
les correspondances entre couches** de tokens (Brand → Ambiance → Atom → livrable). Or :

- Ce n'est **pas** une *topologie* au sens des ouverts (il n'y a pas de notion de « proximité »
  pertinente entre tokens).
- C'est **une famille d'espaces** (chaque couche = un ensemble structuré) **reliés par des
  applications qui préservent la structure**. **Le cadre mathématique exact de ce tableau, c'est
  la *théorie des catégories*** : des **objets** (les couches/espaces) et des **morphismes**
  (les applications entre couches). Votre intuition d'une **« chaîne de morphismes via des
  applications entre différents types d'espaces, de l'essence de marque jusqu'au livrable »**
  est **précisément** une **lecture catégorique/fonctorielle** — le bon mot est **morphisme**
  (voire **foncteur**), **pas topologie** [12].

### 8.3 Pourquoi « **Topologic** Design » reste néanmoins **pertinent** (comme métaphore)

Le **cœur** de la topologie est l'étude des **invariants préservés sous transformation
continue** (deux objets « identiques » à déformation près sont *homéomorphes*) [13]. Or votre
système vise exactement cela : **préserver l'identité de marque (l'invariant) tandis que le
réalisé se déforme** pour épouser chaque support. **C'est un design par invariants.**

> 🎯 **Recommandation de vocabulaire** :
> - garder **« Topologic Design »** comme **nom-métaphore** (✓ il évoque *l'invariance sous
>   transformation* — idée juste et marquante) ;
> - mais, pour le **formalisme**, parler de **catégorie / morphismes / foncteurs** (✓ exact),
>   et réserver « topologie » à son sens technique ;
> - et utiliser **« espace »** correctement : *la marque définit l'**espace** des Ambiances
>   admissibles ; une Ambiance est un **point** de cet espace ; le livrable en est une
>   **réalisation**.*

### 8.4 Une esquisse formelle honnête (analogie, pas théorème)

On peut **modéliser** la chaîne comme une suite de morphismes :

```
Essence(marque) ──f──► Branding ──g──► Ambiance ──h──► Atomes ──k──► Livrable
        (identité)              (intention)            (matériel)
```

- chaque flèche **préserve** ce qui doit l'être (l'identité descend intacte) ;
- **bien communiquer** = la **cohérence** (commutativité, au sens intuitif) entre la chaîne
  **verbale** (message/contenu) et la chaîne **non verbale** (style/graphisme) ;
- l'**invariant** (l'essence) est ce qui reste **inchangé** le long de toute la chaîne — d'où
  « topologic ».

> ⚠️ **Honnêteté** : c'est une **analogie structurante**, utile pour penser et outiller, **non**
> une preuve. Elle suggère néanmoins des tests concrets (un changement de couche ne doit pas
> altérer l'identité ; deux chemins doivent donner un résultat cohérent).

---

## 9. Analyse critique du Token Design

**Forces** : *define-once/use-everywhere*, interopérabilité (DTCG), thématisation, séparation
des rôles (FND-002 §4). Le token est un **excellent contrat** entre acteurs.

**Limites / risques** :

1. **Nommage** — la sémantique vit dans les **noms** ; mal nommés, les tokens **trompent** plus
   qu'ils n'aident (même mal qu'Atomic Design, FND-002 §7).
2. **Sur-abstraction** — multiplier les couches a un **coût cognitif** ; l'indirection peut
   **masquer** la valeur réelle.
3. **L'angle mort du livrable** — l'outillage couvre **primitive→component** mais **pas** la
   **composition du livrable final** (le « tout » et ses « parties »). C'est exactement le point
   que vous identifiez comme **non résolu**.
4. **Bottom-up vs top-down** — les *design tokens* alimentent un assemblage **ascendant**, alors
   que les **IA graphiques** travaillent **top-down** (« *begin with the end in mind* ») — d'où
   une tension à arbitrer (FND-002 §7 ; Brad Frost dirait aujourd'hui « insister sur les
   tokens »).

---

## 10. Topologic Design — positionnement et extension *(proposition noumanity)*

### 10.1 Renommages et raison d'être

- **Quantomic → Topologic Design** : on **abandonne le calque d'Atomic Design** (la chaîne
  *molecule→organism→…* n'est plus une cible). On garde l'idée forte : **le design par
  invariants** (§8.3). FND-002 a montré l'**intérêt historique** **et** les **limites**
  d'Atomic Design — Topologic s'en émancipe.
- **Flavor → Ambiance** : la couche sémantique ne décrit pas un « parfum » mais une **atmosphère
  / émotion / effet recherché** sur l'audience — la **communication non verbale**. Le mot
  **Ambiance** colle mieux à cet **effet**.

### 10.2 Les deux **régimes** de token (votre distinction, formalisée)

1. **Régime *identité + intention*** (l'amont, immatériel) : **Brand** (qui est la marque) +
   **Ambiance** (ce qu'elle veut faire ressentir ici).
2. **Régime *livrable matériel*** (l'aval, concret) : **Atomes** → **Livrable**.

> Le **point dur** que vous nommez est réel : modéliser le **régime matériel** (le *tout* et ses
> *parties*) — voir §10.4.

### 10.3 Le **Brand-token** : essence vs expression (réponse à votre question)

Vous demandez si l'**essence** (valeurs, attitudes, caractère, émotions) doit être **dans** le
branding-token, ou **dans un token amont** consommé pour **produire** le branding-token.

**Recommandation** : **séparer en deux sous-couches**, exactement comme *primitive → semantic* :

- **Brand-DNA / Brand-strategy token** (amont, immatériel) : **mission, valeurs, archétype,
  personnalité, émotions, voix** — le **« pourquoi »** et le **« qui »**. *(C'est le registre du
  **design de marque**, pas de la technique — relève des cadres type **archétypes de marque**.)*
- **Brand-expression token** (aval, opérationnel) : couleurs, typographies, logo/isotipo, et la
  **liste des Ambiances admissibles** — le **« comment ça se montre »**.

→ Le **guide d'usage de la marque** (ticket 004, tâche 4) doit donc s'ouvrir sur le **Brand-DNA**
(l'essence) **avant** la technique. Et **oui** : la **liste des Ambiances** que la marque peut
exprimer appartient au **Brand-expression token** — la marque **définit l'espace** des Ambiances ;
chaque **Ambiance-token** en est un **point** (§8.3).

### 10.4 Modéliser le **livrable matériel** : *tout / parties*

Votre intuition « tout/parties » a un nom : la **méréologie** (théorie des relations
partie-tout). Pistes :

- **Ne pas** réimporter la taxinomie rigide d'Atomic Design (atom→…→page) — FND-002 §7 en montre
  les limites.
- Adopter une composition **récursive et libre** : un **Atome** est une **partie** ; un livrable
  est un **assemblage** de parties **gouverné par les tokens amont** (Brand/Ambiance). La
  **valeur** est dans le **livrable** (le *tout*) — d'où l'approche **top-down** des IA graphiques
  (« *begin with the end in mind* ») : **partir du livrable cible** et **dériver** les parties.
- Nom de la couche : **« Atome »** reste défendable (la **plus petite partie** porteuse de
  sens) ; alternatives « composant »/« material » possibles, mais **« material »** entre en
  collision avec *Material Design* (Google) — **à éviter** pour ne pas créer d'ambiguïté.

### 10.5 En quoi Topologic Design **se distingue** du Design Token

| Aspect | Design Token (industrie) | Topologic Design *(proposition)* |
|---|---|---|
| Centre de gravité | la **valeur** réutilisable | l'**invariant** (identité/intention) préservé sous transformation |
| Couverture | surtout **primitive→component** | **essence → Ambiance → atomes → livrable** (toute la chaîne) |
| Sens de travail | **bottom-up** | **top-down** assumé (partir du livrable) |
| Amont | rarement formalisé | **Brand-DNA** (valeurs/émotions) **explicite** |
| Cadre mental | variables/alias | **morphismes préservant l'invariant** (§8) |

→ **Topologic Design est une *redécouverte assumée* du Design Token** (on **hérite** du standard,
de DTCG, de l'outillage) **enrichie** de : (a) l'**amont d'identité** explicite, (b) la **couche
Ambiance** (effet), (c) l'orientation **top-down vers le livrable**, (d) une **grammaire par
invariants**.

### 10.6 Problématique attaquée & avenir

- **Problématique** : permettre à **plusieurs acteurs** (dont des **IA**) de produire des
  **communications cohérentes et reconnaissables** **de bout en bout** — du sens (verbal) au
  style (non verbal) — **sans décision laissée au hasard**.
- **Avenir** : crédible **parce qu'aligné** sur l'industrie (Design Token/DTCG) et **parce
  qu'il comble** ses angles morts (amont d'identité, livrable final, top-down/IA). Le risque est
  la **sur-promesse** : il faudra **prototyper** (un Brand-DNA + des Ambiances + un livrable
  dérivé) avant de théoriser davantage.

### 10.7 Comment **présenter** Topologic Design

> *« Topologic Design **prolonge les Design Tokens**. Là où le standard fige une **valeur**
> réutilisable, Topologic fige un **invariant** — l'**essence** d'une marque et l'**intention**
> d'une communication — et laisse tout le **réalisé** se déformer pour épouser chaque support.
> On hérite de l'outillage de l'industrie (DTCG, Style Dictionary, Figma) ; on y ajoute l'**amont
> d'identité**, la couche **Ambiance**, et une fabrique **top-down** orientée **livrable** —
> pensée pour le travail **à plusieurs, IA comprises**. »*

---

## 11. Synthèse

- Le mot **token** a un **invariant** : une **indirection nommée** qui **tient lieu** d'une
  valeur/d'un sens, **définie une fois** et **résolue partout** (racine : type/token de Peirce).
- Le **Design Token** est ce patron **appliqué au design** ; son histoire va du **bricolage** au
  **format standard interopérable** (DTCG 2025.10).
- **Correction mathématique** : « topologie de token » est **impropre** ; le cadre exact est la
  **théorie des catégories** (objets + **morphismes**). Mais **« Topologic Design »** est un
  **bon nom-métaphore** car la topologie étudie les **invariants sous transformation** — ce que
  le système vise. Employer **« espace »** au sens strict (la marque définit l'**espace** des
  Ambiances).
- **Topologic Design** *(proposition)* : héritier des Design Tokens, **étendu** vers l'**amont
  d'identité** (Brand-DNA), la couche **Ambiance**, et le **livrable** (top-down), modélisé comme
  une **chaîne de morphismes préservant l'invariant** de marque.

## 12. Limites

- L'**esquisse catégorique** (§8.4) est une **analogie outillée**, non un formalisme prouvé ;
  un travail dédié serait nécessaire pour la rendre opératoire (objets, morphismes, lois).
- La **modélisation du livrable matériel** (§10.4) reste **ouverte** : la méréologie donne un
  cadre, pas une recette.
- Le panorama des « tokens » (§3) est **représentatif**, non exhaustif (il existe d'autres
  acceptions : jetons de concurrence/*token ring*, jetons de jeu, etc.).
- **À revalider** : états DTCG/outils (écosystème mouvant, cf. FND-002) ; la pertinence des
  renommages (*Topologic*, *Ambiance*) à l'usage.

## 13. Sources

1. *Type–token distinction* — Wikipedia (Peirce, 1906 ; type ≈ classe / token ≈ instance). https://en.wikipedia.org/wiki/Type%E2%80%93token_distinction
2. *Types and Tokens* — Stanford Encyclopedia of Philosophy. https://plato.stanford.edu/entries/types-tokens/
3. *Fungible vs non-fungible tokens* — Cointelegraph (taxonomie ; paiement/utility/security ; test de Howey). https://cointelegraph.com/learn/articles/fungible-vs-nonfungible-tokens-what-is-the-difference
4. *Understanding Token Types: Fungible, Non-Fungible, Utility* — The Blockchain Academy. https://theblockchainacademy.com/understanding-token-types-a-deep-dive-into-fungible-non-fungible-and-utility-tokens/
5. *Byte Pair Encoding: tokenization* — Data Science Dojo. https://datasciencedojo.com/blog/byte-pair-encoding/
6. *Tokenization algorithms* (BPE/WordPiece/SentencePiece) — Hugging Face. https://huggingface.co/docs/transformers/en/tokenizer_summary
7. *What Are Design Tokens?* (Jina Anne, Salesforce, 2014) — Smashing Podcast Ep.3. https://www.smashingmagazine.com/2019/11/smashing-podcast-episode-3/
8. *Design Tokens Community Group* / Style Dictionary (Danny Banks, Amazon ; Tokens Studio, août 2023). https://styledictionary.com/info/dtcg/
9. Figma — *Design Tokens: How to Sync Design and Code* (Dev Mode, modes, alias, export DTCG). https://www.figma.com/resource-library/design-tokens/
10. W3C Design Tokens Community Group — *first stable version (2025.10)*, 2025-10-28. https://www.w3.org/community/design-tokens/2025/10/28/design-tokens-specification-reaches-first-stable-version/
11. Tailwind CSS — *v4.0* (`@theme`, tokens = variables CSS). https://tailwindcss.com/blog/tailwindcss-v4
12. *Category Theory* — Stanford Encyclopedia of Philosophy (objets, morphismes, foncteurs). https://plato.stanford.edu/entries/category-theory/
13. *Topological space* / *Homeomorphism* — Wikipedia (topologie = ouverts ; invariants sous transformation continue). https://en.wikipedia.org/wiki/Topological_space

> *À revalider* : ce document **étend FND-002** ; toute évolution de la terminologie (Topologic,
> Ambiance, Atome/partie) doit y être **répercutée**, ainsi que dans le guide d'usage de la
> marque (ticket 004).
