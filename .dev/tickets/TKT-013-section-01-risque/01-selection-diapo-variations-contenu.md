# Tâche 1 : sélectionner diapo, variations et contenu

> **Objet** : pour la section 1 « Au-delà de la fragilité cryptographique : la réponse de l'industrie », sélectionner la diapositive slide-02, ses trois variations (overlays), et proposer pour chacune les points de forme à afficher ainsi qu'un verbatim continu. Sources : récit [02-argumentaire-recit.md](../../artefacts/02-argumentaire-recit.md) (actes 2 et 3), plan [03-plan-10-diapos.md](../../artefacts/03-plan-10-diapos.md) (diapos 3 et 4), faits dans [FND-010](../../fondations/FND-010-risque-quantique-notion-et-prise-en-charge.md).

## 1. Décision de structure

slide-02 est une diapositive unique à **trois variations** (overlays Beamer sur une même frame, comme slide-01), une par mouvement du récit. Modèle `plain` (titre plus corps Markdown en points de forme), titre surchargé à chaque variation pour signaler la progression.

| Variation | Titre | Mouvement du récit | Source plan |
|---|---|---|---|
| 1 | Repenser la menace comme un risque | recadrer (acte 2) | diapo 3 |
| 2 | C'est déjà normalisé | responsabiliser, volet international (acte 3) | diapo 4 |
| 3 | Et le Canada ? | responsabiliser, volet canadien (acte 3) | diapo 4 |

Note de lecture du ticket : « CIST 2.0 » se lit NIST CSF 2.0 (Cybersecurity Framework), « FPIS » se lit FIPS. Les noms corrects sont utilisés ci-dessous.

## 2. Points de forme proposés par variation

### Variation 1 : Repenser la menace comme un risque

- Le « risque quantique » est un **déclencheur**, pas le sujet
- Il touche le **socle** de la cybersécurité, d'où un **double risque** : négliger (déni, peur) ou se laisser submerger par le battage
- Les deux mènent au même endroit : l'**inaction**
- *Harvest Now, Decrypt Later* : l'exposition est **déjà présente**
- Le vrai enjeu : gérer la cryptographie comme un **actif** et vérifier sa chaîne d'approvisionnement logiciel
- Mêmes pratiques **cyber et DevSecOps**, mais le niveau d'exigence est relevé
- Leitmotiv : **qu'arriverait-il si on n'agissait pas ?**

### Variation 2 : C'est déjà normalisé

- Le risque quantique se gère avec les **cadres existants** : NIST CSF 2.0 (fonction *Govern*), ISO 27005, FAIR
- Standards **NIST publiés** (août 2024) : FIPS 203 **ML-KEM**, FIPS 204 **ML-DSA**, FIPS 205 **SLH-DSA**
- Relais internationaux : **BSI, ANSSI, ETSI** ; déclaration du **G7**
- Calendrier réglementaire daté (NIST IR 8547) : dépréciation vers **2030**, retrait vers **2035**
- La parade existe et est normalisée : la question n'est plus « si » mais « **quand et comment** »

### Variation 3 : Et le Canada ?

- Le **Centre canadien pour la cybersécurité** (CCCS) s'appuie sur une variante du NIST CSF
- **Feuille de route** de migration ITSM.40.001 (en vigueur le 23 juin 2025)
- **Obligations contraignantes** pour les systèmes du gouvernement fédéral et ses sous-traitants, incluant l'inventaire cryptographique (**CBOM**)
- Guide aux organisations **ITSAP.00.017**
- Mesures d'**aide et d'accompagnement**
- Renvoi de la responsabilité : **et vous, en êtes-vous ?**

## 3. Verbatim proposé

Le verbatim suit les trois révélations dans l'ordre. Il est repris dans [src/slide-02/verbatim.md](../../../src/slide-02/verbatim.md).

### Variation 1

