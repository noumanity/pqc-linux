Entrons dans la technique, c'est la partie la plus importante pour vous. Voici les briques, et depuis quelle version chacune fait du post-quantique.

Les deux moteurs, ce sont **OpenSSL** et **OpenSSH**. OpenSSL 3.5, sorti en avril 2025, apporte ML-KEM, ML-DSA et SLH-DSA nativement, et active l'echange de cles hybride par defaut en TLS. OpenSSH fait du post-quantique par defaut depuis la version 10. A cote, GnuTLS, NSS et le runtime Go ont le meme echange hybride ; Go l'active par defaut depuis la 1.24, ce qui couvre tous les outils cloud-native ecrits en Go. Pour l'embarque, wolfSSL est deja pret et valide ; mbedTLS, pas encore. Et le noyau a ses propres chantiers en cours.

*(Declinaison du leitmotiv.)*

Qu'arriverait-il si vous laissiez ces briques sur une version pre-PQC ? A l'inverse, passer a OpenSSL 3.5 et OpenSSH 10, c'est deja l'essentiel du chemin. La posture d'une distribution, c'est d'abord la version de ces briques qu'elle embarque.
