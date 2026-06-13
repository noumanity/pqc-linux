# Méréologie, théorie quantum-like et l'essence d'un tout : vers une méréologie contextuelle des tokens

> Statut : essai de fondation (tâche 7 du ticket 004). Étend [FND-002](FND-002-pratiques-design-web-tokens-et-quantomic-design.md) et surtout [FND-004](FND-004-token-design-invariant-et-topologic-design.md) (qui laissait ouverte, en §10.4, la modélisation du livrable matériel comme rapport tout/parties).
> Date : 2026-06-13.
> Objectif : répondre à la question « qu'est-ce qu'un tout (un individu) et quels sont ses invariants ? » en croisant deux corpus, la méréologie (théorie philosophique du rapport partie-tout) et la modélisation quantum-like (Khrennikov), puis en tirer une lecture du système de tokens de noumanity et une recommandation de nommage (Topologic vs Quantomic).
> Note de rigueur : trois registres sont distingués partout. (a) Théorie établie et sourcée (méréologie, quantum-like, contextualité de Kochen-Specker). (b) Analogie outillée entre le formalisme quantum-like et les design tokens : c'est une proposition heuristique de noumanity, jamais une affirmation de physique. (c) Décisions de nommage et de design propres à noumanity. Tout énoncé du registre (b) ou (c) est marqué « proposition ».

## 1. Avertissement méthodologique

La méréologie et la théorie quantum-like sont des domaines sérieux et techniques. On en présente les résultats stables avec sources. L'application au design (l'idée qu'un livrable serait décrit par une « fonction d'onde sur une base de tokens ») est une métaphore structurante, féconde pour penser et outiller, mais qui ne prétend à aucune réalité physique. On signale donc soigneusement où finit la théorie et où commence l'analogie. Cet essai est volontairement exhaustif sur l'axe des composants (cf. ADR-003 §D7).

## 2. Cadrage, thèse et définitions

### 2.1 Question

Le ticket pose une récurrence tout/partie (atome, organe de niveau 1, 2, 3, individu) et demande : quels principes permettent d'identifier un tout (un individu) ? quels en sont les invariants ? Il propose aussi une intuition forte : une partie n'est pas un objet fixe mais une lecture contextuelle ; changer de contexte transforme l'état de l'ensemble des tokens ; les ratés des design tokens seraient des interférences destructives dues à un traitement incohérent.

### 2.2 Périmètre

Dans le périmètre : la méréologie (rapport partie-tout, composition, identité d'un tout), la modélisation quantum-like (contextualité, interférence, intrication, en tant que formalisme appliqué hors physique), et la jonction des deux pour modéliser le livrable de communication. Hors périmètre : la physique quantique en tant que telle (on n'en discute que la notion de contextualité), et l'implémentation concrète du branding (traitée au ticket 004, tâche 4).

### 2.3 Définitions de travail

- Méréologie : théorie formelle de la relation de partie à tout (du grec meros, partie).
- Tout (ou individu) : un objet composé qui compte comme une unité, par opposition à un simple tas (aggregat) de parties.
- Composition : la relation par laquelle plusieurs objets forment un tout.
- Modélisation quantum-like (Khrennikov) : usage du formalisme mathématique de la mécanique quantique (espace de Hilbert, probabilités non kolmogoroviennes) pour décrire des systèmes sensibles au contexte hors physique (cognition, décision, économie).
- Contextualité (Kochen-Specker) : le fait que la valeur d'une observable n'est pas préexistante mais dépend du contexte de mesure, c'est-à-dire des autres observables mesurées simultanément.

### 2.4 Thèse

