La cryptographie asymétrique actuelle (RSA, ECC) repose sur la difficulté de factoriser de grands nombres ou de calculer des logarithmes discrets - des problèmes que les ordinateurs classiques ne peuvent pas résoudre en temps raisonnable.

Un ordinateur quantique suffisamment puissant exploite l'algorithme de Shor pour résoudre ces problèmes en temps polynomial, rendant obsolètes toutes les clés asymétriques actuellement déployées.

**Points clés à retenir :**

- TLS 1.3, SSH, PGP et toute PKI reposent sur RSA ou ECC : tous vulnérables.
- L'algorithme de Grover réduit la résistance des clés symétriques de moitié (AES-128 -> sécurité de 64 bits) ; AES-256 reste acceptable.
- Le vrai risque immédiat : *Harvest Now, Decrypt Later*. Des acteurs étatiques capturent du trafic chiffré aujourd'hui en anticipant le Q-Day.
  - Données médicales, secrets industriels, communications diplomatiques.
  - Les communications de 2026 pourraient être déchiffrées dans 10 ou 15 ans.

**Chronologie estimée :**

- 2024 : NIST finalise ML-KEM, ML-DSA, SLH-DSA.
- 2025-2030 : déploiement dans les distributions Linux majeures.
- Q-Day : inconnu ; estimations entre 2030 et 2040 selon les experts.
