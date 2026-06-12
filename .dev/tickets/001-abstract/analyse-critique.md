# Analyse critique de `abstract.md`

> Tâche 1 du ticket `001-abstract`. Objectif : dire ce qui ne convient pas et pourquoi ;
> ce qu'il faut garder / modifier / retirer / ajouter ; proposer un chemin pragmatique
> pour accélérer la publication.

## Verdict général

Le fond est **bon** : le titre est accrocheur, l'angle est clair, la biographie est
solide et différenciante. **Mais le document n'est pas publiable en l'état**, pour deux
raisons principales :

1. **De nombreuses fautes d'orthographe et de grammaire** — rédhibitoire au regard de
   l'objectif « maîtrise du sujet **irréprochable** ». Sur un sujet de cybersécurité
   pointu, des fautes dans l'abstract sapent la crédibilité technique *avant même* la
   première diapo.
2. **Un doublon d'abstracts** (`## Abstract` long **et** `## Brièvement` court) sans rôle
   défini : on ne sait pas lequel est la version de référence à soumettre.

Le reste relève de l'ajustement.

---

## 1. Ce qui ne convient pas (et pourquoi)

### A. Doublon d'abstracts non résolu
`## Abstract` (long, dense) et `## Brièvement` (court, percutant) coexistent. Pour une
soumission d'événement, il faut **une** version canonique (+ éventuellement un *teaser*).
La version courte est **meilleure** (plus juste, mieux nuancée, déjà reprise dans le
README). La version longue contient **plus d'erreurs** et un ton plus lourd.

### B. Fautes d'orthographe / grammaire (bloquant)
Relevé dans la version longue et la bio :

| Écrit | Correct |
|---|---|
| matématicien | mathématicien |
| algorithmes quantique | algorithmes quantiques |
| technologie émergeante | technologie émergente |
| maitriser | maîtriser |
| maiteneurs | mainteneurs |
| en premier lieux | en premier lieu |
| ce tenjeux | cet enjeu |
| standardisation internationnal | normalisation internationale |
| mesures de conformités imposés | mesures de conformité imposées |
| quels « briques » … dû être modifiés | quelles « briques » … ont dû être modifiées |
| comment **ils** comptent intégrer | comment **elles** comptent (les distributions) |
| l'intégratoin | l'intégration |
| Son approche … **la** amené | l'**a** amené |
| chaines | chaînes |
| Crytographie | Cryptographie |

→ **Une relecture orthographique complète est indispensable.**

### C. Imprécisions ou formulations à border
- **« ~2030 = le moment où une attaque pourra vraiment avoir lieu »** : trop affirmatif.
  Les projections situent un ordinateur quantique pertinent (CRQC) **dans les années
  2030, avec une forte incertitude**. La version courte (« échéance estimée autour de
  2030 ») est déjà mieux. → garder la formulation prudente.
- **« mesures de conformité imposées par le Canada »** : ✅ **fondé** — c'est même un
  atout. Le Cyber Centre canadien a publié la feuille de route **ITSM.40.001** (juin
  2025), avec échéances **fin 2031** (systèmes prioritaires) et **fin 2035** (reste), et
  des plans ministériels attendus pour avril 2026. → **préciser et citer** ces repères
  plutôt que de rester vague : c'est crédibilisant et **pertinent pour un public
  québécois/canadien**.
- **« Intelligence Quantique »** (dans la bio) : terme inhabituel et ambigu. Si l'on veut
  parler de calcul/informatique quantique, l'écrire ainsi ; si c'est une dénomination
  propre à noumanity, la garder mais l'assumer explicitement. → **à clarifier.**

### D. Style
La version longue est **un seul bloc dense**. Pour un abstract d'événement, viser
~130-150 mots aérés, ou simplement adopter la version courte.

---

## 2. Garder / Modifier / Retirer / Ajouter

