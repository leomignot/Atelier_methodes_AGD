############################
#Installation des packages utiles
############################
#install.packages("Factoshiny")
#install.packages("FactoMineR")
#install.packages("shiny")
#install.packages("ggplot2") 
#install.packages("FactoInvestigate") 
#install.packages("ggpp")
#install.packages("dplyr") 
#install.packages("ggpmisc") 

############################
#Chargement de ces packages utiles
############################
library(FactoMineR)
library(shiny)
library(FactoInvestigate)
library(ggplot2)
library(Factoshiny)
library(ggpp)
library(dplyr)
library(ggpmisc)

############################
############################
#Data introductives (OCDE)
############################
############################

# OUVERTURE Jeu de données
library(readxl)
# ici il faut adapter le chemin à sa propre arborescence
ex1 <- read_excel("/Users/v.le.hay/Desktop/CED_AtelierAGD_Avril25/EX1_DonneesOCDE_Base2.xls")
View(ex1)

#Statistiques descriptives (variables continues)
summary(ex1)
head(ex1)

#Visualisation du nuage de points 
library(ggplot2)
print(ggplot(ex1, aes(x = TxChmge2000CR, y = TxChmge2007CR)) +
  geom_point(color = "#EF6A40", size = 3) +
  geom_text(aes(label = id), hjust = -0.1, vjust = 0.5, size = 3) +
  theme_minimal() +
  labs(
    title = "Ici je peux mettre un titre",
    x = "légende pour l'axe x",
    y = "légende pour l'axe y"
  ))

#Etiqueter sans chevauchement de labels : package ggrepel
library(ggrepel)
ggplot(ex1, aes(x = TxChmge2000CR, y = TxChmge2007CR)) +
  geom_point(color = "steelblue", size = 3) +
  geom_text_repel(aes(label = id), size = 3, max.overlaps = Inf) +
  theme_minimal() +
  labs(
    title = "Ici je peux mettre un titre",
    x = "légende pour l'axe x",
    y = "légende pour l'axe y"
  )

#Sélectionner certains points que l'on souhaite étiqueter (et pas les autres) :
#packages dplyr et ggpmisc
library(stats)
library(base)
library(ggplot2)
library(ggrepel)
library(dplyr)


# Identifier les points extrêmes à annoter (par exemple sur Y)
points_a_annoter <- ex1 %>%
  arrange(TxChmge2007CR) %>%
  slice_head(n = 5) %>%    # les 5 plus bas
  bind_rows(
    ex1 %>% arrange(desc(TxChmge2007CR)) %>% slice_head(n = 7)  # les 7 plus hauts
  )

# Ajouter aussi le point avec la valeur maximale sur l'axe X
points_max_pop <- ex1 %>% arrange(desc(TxChmge2000CR)) %>% slice_head(n = 9)

# Combiner avec les autres extrêmes
points_a_annoter <- ex1 %>%
  arrange(TxChmge2000CR) %>%
  slice_head(n = 7) %>%
  bind_rows(
    ex1 %>% arrange(desc(TxChmge2007CR)) %>% slice_head(n = (7)),
    points_max_pop
  ) %>%
  distinct()  # pour éviter les doublons

# Nuage de points avec étiquettes seulement sur les points extrêmes
p <- ggplot(ex1, aes(x = TxChmge2000CR, y = TxChmge2007CR)) +
  geom_point(color = "steelblue", size = 3) +
  geom_text_repel(
    data = points_a_annoter,
    aes(label = id),
    size = 3
  ) +
  theme_minimal() +
  labs(
    title = "Ici je peux mettre un titre",
    x = "légende pour l'axe x",
    y = "légende pour l'axe y"
  )
print(p)

#Ajout de la Droite de régression au graphe "p" déjà construit
p +
  geom_smooth(method = "lm", se = TRUE, color = "darkred") +
  stat_poly_eq(
    aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~")),
    formula = y ~ x,
    parse = TRUE,
    size = 4,
    color = "darkred"
  ) 

#ACP dans Factoshiny
# script en commentaire pour qu'il ne s'exécute pas dans le notebook
# acp <- Factoshiny(ex1)

#ACP avec FactomineR
library(FactoMineR)
res.PCA<-PCA(ex1,quali.sup=c(1),quanti.sup=c(4,5),graph=FALSE)
plot.PCA(res.PCA,choix='var')
plot.PCA(res.PCA,invisible=c('ind','ind.sup'),select='contrib  95',cex=0.5, 
           cex.main=0.5,cex.axis=0.5,label =c('quali'))



############################
############################
#ACP Mirna SAFI
############################
############################


# Ouverture fichier
safi <- read_excel("/Users/v.le.hay/Desktop/CED_AtelierAGD_Avril25/EX2_ACP_MirnaSAFI_Extract.xls")
View(safi)

summary(safi)
# Factoshiny
#acp <- Factoshiny(safi)

# FactoMineR
library(FactoMineR)
# graphiques initiaux réalisés dans Factoshiny
res.PCA<-PCA(safi,quali.sup=c(6),graph=FALSE)
plot.PCA(res.PCA,choix='var')
plot.PCA(res.PCA,invisible=c('ind.sup'),habillage=6,cex=0.8,cex.main=0.8,cex.axis=0.8,label =c('quali', cex = 3, col = "black"))