Un tout n'est pas la simple somme de ses parties : c'est l'invariant (l'identité, l'intention) qui individue le tout et fait que des parties éparses comptent comme « une » chose. Or les parties d'un livrable de communication sont contextuelles (elles changent selon le support), ce que la méréologie classique, dite extensionnelle, ne sait pas modéliser car elle est sans contexte. Le formalisme quantum-like fournit, par analogie, le langage manquant : une partie est une lecture relative à un contexte (une base), le passage d'un support à l'autre est un changement de base qui transforme l'état global, et l'incohérence des tokens se lit comme une interférence destructive. La synthèse proposée est une méréologie contextuelle des tokens.

## 3. Historique

### 3.1 Méréologie

La théorie formelle du rapport partie-tout naît avec Stanislaw Lesniewski (années 1910 à 1930), qui propose la « méréologie » comme alternative à la théorie des ensembles. Henry Leonard et Nelson Goodman la reformulent en 1940 sous le nom de « calcul des individus », dans une visée nominaliste (parler de parties d'individus plutôt que d'appartenance à des ensembles) [1][2]. La discussion contemporaine est structurée par Peter van Inwagen (Material Beings, 1990), qui pose la « question spéciale de la composition » [1][3].

### 3.2 Modélisation quantum-like

L'idée d'emprunter le formalisme quantique hors physique se développe à partir des années 1990 à 2000. Andrei Khrennikov en est une figure centrale : il défend que la mécanique quantique est le premier exemple d'une probabilité contextuelle, applicable à tout système sensible au contexte (cognition, psychologie, génétique, économie, finance) [4][5]. Le programme « quantum cognition » (notamment Busemeyer et Bruza) modélise par l'espace de Hilbert des effets non classiques de la décision humaine : effets d'ordre, incompatibilité d'observables mentales, interférence [5][6]. La racine physique de la contextualité est le théorème de Kochen-Specker (1967), précédé par Specker (1960) [7].

## 4. Revue de littérature et état de l'art

### 4.1 Méréologie classique extensionnelle

