# clean_vax_data.R
# Clean the vaccination data

library(tidyverse)
vax_data <- read_csv("~/project/derived_data/vax_data.csv")

clean <- vax_data %>%
  filter(fips!='UNK') %>%
  filter(series_complete_pop_pct > 0)

write_csv(clean, "~/project/derived_data/clean.csv")
