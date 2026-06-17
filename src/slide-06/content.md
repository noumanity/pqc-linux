---
diapo:
  model: plain
  variations: 2
content:
  title: "Le flux upstream vers downstream"
  section: "La cryptographie, au coeur de l'infrastructure Linux"
---

- Deux forces déterminent la vitesse d'adoption du PQC dans une distribution
- **Gouvernance** : qui décide (communauté, éditeur, hybride) et selon quel rythme
- **Modèle de publication** : rolling (immédiat) ou fixe/LTS (à la prochaine stable)
- La feuille de route PQC = f(briques amont + gouvernance + modèle de publication)
- Question clé : **connaissez-vous** la feuille de route PQC de vos distributions ?
- Une journée de formation suffit pour couvrir l'essentiel du risque opérationnel

---
content:
  title: "Illustration : la famille Red Hat"
---

## Amont : Fedora

- Communauté, Red Hat parrain ; semi-rolling
- Laboratoire d'innovation : intègre OpenSSL 3.5 en premier (Fedora 42/43)

## Intermédiaire : CentOS Stream

- Rolling, amont direct de RHEL ; préfigure la prochaine stable RHEL

## Stable : RHEL

- Éditeur Red Hat ; fixe, support long
- Intègre, valide, active le PQC **par défaut** dès RHEL 10.1

## Héritiers : AlmaLinux, Rocky Linux, Oracle Linux

- Clones RHEL ; héritent des briques PQC
- Propre clé de signature (sans le jalon ML-DSA de Red Hat)
