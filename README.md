# Atelier méthodes AGD

## Work in progress

Ce repo est en cours de construction suite à la séance. Il sera actualisé au fil de l'eau.

Vous retrouverez ici les matériaux utilisés durant la séance de l'Atelier Méthodes du CED consacrée à l'analyse géométrique des données multidimensionnelles.  
L'annonce de l'atelier peut être retrouvée [ici](https://www.centreemiledurkheim.fr/evenements/atelier-methodes/usages-avances-de-lanalyse-geometrique-des-donnees-multidimensionnelles/).

Vous pouvez récupérer le dossier et l'ensemble des fichiers en cliquant sur le bouton vert "Code" > Download ZIP

## Contenu

Ce repo contient :

- une version figée du notebook en html (`Notebook_AGD.html`) pour facilement retrouver ce que l'on a fait
- le même notebook en qmd (`Notebbok_AGD.qmd`) mis à jour et détaillant les manipulations que vous pouvez remodifier et exécuter
- le script (`AGD_AtelierMethodes_AVousDeJouer.R`) correspondant
- les diapo utilisées pendant la séance
- ⚠️ les données précédemment fournies doivent être ajoutées dans un sous-dossier nommé `data` afin que les chemins de fichier correspondent.

NB : des éléments de syntaxe de R peuvent être retrouvés ici : <https://iqss.github.io/dss-workshops/R/Rintro/base-r-cheat-sheet.pdf>

## Installer R et RStudio

- R :  https://cran.r-project.org/
- RStudio : https://www.rstudio.com/

Besoin d’un tutoriel ? Rendez-vous ici : https://quanti.hypotheses.org/1813

## Installation des packages

Les packages utilisés pour réaliser l'analyse sont détaillées dans le notebook et le script R de la séance.

Pour simplifier l'installation, il est possible de :

1. télécharger le fichier requirements.R
2. lancez R à partir du dossier où se trouve le document
3. lancer la commande suivante dans la console R : `source("requirements.R")`
