---
diapo:
  model: plain
  variations: 3
content:
  title: "Linux, infrastructure stratégique"
  section: "La cryptographie, au coeur de l'infrastructure Linux"
---

- Linux n'est pas qu'un noyau : c'est l'infrastructure sur laquelle tourne le monde
- Marginal sur le bureau ; **dominant ou hégémonique** partout ailleurs
- Serveurs, cloud, conteneurs, supercalcul, mobile, IoT, automobile
- Pour un décideur : un **socle irremplaçable** qu'il faut entretenir, donc financer
- Le rôle de la cryptographie varie selon la catégorie d'usage
- Leitmotiv : qu'arriverait-il si on laissait ce socle sans entretien cryptographique ?

---
content:
  title: "Six catégories d'usage, six importances stratégiques"
---

| Catégorie | Usage principal | Importance stratégique |
|---|---|---|
| Entreprises et HPC | Systèmes critiques, supercalcul | Très élevée (valeur, criticité) |
| Communautaires | Socle amont, web, bureau avancé | Élevée (amont de l'écosystème) |
| Conteneur (images) | Base d'images cloud-native | Maximale (centre de gravité actuel) |
| Mobile | Téléphones grand public | Maximale en volume (71 % Android) |
| IoT et embarqué | Appareils, routeurs, edge, auto | Élevée et croissante, diffuse |
| Spécialités notables | Hôtes de conteneurs immuables | Élevée (cloud-native moderne) |

---
content:
  title: "Distributions par secteur d'activité"
---

| Catégorie | Dominante | Challenger | Notable |
|---|---|---|---|
| Entreprises et HPC | RHEL | SLES | Ubuntu Pro |
| Communautaires | Debian | Fedora | Arch / openSUSE |
| Conteneur | Alpine | Debian-slim / UBI | Wolfi |
| Mobile | Android (AOSP) | postmarketOS | Ubuntu Touch |
| IoT et embarqué | Yocto | OpenWrt | Buildroot |
| Spécialités | Fedora CoreOS | Talos Linux | NixOS / Flatcar |
