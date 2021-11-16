# m2m.R
# get month to month change

library(tidyverse)
clean <- read_csv("~/project/derived_data/clean.csv")

m2m <- clean %>% filter(date == as.Date("2021-08-01") |
                          date == as.Date("2021-09-01") |
                          date == as.Date("2021-10-01") |
                          date == as.Date("2021-11-01")) %>%
  group_by(recip_county, recip_state) %>%
  mutate(prevdate=lag(date)) %>%
  mutate(prevcomplete=lag(series_complete_pop_pct)) %>%
  mutate(m2mchange=series_complete_pop_pct-prevcomplete)