# svi.R
# Look at rates by SVI (Social Vulnerability Index)

library(tidyverse)

clean <- read_csv("~/project/derived_data/clean_svi.csv")

svi_a <- clean %>% group_by(date) %>% filter(svi_ctgy=='A') %>%
  summarize(complete=mean(series_complete_pop_pct),
            change=mean(chg_aug_1))

svi_b <- clean %>% group_by(date) %>% filter(svi_ctgy=='B') %>%
  summarize(complete=mean(series_complete_pop_pct),
            change=mean(chg_aug_1))

svi_c <- clean %>% group_by(date) %>% filter(svi_ctgy=='C') %>%
  summarize(complete=mean(series_complete_pop_pct),
            change=mean(chg_aug_1))

svi_d <- clean %>% group_by(date) %>% filter(svi_ctgy=='D') %>%
  summarize(complete=mean(series_complete_pop_pct),
            change=mean(chg_aug_1))

clean1 <- clean %>%
  mutate(complete_pop = series_complete_yes/(series_complete_pop_pct/100)) %>%
  mutate(onedose_pop = administered_dose1_recip/(administered_dose1_pop_pct/100))

svi_a_rate <- clean1 %>% filter(svi_ctgy=='A') %>% group_by(date) %>%
  summarize(complete = (sum(series_complete_yes)/sum(complete_pop))*100)

svi_b_rate <- clean1 %>% filter(svi_ctgy=='B') %>% group_by(date) %>%
  summarize(complete = (sum(series_complete_yes)/sum(complete_pop))*100)

svi_c_rate <- clean1 %>% filter(svi_ctgy=='C') %>% group_by(date) %>%
  summarize(complete = (sum(series_complete_yes)/sum(complete_pop))*100)

svi_d_rate <- clean1 %>% filter(svi_ctgy=='D') %>% group_by(date) %>%
  summarize(complete = (sum(series_complete_yes)/sum(complete_pop))*100)

write_csv(svi_a, "~/project/derived_data/svi_a.csv")
write_csv(svi_b, "~/project/derived_data/svi_b.csv")
write_csv(svi_c, "~/project/derived_data/svi_c.csv")
write_csv(svi_d, "~/project/derived_data/svi_d.csv")

write_csv(svi_a_rate, "~/project/derived_data/svi_a_rate.csv")
write_csv(svi_b_rate, "~/project/derived_data/svi_b_rate.csv")
write_csv(svi_c_rate, "~/project/derived_data/svi_c_rate.csv")
write_csv(svi_d_rate, "~/project/derived_data/svi_d_rate.csv")