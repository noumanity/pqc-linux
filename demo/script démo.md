Bonjour tout le monde. Moi je vais faire la partie démonstration.

L’idée de cette démo est assez simple : depuis le début, on parle du risque quantique, de Linux, d’OpenSSL, de TLS, de ML-KEM, de distributions plus ou moins prêtes… mais à un moment, la vraie question pour un administrateur système devient très concrète :

**qu’est-ce qu’il y a réellement dans mes images Linux, dans mes conteneurs, dans mes environnements ?**

Et surtout :

**comment je commence à vérifier ça sans faire une thèse en cryptographie ?**

C’est là qu’entre en jeu le CBOM.

Un CBOM, c’est un **Cryptography Bill of Materials**. On peut le voir comme une adaptation du SBOM, mais spécialisé pour la cryptographie.

Un SBOM répond à la question :

**quels composants logiciels sont présents dans mon application ou mon image ?**

Un CBOM répond plutôt à la question :

**quels éléments cryptographiques sont présents ?**

Par exemple : des certificats, des clés, des algorithmes comme RSA ou SHA256, des fichiers de configuration OpenSSL, des paramètres TLS, parfois des secrets ou des keystores.

Donc le CBOM ne rend pas automatiquement un système post-quantique. Il sert d’abord à faire une chose essentielle : **rendre visible la cryptographie présente dans l’image**.

Et c’est intéressant parce qu’on ne peut pas migrer ce qu’on ne connaît pas. Avant de remplacer RSA, ECDH ou certaines signatures par des mécanismes post-quantiques comme ML-KEM ou ML-DSA, il faut d’abord savoir où la crypto existe dans notre infrastructure.

Pour la démo, j’utilise **CBOMkit-theia**.

C’est un outil qui permet de scanner une image de conteneur ou un répertoire local pour générer un CBOM. Je l’ai choisi pour trois raisons :

premièrement, il est simple à lancer avec Docker ;

deuxièmement, il est adapté à notre contexte Linux et conteneurs ;

troisièmement, il montre bien à la fois l’intérêt et les limites d’un scan CBOM.

Concrètement, CBOMkit-theia utilise plusieurs plugins. Les plus importants pour nous sont :

le plugin **Certificate File**, qui cherche des certificats X.509 ;

le plugin **Secrets**, qui cherche des clés ou secrets qui auraient pu être laissés dans l’image ;

le plugin **OpenSSL Config**, qui regarde les fichiers de configuration OpenSSL, par exemple `openssl.cnf`, et certains paramètres TLS ;

et le plugin **Problematic CA**, qui peut aider à repérer des certificats liés à des autorités problématiques.

Donc le résultat du scan, ce n’est pas juste “bon” ou “pas bon”. C’est un fichier JSON au format CBOM, qui donne un inventaire de ce que l’outil a trouvé.

Je vais montrer deux petits exemples.

Le premier exemple est une image Red Hat UBI 10 Micro. Je l’ai choisie parce qu’elle est proche du sujet de la présentation : on parle de distributions Linux, de RHEL, d’images de conteneurs, et de la transition vers la cryptographie post-quantique.

[Action : montrer la commande ou le fichier déjà généré.]

La commande utilisée est :

`docker run --rm cbomkit-theia image redhat/ubi10-micro:latest > ubi10-micro-cbom.json`

Ensuite, je reformate le JSON pour le lire plus facilement :

`python -m json.tool ubi10-micro-cbom.json > ubi10-micro-cbom-pretty.json`

[Action : ouvrir le fichier dans VS Code.]

Dans ce fichier, je ne vais pas tout lire ligne par ligne. Ce serait beaucoup trop long. Je vais plutôt chercher quelques éléments importants.

[Action : Ctrl+F sur `components`.]

Ici, la section `components` représente les actifs cryptographiques trouvés par le scanner.

[Action : Ctrl+F sur `RSA`.]

On voit que l’outil détecte RSA. RSA est important dans notre contexte parce que c’est justement une famille d’algorithmes asymétriques qui est concernée par le risque quantique.

[Action : Ctrl+F sur `SHA256-RSA`.]

Ici, on voit aussi `SHA256-RSA`. Ça veut dire qu’on a une signature qui combine SHA-256 comme fonction de hachage et RSA comme algorithme de signature.

[Action : Ctrl+F sur `certificate`.]

On voit aussi des certificats. Dans mon exemple, il y a notamment des certificats Red Hat, comme le Product ID ou le Code Signing CA. Le scanner indique le sujet du certificat, l’émetteur, les dates de validité, l’algorithme de signature et la clé publique associée.