| Action | Élément |
|---|---|
| ✅ **Garder** | Le **titre** (accrocheur, accessible, forme interrogative). La **version courte** comme abstract de référence. La **biographie** (angle chimie quantique → Linux → DevSecOps → studio DeepTech). La **structure annoncée** (standards → briques → distributions → démo). |
| ✏️ **Modifier** | Corriger **toutes** les fautes. Préciser l'échéance (« estimée autour de 2030 », garder le conditionnel). Préciser la mention Canada (ITSM.40.001, 2031-2035). Clarifier « Intelligence Quantique ». |
| 🗑️ **Retirer** | Le **doublon** : soit retirer la version longue, soit la reléguer/renommer explicitement « version longue (si l'événement l'exige) ». Éviter deux abstracts concurrents sans rôle. |
| ➕ **Ajouter** | (au besoin, selon le formulaire de l'événement) : **niveau** (amateurs → pros), **langue** (français), **durée** (30 min, avec démo), et 2-3 **points à retenir** (*takeaways*). Une **bio courte ~45 mots** pour le programme. |

---

## 3. Proposition pragmatique pour accélérer la publication

**Principe : ne pas surinvestir. Le matériel est à ~90 %. Il faut surtout *nettoyer et
trancher*, pas réécrire.**

1. **Trancher le doublon** : adopter **la version courte comme abstract officiel**
   (déjà alignée avec le README). Supprimer la version longue *ou* la garder en réserve
   sous un titre clair (« version longue — sur demande »).
2. **Passe orthographique unique** sur l'abstract retenu + la bio (15 min — liste au §1.B).
3. **Deux micro-corrections de fond** : formulation prudente sur 2030 ; ajout du repère
   **ITSM.40.001 (2031/2035)** pour ancrer le propos au Canada.
4. **Clarifier « Intelligence Quantique »** (un mot de Jérémy suffit).
5. **Préparer une bio courte (~45 mots)** pour le programme, en plus de la longue.
6. **Soumettre.** Le reste (plan détaillé, démo) relève de la *préparation* de la
   présentation, pas de la publication de l'abstract — ne pas bloquer la soumission
   dessus.

### Version courte corrigée, prête à publier (proposition)

> **Titre** — *Comment les distributions Linux s'adaptent-elles au « risque quantique » ?*
>
> Depuis l'algorithme de Shor (1994), on sait qu'un ordinateur quantique suffisamment
> puissant briserait la cryptographie asymétrique actuelle (RSA, courbes elliptiques).
> Avec une échéance estimée autour de 2030 et la menace « récolter maintenant, déchiffrer
> plus tard », la migration vers la cryptographie post-quantique (PQC) est déjà engagée —
> le Canada vise d'ailleurs 2031-2035 pour ses systèmes fédéraux. Cette présentation fait
> le tour du sujet, puis examine comment les grandes distributions Linux et les images de
> conteneurs intègrent ces nouveaux mécanismes — démonstration à l'appui.

*(~80 mots. Si l'événement exige une version longue, repartir de `## Abstract` en
appliquant les corrections du §1.B et la précision Canada.)*

### Bio courte proposée (~45 mots, pour le programme)

> Issu de la recherche en chimie quantique (où il a découvert Linux sur super-calculateurs),
> Jérémy Viau-Trudel est depuis dix ans consultant TI spécialisé en Linux et DevSecOps,
> du *on-premise* à l'infonuagique et l'*edge computing*. Il dirige **noumanity**, son
> studio *DeepTech*.

---

## Sources (vérification de la mention « Canada »)

- Cyber Centre — *Roadmap for the migration to post-quantum cryptography for the
  Government of Canada (ITSM.40.001)* — https://www.cyber.gc.ca/en/guidance/roadmap-migration-post-quantum-cryptography-government-canada-itsm40001
- *Migrating the Government of Canada to Post-Quantum Cryptography* (SPIN) —
  https://www.canada.ca/en/government/system/digital-government/policies-standards/spin/migrating-government-canada-post-quantum-cryptography.html
