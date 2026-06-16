# Argumentaire et récit (le fil que la présentation doit supporter)

> **Livrable 2/4, révisé à la tâche 2 du ticket [TKT-001-plan](../tickets/TKT-001-plan/ticket.md).** Cette version intègre les directives de la tâche 2 : **Linux et la cybersécurité appliquée passent au premier plan**, le quantique n'est qu'un **déclencheur** ; on privilégie le **méthodologique et le pratique** sur le théorique et le philosophique ; on abandonne le volet « leadership de la recherche quantique » ; le **coeur** de la présentation devient Linux ; la présentation se termine par une **démo qui laisse une compétence réutilisable**. S'appuie sur [FND-008](../fondations/FND-008-usages-de-linux.md), [FND-009](../fondations/FND-009-pqc-par-categorie-dimages.md), [FND-010](../fondations/FND-010-risque-quantique-notion-et-prise-en-charge.md), [FND-011](../fondations/FND-011-pqc-soixante-images-par-categorie.md), [FND-006](../fondations/FND-006-outils-cbom-scan-panorama-comparaison.md) et [TKT-010](../tickets/TKT-010-redaction-des-slides+verbatim/ticket.md).

## 1. La thèse (une phrase)

**Le « risque quantique » n'est qu'un déclencheur : le vrai sujet, c'est la gestion de la cryptographie dans l'infrastructure Linux qui fait tourner le monde, et c'est un travail d'ingénierie que l'on sait faire.**

Tout le récit sert cette thèse. Le quantique ouvre la porte ; Linux et la pratique de cybersécurité occupent la pièce.

## 2. Le what matters (ce que l'audience doit retenir)

Trois idées, dans cet ordre.

1. **Recadrer** : le quantique n'est pas le sujet ; le sujet est la **gestion du risque cryptographique** et la **chaîne d'approvisionnement logiciel**. Le premier pas concret est de **vérifier** ce qu'on a.
2. **Responsabiliser sans dramatiser** : il y a un **double risque**, négliger l'enjeu (par scepticisme ou par peur) **ou** se laisser paralyser par le battage médiatique ; les deux empêchent d'agir. Or l'enjeu **est déjà pris en charge** par la communauté internationale et par les autorités canadiennes : la seule question est « et vous, en êtes-vous ? ».
3. **Outiller** : Linux est une **infrastructure stratégique** ; sa posture PQC se ramène à un **petit nombre de briques** et à un **flux upstream vers downstream** lisible ; et on peut **vérifier soi-même** son état (CBOM). On repart avec une compétence.

Effet visé sur l'audience prioritaire (décideurs) : « le PQC est un axe de gestion du risque que mes équipes peuvent prendre en charge concrètement, et ces gens savent l'outiller ».

## 3. Le récit en cinq actes

### Acte 1 : le renversement (diapos 1 et 2)

