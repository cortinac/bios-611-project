# chg.R
# get change for each day

library(tidyverse)
clean <- read_csv("~/project/derived_data/clean_svi.csv")

lagtime <- 30

chg <- clean %>%
  group_by(recip_county, recip_state) %>%
  mutate(prevdate=lag(date,lagtime)) %>%
  mutate(prevcomplete=lag(series_complete_pop_pct,lagtime)) %>%
  mutate(chg=series_complete_pop_pct-prevcomplete)

write_csv(chg, "~/project/derived_data/chg.csv")