# rates.R
# create data sets with overall rates

library(tidyverse)

clean <- read_csv("~/project/derived_data/clean_svi.csv")

clean1 <- clean %>%
  mutate(complete_pop = series_complete_yes/(series_complete_pop_pct/100)) %>%
  mutate(onedose_pop = administered_dose1_recip/(administered_dose1_pop_pct/100))

us_rate <- clean1 %>% group_by(date) %>%
  summarize(complete = (sum(series_complete_yes)/sum(complete_pop))*100,
            onedose = (sum(administered_dose1_recip/sum(onedose_pop))*100))

metro_rate <- clean1 %>% filter(metro_status=="Metro") %>% group_by(date) %>%
  summarize(complete = (sum(series_complete_yes)/sum(complete_pop))*100,
            onedose = (sum(administered_dose1_recip/sum(onedose_pop))*100))

nonmetro_rate <- clean1 %>% filter(metro_status=="Non-metro") %>% group_by(date) %>%
  summarize(complete = (sum(series_complete_yes)/sum(complete_pop))*100,
            onedose = (sum(administered_dose1_recip/sum(onedose_pop))*100))

write_csv(us_rate, "~/project/derived_data/us_rate.csv")
write_csv(metro_rate, "~/project/derived_data/metro_rate.csv")
write_csv(nonmetro_rate, "~/project/derived_data/nonmetro_rate.csv")