# onevarreg.R
# Regression with just overall theme

library(tidyverse)

clean1115 <- read_csv("~/project/derived_data/clean1115.csv")

lm1 <- lm(series_complete_pop_pct ~ RPL_THEMES, clean1115)
summary(lm1)