La méréologie classique (extensionnelle) repose sur quelques axiomes [1] : la relation de partie est réflexive (tout est partie de soi), antisymétrique et transitive (une partie d'une partie est une partie du tout) ; des principes de supplémentation (si un objet a une partie propre, il en a une autre, disjointe) ; l'extensionnalité (deux touts ayant exactement les mêmes parties propres sont identiques) ; et souvent la fusion non restreinte (toute collection d'objets a une somme). La transitivité correspond exactement à la récurrence du ticket (atome, organe, individu). L'extensionnalité est le point critique pour nous : elle rend le tout indifférent au contexte et à l'agencement, ce qui ne convient pas à un livrable de design (deux maquettes avec les mêmes éléments mais agencés autrement ne sont pas le même livrable).

### 4.2 La question spéciale de la composition (van Inwagen)

Van Inwagen distingue [1][3] : la question générale de la composition (quelles fusions existent ?) et la question spéciale (à quelles conditions des objets composent-ils un tout supplémentaire ?). Trois grandes réponses structurent le champ (cf. §5.2). Sa propre réponse, restrictive, est célèbre : des objets composent un véritable individu quand leur activité constitue une vie. Pour notre usage, on retient l'esprit (la composition n'est pas automatique : il faut une condition d'unité) plus que la lettre (le critère biologique).

### 4.3 Contextualité quantique (Kochen-Specker)

La contextualité quantique est le fait que les mesures d'observables ne révèlent pas de valeurs préexistantes : dans une théorie à variables cachées, la valeur attribuée dépend du choix des autres observables compatibles mesurées en même temps [7]. Le théorème de Kochen-Specker (1967) prouve qu'aucune théorie à variables cachées non contextuelle ne reproduit les prédictions quantiques pour des systèmes à plus de deux niveaux. Formulé autrement : le contexte (l'ensemble des observables co-mesurées) constitue en partie ce qui est mesuré [7]. C'est, mot pour mot, l'intuition du ticket : une partie est une lecture contextuelle qui n'est pas unique.

### 4.4 Modélisation quantum-like hors physique

Khrennikov soutient que le formalisme quantique modélise non seulement les systèmes physiques mais tout système sensible au contexte [4][5]. Les phénomènes importés sont : l'interférence (la probabilité d'un résultat n'est pas la somme classique des probabilités sur les chemins), l'intrication (des corrélations non décomposables entre sous-systèmes), l'incompatibilité (des observables non simultanément définies), et les effets d'ordre (mesurer A puis B diffère de B puis A) [5][6].

## 5. Panorama et taxonomie

### 5.1 Types de relations partie-tout

La littérature distingue plusieurs sens de « partie » (la transitivité naïve échoue parfois d'un sens à l'autre) : partie fonctionnelle (un composant qui joue un rôle), portion ou tranche (une part homogène), membre d'une collection, ingrédient, phase ou partie temporelle. Pour un livrable de design, la partie pertinente est surtout fonctionnelle (un élément qui porte un rôle dans la communication), ce qui rejoint la notion d'atom-token de FND-002 et FND-004.

### 5.2 Positions sur la composition

Trois positions cadrent le débat [1][3] :

- Nihilisme méréologique : la composition n'a presque jamais lieu ; il n'existe que des simples (les « atomes »), et « le tout » est une façon de parler.
- Universalisme (composition non restreinte) : n'importe quels objets composent un tout, aussi disparate soit-il.
- Position restreinte (modérée) : la composition n'a lieu que sous condition (van Inwagen : quand les parties constituent une vie ; plus généralement : quand existe un principe d'unité).

Pour le design, ni le nihilisme (qui nie le livrable comme tout) ni l'universalisme (qui ferait de n'importe quel tas un livrable) ne conviennent. La voie utile est la position restreinte : un livrable est un tout seulement quand ses parties sont unifiées par une intention (une ambiance, une identité). C'est notre critère d'unité (cf. §6).

### 5.3 Phénomènes quantum-like

Le menu des phénomènes mobilisables par analogie : interférence (les contributions de plusieurs lectures se renforcent ou s'annulent), superposition (un token n'a pas de valeur résolue tant qu'un contexte ne le mesure pas), changement de base (passer d'un support à l'autre, c'est exprimer le même état dans une autre base d'observables), intrication (certaines parties ne sont pas définissables indépendamment les unes des autres), effets d'ordre et incompatibilité (certaines décisions de design ne commutent pas).

## 6. Le coeur : qu'est-ce qu'un tout, et quels invariants ?

### 6.1 Le tout n'est pas la somme

La leçon conjointe de la méréologie restreinte et de la contextualité est qu'un tout digne de ce nom n'est pas réductible à l'ensemble extensionnel de ses parties. Il faut un principe d'unité. La question du ticket (« quels principes identifient un tout ? ») est donc la question spéciale de la composition, reformulée pour le design.

### 6.2 Principes d'identification d'un tout (proposition)

On propose quatre critères, hérités de la métaphysique et adaptés au design :

- Intégration causale ou fonctionnelle : les parties interagissent pour produire un effet que nul sous-ensemble ne produit seul (un livrable communique un message que ses éléments isolés ne portent pas).
- Clôture d'intention : il existe une intention unique (une ambiance, un objectif de communication) sous laquelle les parties se subordonnent.
- Frontière et complétude relative : le tout a une frontière (ce qui est dedans ou dehors) et se suffit pour son usage.
- Invariance sous transformation de contexte : le tout reste reconnaissable comme « le même » à travers ses réalisations sur des supports différents.

### 6.3 L'invariant : l'identité préservée

Le quatrième critère est l'invariant central, et il relie cet essai à FND-004 : ce qui individue un tout, c'est ce qui reste invariant quand on le déforme d'un support à l'autre, autrement dit l'essence de marque et l'intention de communication. C'est le sens (correct, comme métaphore) de « Topologic » : la topologie étudie les invariants préservés sous transformation continue [8]. Un livrable est « un » individu parce qu'un invariant (l'identité ou l'intention) traverse toutes ses lectures contextuelles.

## 7. La lecture quantum-like du système de tokens (proposition)

Cette section est explicitement analogique (registre b). Elle formalise l'intuition du ticket.

### 7.1 Le dictionnaire analogique

- Base de tokens : un ensemble de tokens joue le rôle d'une base d'un espace d'états ; l'identité-plus-intention d'une communication est un état (un vecteur) sur cette base.
- Contexte ou support : un contexte (web, slides, affiche) est une base de mesure, c'est-à-dire un point de vue imposé par un impératif d'usage et de matériel.
- Partie : une partie est la valeur d'un token lue dans un contexte donné ; elle n'est pas préexistante mais relative à la base, exactement comme une observable contextuelle de Kochen-Specker [7].
- Changement de support : passer d'un contexte à l'autre est un changement de base, c'est-à-dire une transformation de l'état global des tokens (pas une simple traduction locale).
- Cohérence ou incohérence : traiter les tokens de façon cohérente préserve l'état (interférences constructives) ; les traiter de façon incohérente, sur une base non reconnue comme telle, produit des interférences destructives, c'est-à-dire les ratés observés des design tokens (incohérences d'un support à l'autre, cf. FND-002 §7 et le « secondaire » ambigu du ticket 004 tâche 4).

### 7.2 Ce que l'analogie explique

L'analogie rend compte de plusieurs faits réels : pourquoi une décision locale (changer un token) a des effets non locaux (toute la communication bascule) ; pourquoi l'ordre des décisions de design peut compter (effets d'ordre, incompatibilité) ; pourquoi certaines parties ne se définissent pas isolément (intrication des parties dans une mise en page) ; et pourquoi l'uniformité exige de reconnaître la base de tokens comme telle et de la traiter de façon cohérente.

### 7.3 « Quantomic » reprend-il un sens ?

Oui, partiellement (proposition). Sous cette lecture, « Quantomic » (quantum plus atomic) cesse d'être une simple licence poétique : il désigne une méréologie où les atomes-parties sont contextuels et où l'état global obéit à une logique de type quantique (superposition, changement de base, interférence). On a donc deux noms qui éclairent deux facettes complémentaires : Topologic met l'accent sur l'invariant préservé, Quantomic sur la nature contextuelle des parties et de l'état. Recommandation au §10.4.

## 8. Comparaison et synthèse comparative

| Critère | Méréologie classique extensionnelle | Méréologie contextuelle proposée (quantum-like) |
|---|---|---|
| Statut des parties | objets fixes, préexistants | lectures relatives à un contexte (base) |
| Le tout | somme de ses parties (extensionnalité) | invariant individuant, irréductible à la somme |
| Rôle du contexte | aucun | constitutif (Kochen-Specker) |
| Changement de support | recombinaison locale | changement de base, transformation globale |
| Échec typique | n'explique pas l'incohérence inter-supports | l'explique comme interférence destructive |
| Nom associé | (aucun) | Quantomic (parties contextuelles), Topologic (invariant) |

La méréologie classique fournit l'ossature (transitivité, composition, identité) mais sa neutralité au contexte la disqualifie pour un livrable de communication. Le formalisme quantum-like fournit la couche manquante (contextualité, état global, interférence). La synthèse est une méréologie contextuelle.

## 9. Analyse critique

### 9.1 Limites de la méréologie pour le design

La méréologie classique est extensionnelle et atemporelle : elle ignore l'agencement, l'intention et le contexte, qui sont précisément l'essentiel d'un livrable. La transitivité naïve échoue d'un sens de « partie » à l'autre (un bouton est partie d'une page, une page partie d'un site, mais la composition fonctionnelle ne se transmet pas mécaniquement). La position restreinte demande un critère d'unité que la théorie ne fournit pas toute seule : il faut l'apporter (ici, l'intention ou l'ambiance).

### 9.2 Risques de l'analogie quantum-like

Le risque majeur est de prendre la métaphore pour une explication. Rien ici n'affirme que le design est « quantique » au sens physique. Le formalisme quantum-like est un langage probabiliste contextuel, utile et reconnu hors physique [4][5], mais son transfert au design reste à valider par des cas concrets (sous peine de numérologie). Deuxième risque : la sophistication peut masquer des problèmes simples (souvent, une incohérence de tokens est juste un défaut de gouvernance, pas une interférence destructive). Troisième risque : la théorie quantum-like de la cognition fait elle-même débat ; l'invoquer ne tranche rien, elle inspire.

### 9.3 Sur la référence à Khrennikov

L'intuition du ticket (l'origine des effets dans l'intrication des contextes) est dans l'esprit du programme de Khrennikov sur la probabilité contextuelle [4][5], mais on l'emploie comme cadre inspirant, non comme caution d'autorité. La valeur de l'analogie se mesurera à ce qu'elle permet de faire (cf. §10), pas à son prestige.

## 10. Application à noumanity et recommandations

### 10.1 Modéliser le livrable comme un tout contextuel

Recommandation : ne pas modéliser le livrable par une hiérarchie rigide de niveaux (atome, organe 1, 2, 3) à la Atomic Design (dont FND-004 §7 montre les limites), mais comme un tout dont les parties sont des lectures contextuelles de tokens, unifiées par une intention. La composition reste libre et récursive ; ce qui la gouverne, c'est l'invariant (identité plus ambiance).

### 10.2 Le critère d'unité opératoire

Pour décider si un assemblage est un livrable (un tout) et non un tas : vérifier les quatre critères du §6.2 (intégration fonctionnelle, clôture d'intention, frontière, invariance inter-contextes). C'est une checklist utilisable par un humain comme par une IA.

### 10.3 La cohérence comme transformation cohérente

Recommandation d'ingénierie : traiter explicitement la base de tokens (la reconnaître comme telle) et garantir que tout passage d'un support à l'autre est une transformation cohérente de l'état global, pas une retouche locale. Concrètement : une source unique de tokens (cf. FND-004 §10), des dérivations par support qui partent de l'invariant, et des contrôles d'uniformité inter-supports. C'est la parade aux interférences destructives.

### 10.4 Recommandation de nommage

Topologic et Quantomic éclairent deux facettes vraies et complémentaires (invariant préservé ; parties contextuelles et état global). Recommandation : retenir un nom principal et subsumer l'autre comme concept interne. Deux options défendables. Option A : garder Topologic Design comme nom principal (il parle d'invariance et de transformation, plus sobre et moins ésotérique pour un public professionnel), et traiter la lecture quantum-like comme un modèle interne (la méréologie contextuelle). Option B : adopter Quantomic Design si l'on assume pleinement le cadre quantum-like comme coeur conceptuel et différenciateur. Compte tenu du public (communauté Linux, professionnels) et du risque de paraître ésotérique, l'option A est recommandée, l'option B restant disponible pour un contexte plus théorique. Le choix final relève de vous (c'est une décision de marque).

### 10.5 Prochaines étapes concrètes

Prototyper sur un cas réel : prendre une identité plus une ambiance, produire le même livrable sur deux supports (slides et web), et vérifier expérimentalement l'invariance (le livrable reste-t-il « le même individu » ?) et la cohérence (aucune interférence destructive). Ce test validera ou invalidera l'utilité de l'analogie, conformément au §9.2.

## 11. Lexique

- Méréologie : théorie formelle de la relation partie-tout.
- Composition : relation par laquelle des objets forment un tout.
- Extensionnalité : principe selon lequel deux touts ayant les mêmes parties sont identiques.
- Question spéciale de la composition : à quelles conditions des objets composent-ils un tout (van Inwagen).
- Nihilisme méréologique : thèse selon laquelle seuls existent les simples, pas les touts composés.
- Universalisme : thèse selon laquelle toute collection compose un tout.
- Mereological essentialism : thèse selon laquelle un tout a ses parties de façon essentielle (Chisholm).
- Contextualité : dépendance de la valeur d'une observable au contexte de mesure (Kochen-Specker).
- Quantum-like : usage du formalisme quantique (espace de Hilbert, probabilité non classique) hors physique.
- Interférence : renforcement ou annulation de contributions de plusieurs chemins ou lectures.
- Changement de base : réexpression d'un même état dans un autre repère d'observables.
- Invariant : ce qui reste inchangé sous une classe de transformations.

## 12. Synthèse

Un tout n'est pas la somme de ses parties : il est ce que rend « un » un invariant (identité plus intention) qui traverse toutes ses lectures. La méréologie classique donne l'ossature partie-tout mais, étant extensionnelle, ignore le contexte. Le formalisme quantum-like (Khrennikov, contextualité de Kochen-Specker) fournit le langage manquant : la partie est contextuelle, le support est une base, le passage d'un support à l'autre est un changement de base qui transforme l'état global, et l'incohérence des tokens est une interférence destructive sur une base non reconnue. La synthèse est une méréologie contextuelle des tokens, qui donne à Quantomic un sens technique et conforte Topologic comme nom d'invariance. Pour noumanity : modéliser le livrable comme un tout contextuel unifié par l'intention, traiter explicitement la base de tokens, garantir des transformations cohérentes entre supports, et prototyper pour valider l'analogie avant de la théoriser davantage.

## 13. Limites

L'analogie quantum-like est une heuristique, pas une théorie validée du design : elle doit être éprouvée sur des cas (proposition au §10.5). La méréologie mobilisée est surtout la tradition analytique anglophone ; d'autres approches (théorie des catégories, systèmes, théorie des graphes) mériteraient d'être confrontées. La théorie quantum-like de la cognition est elle-même discutée dans la littérature, donc citée comme inspiration, non comme preuve. À revalider : la pertinence des renommages (Topologic, Quantomic, Ambiance) à l'usage, et l'articulation avec l'implémentation concrète du branding (ticket 004).

## 14. Sources

1. Stanford Encyclopedia of Philosophy, Mereology (parthood, composition, extensionnalité, positions). https://plato.stanford.edu/entries/mereology/
2. Leonard, H. S. et Goodman, N. (1940), The Calculus of Individuals and Its Uses, Journal of Symbolic Logic (reformulation nominaliste de la méréologie de Lesniewski).
3. van Inwagen, P. (1990), Material Beings, Cornell University Press (question spéciale de la composition ; nihilisme, universalisme, position restreinte).
4. Khrennikov, A., Quantum-like Probabilistic Models outside Physics (probabilité contextuelle ; application hors physique). https://arxiv.org/abs/physics/0702250
5. Khrennikov, A., Quantum-like modeling: cognition, decision making, and rationality (programme quantum-like). https://www.researchgate.net/publication/346772527_Quantum-like_modeling_cognition_decision_making_and_rationality
6. Busemeyer, J. et Bruza, P. (2012), Quantum Models of Cognition and Decision, Cambridge University Press (effets d'ordre, interférence, incompatibilité).
7. Quantum contextuality (Kochen-Specker 1967 ; Specker 1960 ; la valeur d'une observable dépend du contexte). https://en.wikipedia.org/wiki/Quantum_contextuality
8. Topological space et Homeomorphism (invariants préservés sous transformation continue), Wikipedia. https://en.wikipedia.org/wiki/Topological_space

> À revalider : cet essai étend FND-002 et FND-004 ; toute évolution de la terminologie (Topologic, Quantomic, Ambiance) ou du modèle (méréologie contextuelle) doit y être répercutée, ainsi que dans le guide d'usage de la marque (ticket 004).
