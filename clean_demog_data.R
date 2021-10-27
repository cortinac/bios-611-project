# clean_demog_data.csv
# Clean Demographic data

library(tidyverse)

demog1 <- read_csv("~/project/source_data/nhgis0015_ds244_20195_county.csv")
demog2 <- read_csv("~/project/source_data/nhgis0015_ds245_20195_county.csv")
demog3 <- read_csv("~/project/source_data/nhgis0015_ds248_2020_county.csv")

demog1_ <- demog1 %>% select(STUSAB, STATE, COUNTY,
                             tot_sex_age = ALT0E001,
                             tot_male = ALT0E002,
                             tot_female = ALT0E026,
                             med_income = ALW1M001,
                             med_rent = AL05M001,
                             med_value = AL1HM001)

demog2_ <- demog2 %>% select(STUSAB, STATE, COUNTY,
                             income_ineq = AMEME001)

demog3_ <- demog3 %>% select(STUSAB, STATE, COUNTY,
                             tot_race = U7B001,
                             tot_white = U7B003,
                             tot_black = U7B004,
                             tot_amind = ALUCE004,
                             tot_asian = ALUCE005,
                             tot_hawaii = ALUCE006,
                             tot_other = ALUCE007,
                             tot_mix = ALUCE008,
                             tot_ethnic = ALUKE001,
                             tot_nothisp= ALUKE002,
                             tot_hisp = ALUKE012,)

