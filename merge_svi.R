# merge_svi
# Merge SVI and Vaccine data

library(tidyverse)

svi <- read_csv("~/project/derived_data/svi_themes.csv")
clean <- read_csv("~/project/derived_data/clean.csv")

svi1 <- svi %>% rename(fips=FIPS)

clean1 <- clean %>% inner_join(svi1, by="fips")

write_csv(clean1, "~/project/derived_data/clean_svi.csv")