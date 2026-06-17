---
diapo:
  model: plain
  variations: 2
content:
  title: "Maturité PQC des distributions"
  section: "Déploiement des nouvelles composantes cryptographiques"
---

| Distribution | Posture | Ce qui est livré |
|---|---|---|
| RHEL 10 | Leader | TLS hybride (OpenSSL, GnuTLS, NSS) ; signature RPM ML-DSA-87+Ed448 ; PQC par défaut dès 10.1 |
| SLES 16 | Challenger | TLS hybride (OpenSSL, libgcrypt, NSS, Go) ; SSH PQC pas encore livré ; stratégie PQC explicite publiée |
| Ubuntu | Tail | PQC natif avec 26.04 (avr. 2026) ; OQS disponible sur 24.04 LTS |

---
content:
  title: "Famille Red Hat : posture PQC"
---

| Distribution | Posture | Ce qui est livré |
|---|---|---|
| RHEL 10.1 | Leader | TLS hybride + signature RPM ML-DSA + politiques PQC par défaut |
| Fedora 42/43 | Leader | OpenSSL 3.5 natif ; X25519MLKEM768 par défaut ; labo de RHEL |
| CentOS Stream | Challenger | Rolling amont de RHEL ; reçoit le PQC avant la stable |
| AlmaLinux | Challenger | Clone RHEL 10 ; briques PQC sans signature ML-DSA propre |
| Rocky Linux | Challenger | Quasi identique à AlmaLinux ; propre clé de signature |
| Oracle Linux | Challenger | Clone RHEL 10 ; propre clé de signature |
| Amazon Linux 2023 | Challenger | Dérivé Fedora ; OpenSSL 3.2.2 + crypto-policies PQ |