On ouvre comme une conférence quantique intimidante (théorème de Shor, Qiskit, ordinateur quantique d'IBM à Bromont), puis chute : **rien de quantique ici**. On révèle un vrai plan, volontairement ordinaire pour une présentation de cybersécurité. Fonction : désamorcer l'intimidation, créer la complicité, planter la thèse (le mot quantique est un appât ; le sujet est Linux et la cybersécurité).

### Acte 2 : repenser la menace comme un risque (diapo 3)

On garde l'intention de **dédramatiser**, mais on change d'angle : **on abandonne l'illustration historique** au profit d'un raisonnement de **gestion du risque**. De quoi parle-t-on, alors ? De ceci : si la cryptographie à clé publique tombe, on fait quoi ? Le risque quantique crée un **malaise profond** parce qu'il remet en cause le **socle** de notre cybersécurité. D'où un **double risque** : le **négliger** (on n'y croit pas, ça fait peur, ce n'est pas prioritaire) ou se laisser **submerger par le battage** (qui empêche de voir les enjeux réels). Le risque quantique est un **déclencheur** ; l'enjeu réel est la **gestion de la cryptographie**, et le danger immédiat est l'**inaction**, parce que le « Harvest Now, Decrypt Later » rend l'exposition **présente**. Question qui amorce la suite : qu'arriverait-il si on n'agissait pas maintenant ? Message décideurs : prendre en charge le PQC est un **impératif urgent de gestion du risque**, et il impose de **vérifier sa chaîne d'approvisionnement logiciel**. (Cf. FND-010 et la section « penser la menace quantique » de TKT-010.)

### Acte 3 : c'est déjà pris en charge, et vous ? (diapo 4)

On passe du **« tell »** (croyez-moi, c'est sérieux) au **« show »** (regardez qui a déjà agi). La **communauté internationale** de cybersécurité a agi : standards PQC du NIST (ML-KEM, ML-DSA, SLH-DSA), équivalents européens (BSI, ANSSI, ETSI), déclaration du G7. Les **autorités canadiennes** ont agi : le Centre canadien pour la cybersécurité a publié une **feuille de route de migration** (ITSM.40.001) avec des **obligations contraignantes** pour les systèmes du gouvernement, et un guide pour les organisations (ITSAP.00.017). Interaction avec la salle : « qu'arriverait-il si on n'agissait pas ? ». Message décideurs : c'est un enjeu sérieux et cadré ; **est-il couvert par vos processus de cybersécurité, vos veilles stratégiques** ?

### Acte 4 : le coeur, Linux comme infrastructure stratégique (diapos 5 à 8)

C'est le centre de gravité de la présentation. Quatre temps.

- **Linux est une infrastructure stratégique** (diapo 5) : marginal sur le bureau, mais dominant ou hégémonique partout ailleurs (serveur, cloud, conteneur, mobile, embarqué, supercalcul). Pour un décideur, Linux n'est pas « un noyau », c'est un **socle irremplaçable** qu'il faut **entretenir**, donc dans lequel il faut **investir**. L'importance, le rôle et l'implémentation de la cryptographie **dépendent de la catégorie d'usage** (cf. FND-008).
- **Un flux lisible** (diapo 6) : malgré la diversité des distributions, il n'y a qu'un **petit nombre de briques logicielles**. Et la mise en production des améliorations suit un **flux upstream vers downstream** déterminé par deux facteurs : la **feuille de route** de l'éditeur et le **modèle de publication**. Message décideurs : une **formation d'une journée** suffit à une équipe Linux pour prendre en charge l'essentiel du risque opérationnel et savoir le **remonter** à l'équipe cyber.
- **Les briques en détail** (diapo 7) : le contenu le plus technique, pour l'audience Linux : quelle version de chaque brique introduit le PQC, ce qu'elle livre, et la suite de sa feuille de route.
- **La carte de maturité** (diapo 8) : une lecture synthétique, par catégorie, de qui mène, qui suit et qui est à la traîne, et pourquoi (cf. FND-009 et FND-011).

### Acte 5 : la démo et l'appel (diapo 9 et conclusion)

La présentation se termine par une **démonstration**, préparée à part. Récit : « nous allons vous montrer comment **vérifier** le PQC, et vous serez capables de le faire **vous-mêmes** en rentrant ». On donne une **compétence réutilisable** (un inventaire cryptographique, le CBOM). Message décideurs : nous livrons de la **valeur directement applicable** dans votre entreprise pour améliorer votre prise en charge du PQC. Appel : parlons-nous.

## 4. Le motif récurrent

Un fil tient les cinq actes : **recadrer, responsabiliser, outiller**. On déplace l'attention du quantique vers la cybersécurité Linux appliquée (recadrer), on installe l'urgence juste en évitant les deux pièges du déni et du battage (responsabiliser), puis on met une compétence concrète entre les mains de l'audience (outiller). Ton constant : **calme, concret, compétent, un brin malicieux**.

## 5. Ce que le récit écarte volontairement

Pour garder Linux au premier plan et tenir le format, on **n'expose pas** : la démonstration du théorème de Shor, le détail mathématique des algorithmes, le **panorama de la recherche quantique canadienne** (abandonné comme axe ; seules les **actions réglementaires** canadiennes restent, en diapo 4), la classification des données, et la cryptographie quantique (QKD). Ces éléments restent en réserve dans les fondations pour le matériel de suivi.
