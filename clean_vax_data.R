# clean_vax_data.R
# Clean the vaccination data

library(tidyverse)
vax_data <- read_csv("~/project/derived_data/vax_data.csv")

clean <- vax_data %>%
  filter(fips!='UNK') %>%
  filter(series_complete_pop_pct > 0) %>%
  filter(recip_state != "HI") %>%
  mutate(aug_1 = if_else(date==as.Date("2021-08-01"), series_complete_pop_pct, NA_real_)) %>%
  arrange(fips, date) %>%
  fill(aug_1) %>%
  mutate(chg_aug_1 = series_complete_pop_pct - aug_1)

write_csv(clean, "~/project/derived_data/clean.csv")
