# today.R
# bring data sets to just the latest date

clean <- read_csv("~/project/derived_data/clean.csv")
states <- read_csv("~/project/derived_data/states.csv")
states_metro <- read_csv("~/project/derived_data/states_metro.csv")
states_nonmetro <- read_csv("~/project/derived_data/states_nonmetro.csv")

today1 <- max(clean$date)
today2 <- max(states$date)
today3 <- max(states_metro$date)
today4 <- max(states_nonmetro$date)

clean_today <- clean %>% filter(date==today1)
states_today <- states %>% filter(date==today2)
states_metro_today <- states_metro %>% filter(date==today3)
states_nonmetro_today <- states_nonmetro %>% filter(date==today4)

write_csv(clean_today, "~/project/derived_data/clean_today.csv")
write_csv(states_today, "~/project/derived_data/states_today.csv")
write_csv(states_metro_today, "~/project/derived_data/states_metro_today.csv")
write_csv(states_nonmetro_today, "~/project/derived_data/states_nonmetro_today.csv")