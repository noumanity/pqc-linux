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
content:
  title: "Les composantes cryptographiques qui comptent"
---

| Catégorie | Usage principal | Exemple | Version PQC |
|---|---|---|---|
| Pile TLS générale | HTTPS, chiffrement | OpenSSL | 3.5.0 (avr. 2025) |
| Accès à distance | SSH | OpenSSH | 10.0 (avr. 2025) |
| Runtime cloud-native | microservices, Kubernetes | pile Go | 1.24 (jan. 2025) |
| Pile TLS embarquée | IoT, routeurs | wolfSSL | v7.0 |
| Pile TLS navigateurs | HTTPS (Chrome, Firefox) | BoringSSL / NSS | 2024+ |
| Crypto noyau Linux | opérations système | Linux kernel | travaux en cours |

---
content:
  title: "OpenSSL : versions et feuille de route PQC"
---

| Version | Fonctionnalités PQC | Statut |
|---|---|---|
| < 3.2 | aucune | non supporté |
| 3.2.x | via fournisseur OQS externe (liboqs) | contournement |
| 3.5.0 (avr. 2025) | ML-KEM, ML-DSA, SLH-DSA natifs | **disponible** |

## Feuille de route

- X25519MLKEM768 : hybride KEM activé **par défaut** en TLS 1.3
- Prochains jalons : élargissement des signatures PQC, diffusion dans les distributions
- OpenSSL 3.5 est la cible de migration pour la majorité des distributions Linux