Donc ce premier exemple montre le rôle principal du CBOM : il donne une photographie de la cryptographie visible dans l’image. On sait qu’il y a des certificats, on sait quels algorithmes sont liés à ces certificats, on sait où ils se trouvent dans le système de fichiers.

C’est déjà utile pour un administrateur Linux, parce que dans une vraie infrastructure, on peut avoir des dizaines ou des centaines d’images. Sans inventaire, on ne sait pas vraiment où se trouvent les certificats, les clés, les configurations TLS ou les traces d’algorithmes classiques.

Maintenant, je passe au deuxième exemple, qui est volontairement différent.

Dans le deuxième exemple, j’ai une image UBI 10 dans laquelle j’ai vérifié OpenSSL 3.5.5 et le support de ML-KEM.

[Action : montrer la commande.]

Je lance :

`docker run --rm ubi10-pqc-enabled openssl version`

Ici, je vérifie la version d’OpenSSL.

Ensuite, je lance :

`docker run --rm ubi10-pqc-enabled openssl list -kem-algorithms`

ou, pour filtrer seulement ce qui nous intéresse :

`docker run --rm ubi10-pqc-enabled openssl list -kem-algorithms | findstr /I "ML-KEM MLKEM X25519MLKEM"`

[Action : montrer le résultat avec ML-KEM.]

Ici, on voit apparaître `ML-KEM-512`, `ML-KEM-768`, `ML-KEM-1024`, et aussi des groupes hybrides comme `X25519MLKEM768`.

C’est important parce que ML-KEM est l’algorithme post-quantique standardisé pour l’échange de clés. Et l’échange de clés est central dans TLS, SSH et les communications sécurisées.

Donc là, ce que je montre n’est plus seulement un inventaire statique. C’est une vérification fonctionnelle : OpenSSL me dit directement quels KEM sont disponibles dans cet environnement.

Et maintenant, il y a un point très important.

Quand je cherche `ML-KEM` dans le CBOM généré par CBOMkit-theia, je peux ne rien trouver.

[Action : montrer Ctrl+F `ML-KEM` dans le fichier CBOM, aucun résultat.]

Et ce n’est pas forcément une erreur.

Ça montre une limite importante du CBOM statique. CBOMkit-theia scanne principalement les fichiers visibles dans l’image : certificats, clés, secrets, fichiers OpenSSL, configurations. Il ne remplace pas toujours une interrogation directe de la librairie crypto à l’exécution.

Donc on a deux informations complémentaires :

le CBOM me dit : **voici les actifs cryptographiques présents dans l’image** ;

OpenSSL me dit : **voici les algorithmes supportés réellement par la pile crypto**.

C’est pour ça que dans une démarche post-quantique, je ne ferais pas seulement un scan CBOM ou seulement un test OpenSSL. Je ferais les deux.

Le CBOM sert à inventorier.

La vérification dynamique sert à confirmer ce qui fonctionne vraiment.

Et c’est exactement ça, la crypto-agilité : être capable de savoir où est la crypto, dans quel état elle est, et comment la faire évoluer.

Pourquoi c’est important pour des administrateurs système Linux ?

Parce qu’en pratique, les sysadmins ne gèrent pas seulement “Linux” comme un concept abstrait. Ils gèrent des serveurs, des images de conteneurs, des certificats, des connexions SSH, des services TLS, des mises à jour, des chaînes CI/CD, des images de base, parfois des images héritées qui restent longtemps en production.

Si on ne fait pas d’inventaire, on peut facilement se retrouver avec une image qui contient encore des certificats ou configurations faibles, des dépendances crypto anciennes, ou une pile OpenSSL qui n’est pas au niveau attendu.

Dans le contexte post-quantique, le problème devient encore plus clair : avant de demander “est-ce que mon infrastructure est prête pour ML-KEM ?”, il faut déjà être capable de répondre à une question plus simple :

**où est ma cryptographie ?**

Le CBOM aide à répondre à cette première question.

Et ensuite, pour la partie post-quantique, on complète avec des tests ciblés comme `openssl list -kem-algorithms` ou des tests de poignée de main TLS.

Donc le message à retenir de cette démo est le suivant :

un CBOM n’est pas une preuve magique qu’un système est quantum-safe ;

mais c’est un très bon point de départ pour construire une démarche sérieuse de migration post-quantique.

On commence par voir.

Ensuite, on vérifie.

Puis on peut migrer, configurer et suivre dans le temps.

Et surtout, c’est faisable avec des outils accessibles, sur un poste Windows avec Docker, et avec des commandes que vous pouvez refaire vous-mêmes après la présentation.
