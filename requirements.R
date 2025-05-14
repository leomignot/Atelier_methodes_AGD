# Requirements
packages <- c(
  "Factoshiny",
  "FactoMineR",
  "shiny",
  "ggplot2",
  "FactoInvestigate",
  "ggpp",
  "dplyr",
  "ggpmisc",
  "ggrepel",
  "readxl",
  "haven"
)

# Install 
installed <- packages %in% rownames(installed.packages())

if (any(!installed)) {
  install.packages(packages[!installed])
}

# Load
invisible(lapply(packages, library, character.only = TRUE))