plot.PCA(res.PCA,invisible=c('ind.sup'),cex=1.2,cex.main=1.2,cex.axis=1.2,label =c('quali'))

summary(res.PCA)
dimdesc(res.PCA)

############################
############################
#ACP Nonna Mayer
############################
############################

A VOUS DE JOUER 


############################
############################
#ACM Julien DUVAL (Cinéma)
############################
############################

A VOUS DE JOUER

### Pour aller plus loin
####################################################################
# Je fais les graphes dans R-Studio via le package GDAtool
# https://cran.r-project.org/web/packages/GDAtools/GDAtools.pdf
####################################################################

# Installation des 2 packages nécessaires
# + chargement des 2 librairies

install.packages("GDAtools")
library(GDAtools)

install.packages("sf")
library(sf)

# je copie-colle de factoshiny
mca_duval<-MCA(duval,quanti.sup=c(1),quali.sup=c(17),graph=FALSE)
summary(mca_duval) 
dimdesc(mca_duval)
plot.MCA(mca_duval, choix='var',col.quali.sup='#006400')
plot.MCA(mca_duval,invisible= 'ind',col.quali.sup='#006400',label =c('var','quali.sup'))

mca_duval$eig
modif.rate(mca_duval)
tabcontrib(mca_duval, dim = 1)
dimdescr(mca_duval, vars = NULL, dim = c(1,2),
         limit = NULL, correlation = "pearson",
         na.rm.cat = FALSE, na.value.cat = "NA", na.rm.cont = FALSE,
         nperm = NULL, distrib = "asympt",
         shortlabs = TRUE)
dimcontrib(mca_duval, dim = c(1,2), best = TRUE)

# Nuage des individus
# ici dans le plan 1-2 ==> axes = c(1,2)
ggcloud_indiv(mca_duval, type = "i", points = "all", axes = c(1,2),
              col = "dodgerblue4", point.size = 0.5, alpha = 0.6,
              repel = FALSE, text.size = 2,
              density = NULL, col.contour = "darkred", hex.bins = 50, 
              hex.pal = "viridis" )  +
  coord_fixed(ratio = 1)

# nuage de TOUTES les modalités actives
# toujours dans le plan 1-2
# toutes les modalités : points = "all"
ggcloud_variables(mca_duval, axes = c(1,2), points = "all",
                  min.ctr = NULL, max.pval = 0.01, face = "pp",
                  shapes = TRUE, prop = NULL, textsize = 3, shapesize = 3,
                  col = NULL, col.by.group = TRUE, alpha = 1,
                  segment.alpha = 0.5, vlab = FALSE, legend = "right",
                  force = 1, max.overlaps = Inf) +
  coord_fixed(ratio = 1)

# Nuage des modalités actives qui contribuent à l'axe horizontal
# toujours dans le plan 1-2
# toutes les modalités : points = "besth"
ggcloud_variables(mca_duval, axes = c(1,2), points = "besth",
                  min.ctr = NULL, max.pval = 0.01, face = "pp",
                  shapes = TRUE, prop = NULL, textsize = 3, shapesize = 3,
                  col = NULL, col.by.group = TRUE, alpha = 1,
                  segment.alpha = 0.5, vlab = FALSE, legend = "right",
                  force = 1, max.overlaps = Inf)+
  coord_fixed(ratio = 1)

# Nuage des modalités actives qui contribuent à l'axe vertical
# toujours dans le plan 1-2
# toutes les modalités : points = "bestv"
ggcloud_variables(mca_duval, axes = c(1,2), points = "bestv",
                  min.ctr = NULL, max.pval = 0.01, face = "pp",
                  shapes = TRUE, prop = NULL, textsize = 3, shapesize = 3,
                  col = NULL, col.by.group = TRUE, alpha = 1,
                  segment.alpha = 0.5, vlab = FALSE, legend = "right",
                  force = 1, max.overlaps = Inf)+
  coord_fixed(ratio = 1)

# Nuage des modalités actives qui contribuent aux 2 axes
# toujours dans le plan 1-2
# toutes les modalités : points = "besthv"
p <- ggcloud_variables(mca_duval, axes = c(1,2), points = "besthv",
                       min.ctr = NULL, max.pval = 0.01, face = "pp",
                       shapes = TRUE, prop = NULL, textsize = 3, shapesize = 3,
                       col = NULL, col.by.group = TRUE, alpha = 1,
                       segment.alpha = 0.5, vlab = FALSE, legend = "right",
                       force = 1, max.overlaps = Inf)+
  coord_fixed(ratio = 1)

# Superposition de variables supplémentaires 'au compte-gouttes'
# ici WW
duval$WW <- as.factor(duval$WW)
freq(duval$WW)
ggadd_supvar(p, mca_duval, duval$WW, axes = c(1,2), 
             col = "black", shape = 1, prop = NULL, 
             textsize = 3, shapesize = 6,
             segment = FALSE, vname = NULL )




############################
############################
#ACM spécifique médiapolis
############################
############################

A VOUS DE JOUER