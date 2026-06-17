---
slide: 3
model: plain
title: Le « risque quantique » en une page
---

Un ordinateur quantique suffisamment puissant casserait la cryptographie **asymétrique** d'aujourd'hui.

- **Shor** brise RSA et les courbes elliptiques (ECC), donc TLS, SSH et les signatures
- **Grover** ne fait qu'affaiblir le symétrique : AES-256 reste sûr
- Menace immédiate : *Harvest Now, Decrypt Later*
  - capter aujourd'hui le trafic chiffré
  - le déchiffrer le jour venu (Q-Day)

La réponse existe déjà : les algorithmes **post-quantiques** normalisés (ML-KEM, ML-DSA, SLH-DSA) arrivent dans les distributions Linux.
