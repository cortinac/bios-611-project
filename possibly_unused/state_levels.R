# state_levels.R
# Get population estimates, state totals

library(tidyverse)
clean <- read_csv("~/project/derived_data/clean.csv")

# Note: Populations will have some error. These are derived from the percents and counts
with_pops <- clean %>%
  mutate(total_pop = (clean$series_complete_yes)/(clean$series_complete_pop_pct/100)) %>%
  mutate(pop12plus = (clean$series_complete_12plus)/(clean$series_complete_12pluspop/100)) %>%
  mutate(pop18plus = (clean$series_complete_18plus)/(clean$series_complete_18pluspop/100)) %>%
  mutate(pop65plus = (clean$series_complete_65plus)/(clean$series_complete_65pluspop/100)) %>%
  mutate(total_onedose = (clean$administered_dose1_recip)/(clean$administered_dose1_pop_pct/100)) %>%
  mutate(onedose12 = (clean$administered_dose1_recip_12plus)/(clean$administered_dose1_recip_12pluspop_pct/100)) %>%
  mutate(onedose18 = (clean$administered_dose1_recip_18plus)/(clean$administered_dose1_recip_18pluspop_pct/100)) %>%
  mutate(onedose65 = (clean$administered_dose1_recip_65plus)/(clean$administered_dose1_recip_65pluspop_pct/100))

with_pops_tot <- with_pops %>% 
  group_by(date, recip_state) %>%
  summarize(across(c(series_complete_yes, total_pop, series_complete_12plus, pop12plus,
                     series_complete_18plus, pop18plus, series_complete_65plus, pop65plus,
                     administered_dose1_recip, total_onedose, administered_dose1_recip_12plus, onedose12,
                     administered_dose1_recip_18plus, onedose18, administered_dose1_recip_65plus, onedose65),
                   list(sum)))

states <- with_pops_tot %>%
  mutate(complete = (series_complete_yes_1/total_pop_1)*100) %>%
  mutate(complete12 = (series_complete_12plus_1/pop12plus_1)*100) %>%
  mutate(complete18 = (series_complete_18plus_1/pop18plus_1)*100) %>%
  mutate(complete65 = (series_complete_65plus_1/pop65plus_1)*100) %>%
  mutate(onedose = (administered_dose1_recip_1/total_onedose_1)*100) %>%
  mutate(onedose12 = (administered_dose1_recip_12plus_1/onedose12_1)*100) %>%
  mutate(onedose18 = (administered_dose1_recip_18plus_1/onedose18_1)*100) %>%
  mutate(onedose65 = (administered_dose1_recip_65plus_1/onedose65_1)*100)

metro_tot <- with_pops %>% filter(metro_status=="Metro") %>%
  group_by(date, recip_state) %>%
  summarize(across(c(series_complete_yes, total_pop, series_complete_12plus, pop12plus,
                     series_complete_18plus, pop18plus, series_complete_65plus, pop65plus,
                     administered_dose1_recip, total_onedose, administered_dose1_recip_12plus, onedose12,
                     administered_dose1_recip_18plus, onedose18, administered_dose1_recip_65plus, onedose65),
                   list(sum)))

states_metro <- metro_tot %>%
  mutate(complete = (series_complete_yes_1/total_pop_1)*100) %>%
  mutate(complete12 = (series_complete_12plus_1/pop12plus_1)*100) %>%
  mutate(complete18 = (series_complete_18plus_1/pop18plus_1)*100) %>%
  mutate(complete65 = (series_complete_65plus_1/pop65plus_1)*100) %>%
  mutate(onedose = (administered_dose1_recip_1/total_onedose_1)*100) %>%
  mutate(onedose12 = (administered_dose1_recip_12plus_1/onedose12_1)*100) %>%
  mutate(onedose18 = (administered_dose1_recip_18plus_1/onedose18_1)*100) %>%
  mutate(onedose65 = (administered_dose1_recip_65plus_1/onedose65_1)*100)
  
nonmetro_tot <- with_pops %>% filter(metro_status=="Non-metro") %>%
  group_by(date, recip_state) %>%
  summarize(across(c(series_complete_yes, total_pop, series_complete_12plus, pop12plus,
                     series_complete_18plus, pop18plus, series_complete_65plus, pop65plus,
                     administered_dose1_recip, total_onedose, administered_dose1_recip_12plus, onedose12,
                     administered_dose1_recip_18plus, onedose18, administered_dose1_recip_65plus, onedose65),
                   list(sum)))

states_nonmetro <- nonmetro_tot %>%
  mutate(complete = (series_complete_yes_1/total_pop_1)*100) %>%
  mutate(complete12 = (series_complete_12plus_1/pop12plus_1)*100) %>%
  mutate(complete18 = (series_complete_18plus_1/pop18plus_1)*100) %>%
  mutate(complete65 = (series_complete_65plus_1/pop65plus_1)*100) %>%
  mutate(onedose = (administered_dose1_recip_1/total_onedose_1)*100) %>%
  mutate(onedose12 = (administered_dose1_recip_12plus_1/onedose12_1)*100) %>%
  mutate(onedose18 = (administered_dose1_recip_18plus_1/onedose18_1)*100) %>%
  mutate(onedose65 = (administered_dose1_recip_65plus_1/onedose65_1)*100)

write_csv(states,"~/project/derived_data/states.csv")
write_csv(states_metro,"~/project/derived_data/states_metro.csv")
write_csv(states_nonmetro,"~/project/derived_data/states_nonmetro.csv")

