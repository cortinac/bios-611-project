# clean_svi
# Clean SVI data set

library(tidyverse)

svi <- read_csv("~/project/source_data/SVI2018_US_COUNTY.csv")

svi_clean <- svi %>% filter(RPL_THEMES >= 0)

svi_themes <- svi_clean %>% select(FIPS, RPL_THEME1, RPL_THEME2,
                             RPL_THEME3, RPL_THEME4,
                             RPL_THEMES)

write_csv(svi_themes, "~/project/derived_data/svi_themes.csv")