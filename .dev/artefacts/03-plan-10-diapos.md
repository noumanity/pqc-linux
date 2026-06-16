# Plan de présentation en dix diapos

> **Livrable 3/4, révisé à la tâche 2 du ticket [TKT-001-plan](../tickets/TKT-001-plan/ticket.md).** Structure refondue selon les directives de la tâche 2 : Linux et la cybersécurité appliquée au premier plan, le quantique comme déclencheur ; diapo 3 recentrée sur la gestion du risque ; diapo 4 en mode « show » (actions internationales et canadiennes) ; **coeur** de la présentation aux diapos 5 à 8 (Linux) ; diapo 9 de démo (préparée à part) ; conclusion hors décompte. Récit sous-jacent : livrable 2 ([argumentaire](02-argumentaire-recit.md)). Les objectifs (livrable 1) sont inchangés.

## Convention de comptage

Diapos 1 à 9 numérotées ; la **conclusion et appel** est une diapo `x` qui **ne compte pas** dans les dix. Les « 6 catégories » employées aux diapos 5, 6 et 8 sont les six catégories canoniques du projet (entreprises et HPC, communautaires et indépendantes, conteneur, mobile, IoT et embarqué, spécialités notables ; cf. [FND-011](../fondations/FND-011-pqc-soixante-images-par-categorie.md)).

## Vue d'ensemble

| # | Titre | Message clé | Sert surtout |
|---|---|---|---|
| 1 | Accroche : fausse conf quantique | « Rien de quantique ici » | Communauté (complicité) |
| 2 | Le vrai plan, volontairement ordinaire | C'est de la cybersécurité Linux | Les deux |
| 3 | Repenser : le risque quantique, déclencheur | Le vrai sujet est la gestion de la crypto | Décideurs |
| 4 | C'est déjà pris en charge, et vous ? | Le monde et le Canada ont agi | Décideurs |
| 5 | Linux, infrastructure stratégique | À entretenir, donc à financer | Les deux |
| 6 | Le flux upstream vers downstream | Peu de briques ; roadmap plus publication | Les deux |
| 7 | Les briques de la crypto Linux (technique) | Où et depuis quelle version le PQC arrive | Communauté |
| 8 | Carte de maturité PQC par catégorie | Qui mène, qui suit, pourquoi | Communauté |
| 9 | Démo : vérifier le PQC soi-même | Une compétence à rapporter | Les deux |
| x | Conclusion et appel | Valeur applicable ; parlons-nous | Décideurs |

## Détail des diapos

### Diapo 1 : l'accroche (conservée)

- **Objectif** : désamorcer l'intimidation, créer la complicité, planter la thèse.
- **Contenu** : faux plan intimidant (théorème de Shor, implémentation Qiskit, exécution sur l'ordinateur quantique d'IBM à Bromont), puis chute. Variation : les items se barrent un à un.

### Diapo 2 : le vrai plan, volontairement ordinaire (conservée)

- **Objectif** : énoncer la thèse et le fil.
- **Message** : « On utilise le mot quantique, mais il n'y a rien de quantique ici. C'est une présentation de cybersécurité Linux. »
- **Contenu** : le vrai plan, sobre à dessein.

### Diapo 3 : repenser la menace comme un risque (angle changé)

