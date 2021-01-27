################################################################################
#         Social Influence on Shopping
#           A case of Millenials
################################################################################

#Setting working directory
setwd("C:/Users/Matshisela/Documents/Millenials-Advertisiment")

# Loading libraries 
library(tidyverse)
#install.packages('ggstatsplot')
library(ggstatsplot)
library(openxlsx)

#Loading data
advert_data <- read.csv("WhatsgoodlyData-6.csv")

# Making data long for variability
advert_gender <- read.xlsx("millenial_gender.xlsx")
advert_religion <- read.xlsx("millenial_religion.xlsx")
advert_status <- read.xlsx("millenial_status.xlsx")
advert_race <- read.xlsx("millenial_race.xlsx")

# Combining excel sheets

advert_data2 <- rbind(advert_gender, advert_religion, advert_status,
                      advert_race)

# Viewing data
glimpse(advert_data)
summary(advert_data)
View(advert_data2)


# let's use subset of data
ggpiestats(
  data = dplyr::filter(
    .data = advert_data2,
    Description %in% c("Are you single? No", "Are you single? Yes", "Are you? Christian", "Are you? Jewish", "Are you? Muslim
", "closely identify as? Asian", "closely identify as? Black", "closely identify as? Hispanic
", "closely identify as? Native American", "closely identify as? White",
                               "Sexual orientation? Straight")
  ),
  x = Platform,
  y = Description
)