Alors, de quoi parle-t-on, si ce n'est pas de quantique ? On parle de risque. Posez-vous la question, froidement : si la cryptographie à clé publique, celle qui protège à peu près tout, devenait cassable, on fait quoi ?

Ce qui rend ce sujet inconfortable, c'est qu'il touche au socle même de notre cybersécurité. Et face à ça, je vois deux erreurs symétriques. La première : négliger, parce qu'on n'y croit pas, parce que ça fait peur, ou parce que ce n'est jamais la priorité. La deuxième : se laisser submerger par le battage médiatique, au point de ne plus voir l'enjeu réel. Les deux mènent au même endroit : l'inaction.

Or le risque quantique n'est qu'un déclencheur. Le vrai enjeu, c'est de gérer notre cryptographie comme un actif et de vérifier notre chaîne d'approvisionnement logiciel. Et il y a une urgence concrète, le *Harvest Now, Decrypt Later* : on capte vos données chiffrées aujourd'hui pour les déchiffrer plus tard. L'exposition est donc déjà là. Bonne nouvelle : ce sont les mêmes pratiques cyber et DevSecOps que vous connaissez déjà ; on relève simplement le niveau d'exigence sur ces actifs.

Alors posons la question qui va nous suivre toute la présentation : qu'arriverait-il si on n'agissait pas ?

### Variation 2

Et la réponse, c'est que le monde a déjà commencé à agir. D'abord, il n'y a rien de nouveau dans la façon de s'y prendre : on gère ce risque avec les cadres qu'on utilise déjà, le NIST Cybersecurity Framework 2.0 et sa fonction de gouvernance, l'ISO 27005, le modèle FAIR pour le chiffrer en dollars.

Ensuite, la parade existe. En août 2024, le NIST a publié trois standards finaux : ML-KEM pour l'échange de clés, ML-DSA et SLH-DSA pour les signatures. Ce n'est plus de la recherche, c'est normalisé. L'Allemagne avec le BSI, la France avec l'ANSSI, l'Europe avec l'ETSI, le G7 dans une déclaration commune : tout le monde pousse dans le même sens. Et il y a un calendrier : on déprécie les vieux algorithmes vers 2030, on les retire vers 2035. La question n'est donc plus « est-ce qu'il faut migrer », mais « quand et comment ».

### Variation 3

Et chez nous ? Le Canada a tranché lui aussi. Le Centre canadien pour la cybersécurité s'appuie sur sa propre variante du cadre NIST et a publié une feuille de route de migration, l'ITSM.40.001, en vigueur depuis juin 2025. Surtout, ce ne sont pas que des recommandations : il y a des obligations contraignantes pour les systèmes du gouvernement fédéral et pour ses sous-traitants, jusqu'à l'inventaire cryptographique, le CBOM, qu'on vous montrera tout à l'heure. À côté de l'obligation, il y a aussi de l'accompagnement, avec un guide aux organisations, l'ITSAP.00.017, et des mesures d'aide.

Donc le cadre est posé, les standards sont là, les autorités ont agi. La seule question qui reste, c'est : et vous, en êtes-vous ?

## 4. Notes de design

- Conforme FND-015 : une idée par variation, portée par le titre ; les points de forme restent en signal (mots-clés en gras), pas en décoration.
- L'orange de marque signale (gras sur les termes pivots du verbatim), il ne remplit pas.
- Implémentation dans slide-02 : `content.md` (trois variations via le séparateur `---`, titre surchargé à chaque variation) et `verbatim.md` (texte ci-dessus).

## Definition of Done

- [x] Diapositive sélectionnée (slide-02) et structure à trois variations décidée.
- [x] Points de forme proposés pour chacune des trois variations.
- [x] Verbatim rédigé couvrant les trois variations.
- [x] Contenu implémenté dans `src/slide-02/content.md` et `src/slide-02/verbatim.md`.
- [x] Markdown strict respecté (pas de filet séparateur, pas de hard-wrap, pas de tiret cadratin).
