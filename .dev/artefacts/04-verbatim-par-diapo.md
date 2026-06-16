# Verbatim par diapo

> **Livrable 4/4, révisé à la tâche 2 du ticket [TKT-001-plan](../tickets/TKT-001-plan/ticket.md).** Aligné sur le [plan](03-plan-10-diapos.md) et le [récit](02-argumentaire-recit.md) révisés : Linux au premier plan, quantique déclencheur, diapo 3 sur la gestion du risque, diapo 4 en mode « show » (international et CCCS), coeur Linux aux diapos 5 à 8, démo en placeholder, conclusion hors décompte. Texte rédigé pour être **dit** ; indications de scène en italique ; faits alignés sur les fondations sourcées, à revalider avant l'événement.

## Diapo 1 : l'accroche

*(À l'écran : un plan d'apparence très savante. Ton assuré, presque solennel.)*

« Bonjour à tous, merci d'être là. Aujourd'hui, on parle de calcul quantique. Voici le plan. D'abord, je vous démontre le théorème de Shor au tableau. Ensuite, on l'implémente ensemble en Qiskit. Et pour finir, on lance une exécution, gratuitement, sur l'ordinateur quantique d'IBM installé à Bromont, juste à côté. »

*(Pause. On laisse le malaise monter.)*

« ... Non. Je blague. »

*(Les lignes du faux plan se barrent une à une.)*

« Rien de tout ça. Un secret, pour une salle de gens de Linux : dans toute cette présentation, on va dire le mot quantique souvent, mais **il n'y a rien de quantique là-dedans**. Pas de qubit, pas de physique. Ce dont on parle, c'est de cybersécurité, et de Linux. Du travail d'ingénierie que vous connaissez déjà. »

## Diapo 2 : le vrai plan

