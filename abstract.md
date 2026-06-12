# Comment les distributions Linux s'adaptent-elles au "risque quantique"?

## Abstract

Depuis les travaux du matématicien Peter Shor en 1994 sur les algorithmes quantique de factorisation des grands nombres entiers, on spécule sur la capacité des standards de cryptographie à résister à des attaques utilisant des ordinateurs quantiques. Les progrès récents de cette technologie émergeante et l'approche du moment où une attaque pourra vraiment avoir lieu (~2030) ravivent les craintes.

Cette présentation est une revue du sujet qui permettra de maitriser les enjeux en matière de cybersécurité qui affectent les maiteneurs et utilisateurs Linux. Nous discuterons en premier lieux de la prise en charge de ce tenjeux par les organisations de standardisation internationnal et aux mesures de conformités imposés par le Canada pour éviter tout "choc quantique". Puis, nous verrons un peu plus techniquement quels "briques" fondamentales des systèmes linux dû être modifiés. Nous ferons le tour de quelques distributions Linux pour voir comment ils comptent intégrer ces nouveaux mécanismes. Et nous terminerons par une présentation technique portant sur la vérification de l'intégratoin de la Cryptographie Post Quantique (PQC) sur les images Linux.

## Biographie

<img src="https://media.licdn.com/dms/image/v2/D4E03AQECsDfKLjHphg/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1712225837200?e=1782950400&v=beta&t=YW_dbRFkgpeTGhZYMHMlKhkclFSSRMd6_NBYvgomqd0" alt="Jérémy Viau-Trudel" width="200" />

Ayant une trajectoire atypique, [Jérémy Viau-Trudel](https://www.linkedin.com/in/jvtrudel/) vient de la chimie quantique.
Pendant ses études supérieures à l'Université Laval, puis à l'Université Paris-Sud, il a
mené des recherches de haut niveau sur la **simulation de la dynamique électronique de
molécules soumises à des champs laser intenses**.
C'est là, d'abord par nécessité, qu'il a commencé à
utiliser Linux.

Depuis une dizaine d'années, il est **consultant TI spécialisé en Linux** et intervient régulièrement
sur des mandats **DevSecOps**. Son approche pragmatique la amené à travailler aussi bien sur des infrastructures *on-premise*
qu'en *infonuagique* et en *edge computing*.

Depuis cinq ans, il développe **noumanity**, un studio *DeepTech* qui s'intéresse à des
sujets techniques complexes comme la protection des chaines d'approvisionnement logiciel dans une perspective de souveraineté numérique, l'Intelligence Quantique et de la Crytographie Post-Quantique.