- **Objectif** : dédramatiser en recadrant sur la gestion du risque (on abandonne l'illustration historique).
- **Message décideurs** : prendre en charge le PQC est un **impératif urgent de gestion du risque** ; il impose de **vérifier sa chaîne d'approvisionnement logiciel** ; premier pas, vérifier.
- **Contenu** : le risque quantique est un **déclencheur** ; l'enjeu réel est la **gestion de la cryptographie**. Le malaise vient de ce qu'il touche le **socle** de la cybersécurité. **Double risque** : négliger (déni, peur, non-priorité) ou se laisser paralyser par le battage. Le danger immédiat est l'**inaction**, car le HNDL rend l'exposition présente. Amorce : « qu'arriverait-il si on n'agissait pas ? ». Source : [FND-010](../fondations/FND-010-risque-quantique-notion-et-prise-en-charge.md), section « penser la menace quantique » de [TKT-010](../tickets/TKT-010-redaction-des-slides+verbatim/ticket.md).

### Diapo 4 : c'est déjà pris en charge, et vous ?

- **Objectif** : passer du « tell » au « show » ; rassurer et responsabiliser.
- **Message décideurs** : enjeu sérieux et cadré ; **est-il couvert par vos processus cyber, vos veilles stratégiques ?**
- **Contenu** :
  - [interaction] « Qu'arriverait-il si on n'agissait pas dès maintenant ? »
  - La **communauté internationale** a agi : standards NIST (FIPS 203 ML-KEM, 204 ML-DSA, 205 SLH-DSA, 2024), équivalents BSI, ANSSI, ETSI, déclaration du G7.
  - Les **autorités canadiennes** ont agi : feuille de route du Centre canadien pour la cybersécurité (ITSM.40.001, en vigueur le 23 juin 2025) avec **obligations contraignantes** pour les systèmes du gouvernement (migrer toute la cryptographie à clé publique) ; guide aux organisations (ITSAP.00.017).
- **Note** : c'est ici, et seulement ici, que le Canada apparaît, par ses **actions réglementaires** (pas par la recherche quantique, axe abandonné).

### Diapo 5 : Linux, infrastructure stratégique (coeur, début)

- **Objectif** : faire passer Linux au premier plan et justifier l'investissement.
- **Message décideurs** : Linux est une **infrastructure stratégique fondamentale et irremplaçable** ; il faut l'entretenir, donc **investir** dans son entretien.
- **Message communauté** : vous devez comprendre où vit la crypto selon l'usage.
- **Contenu** : les **6 catégories d'usage** ; l'importance, le rôle et l'implémentation de la crypto **dépendent de la catégorie**. Deux tableaux.

Tableau A (importance stratégique, d'après [FND-008](../fondations/FND-008-usages-de-linux.md)) :

| Catégorie | Distributions dominantes | Usage principal | Importance stratégique |
|---|---|---|---|
| Entreprises et HPC | RHEL, SLES, Ubuntu Pro ; HPC base RHEL, Rocky, SUSE | systèmes critiques régulés, supercalcul | très élevée (valeur, criticité) |
| Communautaires et indépendantes | Debian, Fedora, Arch, openSUSE | socle amont, bureau avancé, web | élevée (amont de l'écosystème) |
| Conteneur (images) | Alpine, Debian-slim, Ubuntu, UBI, Wolfi | base d'images cloud-native | maximale (centre de gravité actuel) |
| Mobile | Android (AOSP) | téléphones grand public | maximale en volume (environ 71 pour cent) |
| IoT et embarqué | Yocto, OpenWrt, Buildroot | appareils, routeurs, edge, auto | élevée et croissante, diffuse |
| Spécialités notables | Talos, Flatcar, Bottlerocket, NixOS, Fedora CoreOS | hôtes de conteneurs, immuables, sécurité | élevée (cloud-native moderne) |

Tableau B (usage et défis cryptographiques) :

| Catégorie | Usage crypto principal | Défis cryptographiques |
|---|---|---|
| Entreprises et HPC | TLS, SSH, signature de paquets, conformité | support long contre rythme de migration, certifications, politiques système |
| Communautaires et indépendantes | TLS, SSH, rôle d'amont | dépend du modèle de publication, peu de garanties entreprise |
| Conteneur (images) | TLS sortant, certificats, surface minimale | la crypto vient surtout de l'application ; inventaire ; éphémérité |
| Mobile | TLS (BoringSSL), keystore, signature d'app | chaîne propre Google ; plateforme en retard ; mises à jour OEM |
| IoT et embarqué | TLS (mbedTLS, wolfSSL), signature de micrologiciel | matériel contraint, coût du PQC, longévité, mises à jour difficiles |
| Spécialités notables | TLS via Go ou OpenSSL, communications de cluster | PQC via le runtime ; immuabilité ; traçabilité |

### Diapo 6 : le flux upstream vers downstream (coeur)

- **Objectif** : montrer que la complexité apparente se ramène à peu de briques et à un flux lisible.
- **Message décideurs** : une **formation d'une journée** rend une équipe Linux capable de prendre en charge l'essentiel du risque opérationnel et de le **remonter** à l'équipe cyber.
- **Messages communauté** : connaissez-vous la **feuille de route PQC** de vos distributions ? Le doublet **feuille de route plus modèle de publication** est-il cohérent avec vos besoins de protection des données ?
- **Contenu** : un petit nombre de briques (tableau haut niveau) ; puis le flux de mise en production, déterminé par la **feuille de route** (choix de l'éditeur) et le **modèle de publication**.

Tableau 1 (les briques, vue haut niveau) :

| Brique | Rôle |
|---|---|
| OpenSSL, GnuTLS, NSS, BoringSSL | piles TLS (HTTPS et communications chiffrées) |
| OpenSSH | connexions à distance |
| pile Go | runtime des nombreux outils cloud-native |
| mbedTLS, wolfSSL | piles TLS de l'embarqué contraint |
| noyau Linux | cryptographie de certaines opérations système |

Tableau 2 (le flux par catégorie) :

| Catégorie | Distribution exemple | Modèle de publication | Feuille de route PQC |
|---|---|---|---|
| Entreprises et HPC | RHEL | fixe, support long, éditeur proactif | PQC par défaut dès 10.1, signature RPM en PQC |
| Entreprises et HPC | Ubuntu | fixe (LTS) | PQC natif avec 26.04 |
| Communautaires | Debian | fixe, prudent | PQC avec trixie |
| Communautaires | Arch | rolling | PQC tôt, au fil de l'amont |
| Conteneur | Alpine | rapide | suit OpenSSL |
| Mobile | Android | chaîne Google | transit web fait, plateforme à venir |
| IoT et embarqué | OpenWrt | fixe, contraint | selon la pile TLS retenue |
| Spécialités | Talos | rolling, écrit en Go | hérite du PQC de Go |

### Diapo 7 : les briques de la crypto Linux, en détail (conservée, la plus technique)

- **Objectif** : livrer le contenu le plus important pour l'audience Linux.
- **Contenu** : pour chaque brique, la version qui introduit le PQC, ce qu'elle livre, et la suite de sa feuille de route.

| Brique (librairie) | Version de début PQC | Fonctionnalités PQC livrées | Prochain jalon PQC |
|---|---|---|---|
| OpenSSL | 3.5.0 (avril 2025) | ML-KEM, ML-DSA, SLH-DSA natifs ; X25519MLKEM768 par défaut en TLS | élargir les signatures, diffusion dans les distros |
| OpenSSH | 9.0 (2022), défaut en 10.0 | mlkem768x25519 par défaut (10.0) ; avertissement non quantique (10.1) | signatures PQC |
| GnuTLS | versions récentes | hybride x25519mlkem768 | maturation |
| Mozilla NSS | versions récentes | hybride x25519mlkem768 | maturation |
| pile Go | 1.24 (début 2025) | X25519MLKEM768 par défaut dans crypto/tls | signatures |
| BoringSSL | 2024 | ML-KEM (par défaut dans Chrome 131) | plateforme Android |
| wolfSSL | v7.0 | ML-KEM, ML-DSA, aligné CNSA 2.0, validé CAVP | élargissement embarqué |
| mbedTLS | LMS pour micrologiciel | ML-KEM annoncé, pas encore livré | ML-KEM |
| noyau Linux | travaux en cours | chantiers PQC (présentés à DebConf 25) | crypto noyau PQC |

### Diapo 8 : carte de maturité PQC par catégorie (récapitulatif)

- **Objectif** : synthèse mémorable de l'état du terrain.
- **Contenu** : tableau de maturité (d'après FND-009 et FND-011).

| Catégorie | Distributions repères | Maturité PQC | Pourquoi |
|---|---|---|---|
| Entreprises et HPC | RHEL ; SLES, Azure Linux, dérivés Fedora ; Amazon Linux | meneur | RHEL signe en PQC et active par défaut ; Amazon Linux reste sur OpenSSL 3.2 |
| Communautaires | Fedora, Tumbleweed, Arch ; Debian stable ; Slackware | meneur (rolling) | la fraîcheur de l'amont fait tout |
| Conteneur | Wolfi, Chainguard ; Alpine ; BusyBox, scratch | moyen à élevé | fraîcheur plus signature ; certaines images sans crypto propre |
| Mobile | transit web ; plateforme AOSP | faible (plateforme) | chaîne Google ; pas de bascule plateforme documentée |
| IoT et embarqué | wolfSSL ; mbedTLS ; appareils anciens | faible et hétérogène | matériel contraint, mises à jour difficiles |
| Spécialités | Fedora CoreOS, NixOS, Talos | moyen à élevé | bases fraîches ou runtime Go |

### Diapo 9 : démo, vérifier le PQC soi-même (placeholder)

- **Objectif** : transformer la crédibilité en compétence transmise.
- **Message** : « nous allons vous montrer comment vérifier le PQC ; vous saurez le faire vous-mêmes ».
- **Contenu** : **la démo fait l'objet d'une préparation à part** (voir [TKT-006](../tickets/TKT-006-demo-presentation/ticket.md) et [FND-006](../fondations/FND-006-outils-cbom-scan-panorama-comparaison.md)). On utilise « diapo démo » comme **placeholder** : inventaire cryptographique (CBOM) sur une ou deux images contrastées, et notion de crypto-agilité.

### Diapo x : conclusion et appel (hors des dix)

- **Objectif** : convertir en contact.
- **Message** : la démo vous a donné une compétence **directement applicable** ; la capacité à bâtir est la crypto-agilité.
- **Contenu** : récapitulatif en trois mots (recadrer, responsabiliser, outiller) ; appel : « nous livrons de la valeur applicable chez vous ; nous sommes les experts PQC au Québec ; parlons-nous ».

## Notes de convergence (par rapport à la version de la tâche 1)

- **Diapos 1 et 2** : inchangées.
- **Diapo 3** : angle changé (gestion du risque au lieu de l'illustration historique ; ajout du double risque négligence contre battage).
- **Diapo 4** : passe en mode « show » (actions internationales et canadiennes du CCCS) ; intègre une interaction avec la salle.
- **Ancien acte 5 (leadership de la recherche quantique canadienne)** : **supprimé** ; seules les **actions réglementaires** canadiennes subsistent, en diapo 4.
- **Coeur déplacé vers Linux** : les diapos 5 à 8 forment le centre de gravité (infrastructure stratégique, flux upstream vers downstream, briques techniques, carte de maturité).
- **Diapo 9** : démo réduite à un placeholder (préparée à part).
- **Conclusion** : sortie du décompte des dix, recentrée sur la valeur applicable et l'appel.
