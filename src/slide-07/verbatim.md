Entrons dans la technique, c'est la partie la plus importante pour vous. Voici les briques, et depuis quelle version chacune fait du post-quantique.

Les deux moteurs, ce sont **OpenSSL** et **OpenSSH**. OpenSSL 3.5, sorti en avril 2025, apporte ML-KEM, ML-DSA et SLH-DSA nativement, et active l'échange de clés hybride par défaut en TLS. OpenSSH fait du post-quantique par défaut depuis la version 10. À côté, GnuTLS, NSS et le runtime Go ont le même échange hybride ; Go l'active par défaut depuis la 1.24, ce qui couvre tous les outils cloud-native écrits en Go. Pour l'embarqué, wolfSSL est déjà prêt et validé ; mbedTLS, pas encore. Et le noyau a ses propres chantiers en cours.

*(Déclinaison du leitmotiv.)*

Qu'arriverait-il si vous laissiez ces briques sur une version pré-PQC ? À l'inverse, passer à OpenSSL 3.5 et OpenSSH 10, c'est déjà l'essentiel du chemin. La posture d'une distribution, c'est d'abord la version de ces briques qu'elle embarque.
