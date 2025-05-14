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
  "haven",
  "GDAtools",
  "sf",
  "questionr"
)
# also using "base" and "stats" packages but they come vanilla and are loaded by default

# Install 
installed <- packages %in% rownames(installed.packages())

if (any(!installed)) {
  install.packages(packages[!installed])
}

# Load
invisible(lapply(packages, library, character.only = TRUE))
