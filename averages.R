# averages.R
# get average values

library(tidyverse)

clean <- read_csv("~/project/derived_data/clean.csv")

us_avg <- clean %>% group_by(date) %>% 
  summarize(complete=mean(series_complete_pop_pct),
            complete12=mean(series_complete_12pluspop),
            complete18=mean(series_complete_18pluspop),
            complete65=mean(series_complete_65pluspop),
            onedose=mean(administered_dose1_pop_pct),
            onedose12=mean(administered_dose1_recip_12pluspop_pct),
            onedose18=mean(administered_dose1_recip_18pluspop_pct),
            onedose65=mean(administered_dose1_recip_65pluspop_pct))

metro_avg <- clean %>% filter(metro_status=="Metro") %>% group_by(date) %>%
  summarize(complete=mean(series_complete_pop_pct),
            complete12=mean(series_complete_12pluspop),
            complete18=mean(series_complete_18pluspop),
            complete65=mean(series_complete_65pluspop),
            onedose=mean(administered_dose1_pop_pct),
            onedose12=mean(administered_dose1_recip_12pluspop_pct),
            onedose18=mean(administered_dose1_recip_18pluspop_pct),
            onedose65=mean(administered_dose1_recip_65pluspop_pct))

nonmetro_avg <- clean %>% filter(metro_status=="Non-metro") %>% group_by(date) %>%
  summarize(complete=mean(series_complete_pop_pct),
            complete12=mean(series_complete_12pluspop),
            complete18=mean(series_complete_18pluspop),
            complete65=mean(series_complete_65pluspop),
            onedose=mean(administered_dose1_pop_pct),
            onedose12=mean(administered_dose1_recip_12pluspop_pct),
            onedose18=mean(administered_dose1_recip_18pluspop_pct),
            onedose65=mean(administered_dose1_recip_65pluspop_pct))

clean1 <- clean %>%
  mutate(complete_pop = series_complete_yes/(series_complete_pop_pct/100))

us_rate <- clean1 %>% group_by(date) %>%
  summarize(complete = (sum(series_complete_yes)/sum(complete_pop))*100)

metro_rate <- clean1 %>% filter(metro_status=="Metro") %>% group_by(date) %>%
  summarize(complete = (sum(series_complete_yes)/sum(complete_pop))*100)

nonmetro_rate <- clean1 %>% filter(metro_status=="Non-metro") %>% group_by(date) %>%
  summarize(complete = (sum(series_complete_yes)/sum(complete_pop))*100)

write_csv(us_avg, "~/project/derived_data/us_avg.csv")
write_csv(metro_avg, "~/project/derived_data/metro_avg.csv")
write_csv(nonmetro_avg, "~/project/derived_data/nonmetro_avg.csv")
write_csv(us_rate, "~/project/derived_data/us_rate.csv")
write_csv(metro_rate, "~/project/derived_data/metro_rate.csv")
write_csv(nonmetro_rate, "~/project/derived_data/nonmetro_rate.csv")
                                                 