*(À l'écran : un plan sobre, presque ennuyeux.)*

« Voici le vrai plan. Je l'ai fait exprès le plus ordinaire possible, parce que c'est ça, mon message. On va repenser une menace, voir que tout le monde a déjà commencé à s'en occuper, puis passer le gros de notre temps dans le concret : où vit la cryptographie dans Linux, comment les améliorations y arrivent, et comment vous pouvez vérifier l'état des choses vous-mêmes. »

« Gardez une idée en tête : le quantique, ici, ce n'est qu'une porte d'entrée. Le vrai sujet, c'est la gestion de la cryptographie dans l'infrastructure Linux qui fait tourner le monde. »

## Diapo 3 : repenser la menace comme un risque

« Alors, de quoi parle-t-on, si ce n'est pas de quantique ? On parle de **risque**. Posez-vous la question, froidement : si la cryptographie à clé publique, celle qui protège à peu près tout, devenait cassable, on fait quoi ? »

« Ce qui rend ce sujet inconfortable, c'est qu'il touche au **socle** de notre cybersécurité. Et face à ça, je vois deux erreurs symétriques. La première : **négliger**, parce qu'on n'y croit pas, parce que ça fait peur, ou parce que ce n'est jamais la priorité. La deuxième : se laisser **submerger par le battage médiatique**, au point de ne plus voir l'enjeu réel. Les deux mènent au même endroit : l'inaction. »

« Or le risque quantique n'est qu'un **déclencheur**. Le vrai enjeu, c'est de **gérer notre cryptographie** et de **vérifier notre chaîne d'approvisionnement logiciel**. Et il y a une urgence concrète, le Harvest Now Decrypt Later : on capte vos données chiffrées aujourd'hui pour les déchiffrer plus tard. Donc l'exposition est **déjà** là. La vraie question pour vos équipes, ce n'est pas la physique. C'est : qu'arriverait-il si on n'agissait pas maintenant ? »

## Diapo 4 : c'est déjà pris en charge, et vous ?

*(Ton qui s'ouvre, presque rassurant. Interaction avec la salle.)*

« Posons-la, la question, pour de vrai. Qu'est-ce qui arriverait si personne n'agissait ? »

*(Laisser deux ou trois réponses.)*

« Bonne nouvelle : on n'en est pas là, parce que le monde a déjà commencé. La communauté internationale de cybersécurité a agi. Le NIST a publié ses standards post-quantiques en 2024 : ML-KEM pour l'échange de clés, ML-DSA et SLH-DSA pour les signatures. Les Européens suivent : le BSI allemand, l'ANSSI française, l'ETSI. Le G7 a même publié une déclaration commune sur la migration. »

« Et le Canada n'est pas en reste, pas comme labo de recherche aujourd'hui, mais comme **régulateur**. Le Centre canadien pour la cybersécurité a publié une **feuille de route de migration**, entrée en vigueur en juin 2025, avec des **obligations contraignantes** : les systèmes du gouvernement doivent migrer toute leur cryptographie à clé publique. Il y a même un guide pour les organisations. »

*(Temps. Regard aux décideurs.)*

« Donc la question n'est plus de savoir si c'est sérieux. C'est : est-ce que ce risque est couvert par **vos** processus de cybersécurité ? Est-il dans **vos** veilles stratégiques, dans **vos** axes d'analyse ? »

## Diapo 5 : Linux, infrastructure stratégique

« Maintenant, le coeur. Et on commence par une mise au point pour les décideurs. »

« On entend souvent les amateurs de Linux se plaindre que personne ne l'utilise. C'est vrai sur un seul terrain : le poste de travail, autour de 5 pour cent. Partout ailleurs, Linux **domine** : environ 60 pour cent du web, 90 pour cent du cloud public, 71 pour cent du mobile via Android, la totalité des supercalculateurs. Linux n'est pas un noyau de bricoleur. C'est une **infrastructure stratégique, fondamentale et irremplaçable**. Et une infrastructure, ça s'entretient. Donc ça se finance. »

*(Afficher les deux tableaux.)*

« Et l'important, c'est que la cryptographie ne joue pas le même rôle selon l'usage. Voici nos six catégories. À gauche, leur importance stratégique. À droite, l'usage de la crypto et les défis propres à chacune. Un serveur d'entreprise, une image de conteneur, un routeur IoT, un téléphone : ce ne sont pas les mêmes contraintes. Pour s'y retrouver, il faut comprendre ça d'abord. »

## Diapo 6 : le flux upstream vers downstream

« La bonne nouvelle, c'est que derrière la diversité des centaines de distributions, il n'y a qu'une **poignée de briques logicielles**. Les voici. Si vous savez ce qui tourne dans ces quelques composants, vous savez presque tout. »

« Et les améliorations arrivent par un **flux** prévisible, de l'amont vers l'aval. Deux choses décident de la vitesse : la **feuille de route** de l'éditeur, son choix stratégique, et le **modèle de publication**, rolling ou stable. Regardez ce deuxième tableau : RHEL avance vite parce que son éditeur est proactif, Arch parce qu'il est rolling, Debian plus lentement parce qu'il est prudent. »

*(Aux décideurs.)*

« Et un message pour les gestionnaires : ce n'est pas hors de portée de vos équipes. En gros, **une journée de formation** Linux-PQC permet à une équipe opérationnelle de prendre en charge l'essentiel du risque, et surtout de savoir le **remonter** à l'équipe cyber. »

*(À la communauté.)*

« Pour vous : connaissez-vous la feuille de route PQC de vos distributions ? Et est-ce que le couple feuille de route plus modèle de publication colle à vos besoins de protection des données ? »

## Diapo 7 : les briques de la crypto Linux, en détail

« Entrons dans la technique, c'est la partie la plus importante pour vous. Voici les briques, et depuis quelle version chacune fait du post-quantique. »

« Les deux moteurs, ce sont **OpenSSL** et **OpenSSH**. OpenSSL 3.5, sorti en avril 2025, apporte ML-KEM, ML-DSA et SLH-DSA nativement, et active l'échange de clés hybride par défaut en TLS. OpenSSH fait du post-quantique par défaut depuis la version 10. À côté, GnuTLS, NSS et le runtime Go ont le même échange hybride ; Go l'active par défaut depuis la 1.24, ce qui couvre tous les outils cloud-native écrits en Go. Pour l'embarqué, wolfSSL est déjà prêt et validé ; mbedTLS, pas encore. Et le noyau Linux a ses propres chantiers en cours. »

« Retenez la logique : la posture d'une distribution, c'est d'abord la **version de ces briques** qu'elle embarque. »

## Diapo 8 : carte de maturité PQC par catégorie

« Si on prend de la hauteur, voici la carte de qui en est où. »

« Le meneur, c'est Red Hat. RHEL active le post-quantique par défaut et, fait unique, **signe ses paquets** avec une signature post-quantique. Les distributions en rolling, Fedora, Tumbleweed, Arch, suivent très tôt par fraîcheur. Ubuntu et Debian arrivent au rythme de leurs versions stables. Le conteneur est plutôt mûr, surtout les images fraîches et signées comme Wolfi. Le mobile avance sur le web mais traîne côté plateforme. Et l'IoT contraint, c'est le plus en retard. Vous avez la carte, et le pourquoi de chaque case. »

## Diapo 9 : démo, vérifier le PQC soi-même

*(Bascule vers la démonstration, préparée séparément.)*

« Et maintenant, le plus utile. Parce que je ne veux pas que vous repartiez avec juste une carte ; je veux que vous repartiez avec une **compétence**. »

« La première étape de toute migration, ce n'est pas d'installer du post-quantique. C'est de savoir **où** vous avez de la cryptographie. On appelle ça un CBOM, un inventaire cryptographique. Je vais le faire devant vous, et vous allez voir : c'est à votre portée. »

*(Lancer la démo préparée. Commenter le résultat sur une ou deux images contrastées.)*

« Voilà. Vous saurez refaire ça en rentrant chez vous. Et c'est exactement ça, le point de départ de la crypto-agilité : un inventaire à jour, qu'on rescanne après chaque changement. »

## Diapo x : conclusion et appel

« On résume en trois mots. **Recadrer** : le quantique n'est qu'un déclencheur, le vrai sujet est la gestion de la cryptographie dans Linux. **Responsabiliser** : ni déni, ni panique ; l'enjeu est cadré, le monde et le Canada ont agi, à vous de jouer. **Outiller** : vous repartez avec une compétence concrète, l'inventaire cryptographique. »

*(Temps. Regard à la salle, puis aux décideurs.)*

« Pour les organisations dans la salle : ce qu'on vient de montrer est **directement applicable** chez vous pour améliorer votre prise en charge du PQC. C'est notre métier. Nous sommes les gens du PQC au Québec. Venez nous parler. Merci. »

## Notes de performance

- Durée cible : environ 18 à 22 minutes ; le coeur (diapos 5 à 8) et la démo (diapo 9) sont les segments élastiques.
- Deux interactions à préparer : « qu'arriverait-il si on n'agissait pas ? » (diapo 4) et le lancement de la démo (diapo 9, prévoir un enregistrement de secours).
- Trois bascules de ton : la chute de la diapo 1, l'ouverture rassurante de la diapo 4, et le passage à la compétence transmise en diapo 9.
- Faits à revalider la semaine précédant l'événement : versions de distributions, jalons du CCCS (ITSM.40.001, ITSAP.00.017), standards NIST ; sources dans les fondations citées.
