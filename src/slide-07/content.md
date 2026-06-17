---
diapo:
  model: plain
  variations: 3
content:
  title: "Les composantes cryptographiques qui comptent"
  section: "Déploiement des nouvelles composantes cryptographiques"
---

- Toute la cryptographie d'une distribution repose sur un **petit nombre de briques amont**
- La posture PQC d'une image se lit d'abord dans la **version de ces briques**
- Le PQC n'est pas à inventer : il est **déjà livré**, il s'agit de l'activer et de le suivre
- **OpenSSL 3.5** et **OpenSSH 10**, c'est l'essentiel du chemin

---
diapo:
  model: tableau
content:
  title: "Les composantes cryptographiques qui comptent"
  csv: "@src/slide-07/v2-composantes.csv"
  columns:
    - ratio: 0.24
      wrap: true
    - ratio: 0.28
      wrap: true
    - ratio: 0.17
      wrap: false
    - ratio: 0.21
      wrap: false
---

---
diapo:
  model: tableau
content:
  title: "OpenSSL : versions et feuille de route PQC"
  csv: "@src/slide-07/v3-openssl.csv"
  columns:
    - ratio: 0.20
      wrap: false
    - ratio: 0.53
      wrap: true
    - ratio: 0.20
      wrap: false
---

## Feuille de route

- X25519MLKEM768 : hybride KEM activé **par défaut** en TLS 1.3
- Prochains jalons : élargissement des signatures PQC, diffusion dans les distributions
- OpenSSL 3.5 est la cible de migration pour la majorité des distributions Linux
