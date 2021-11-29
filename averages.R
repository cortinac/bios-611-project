# averages.R
# get average values

library(tidyverse)

clean <- read_csv("~/project/derived_data/clean_svi.csv")

us_avg <- clean %>% group_by(date) %>% 
  summarize(complete=mean(series_complete_pop_pct),
            complete12=mean(series_complete_12pluspop),
            complete18=mean(series_complete_18pluspop),
            complete65=mean(series_complete_65pluspop),
            onedose=mean(administered_dose1_pop_pct),
            onedose12=mean(administered_dose1_recip_12pluspop_pct),
            onedose18=mean(administered_dose1_recip_18pluspop_pct),
            onedose65=mean(administered_dose1_recip_65pluspop_pct),
            change=mean(chg_aug_1))

metro_avg <- clean %>% filter(metro_status=="Metro") %>% group_by(date) %>%
  summarize(complete=mean(series_complete_pop_pct),
            complete12=mean(series_complete_12pluspop),
            complete18=mean(series_complete_18pluspop),
            complete65=mean(series_complete_65pluspop),
            onedose=mean(administered_dose1_pop_pct),
            onedose12=mean(administered_dose1_recip_12pluspop_pct),
            onedose18=mean(administered_dose1_recip_18pluspop_pct),
            onedose65=mean(administered_dose1_recip_65pluspop_pct),
            change=mean(chg_aug_1))

nonmetro_avg <- clean %>% filter(metro_status=="Non-metro") %>% group_by(date) %>%
  summarize(complete=mean(series_complete_pop_pct),
            complete12=mean(series_complete_12pluspop),
            complete18=mean(series_complete_18pluspop),
            complete65=mean(series_complete_65pluspop),
            onedose=mean(administered_dose1_pop_pct),
            onedose12=mean(administered_dose1_recip_12pluspop_pct),
            onedose18=mean(administered_dose1_recip_18pluspop_pct),
            onedose65=mean(administered_dose1_recip_65pluspop_pct),
            change=mean(chg_aug_1))

write_csv(us_avg, "~/project/derived_data/us_avg.csv")
write_csv(metro_avg, "~/project/derived_data/metro_avg.csv")
write_csv(nonmetro_avg, "~/project/derived_data/nonmetro_avg.csv")
                                                 