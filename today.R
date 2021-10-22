# today.R
# bring data sets to just the latest date

clean <- read_csv("project/derived_data/clean.csv")
states <- read_csv("project/derived_data/states.csv")
states_metro <- read_csv("project/derived_data/states_metro.csv")
states_nonmetro <- read_csv("project/derived_data/states_nonmetro.csv")

today <- max(clean$date)

clean_today <- clean %>% filter(date==today)
states_today <- states %>% filter(date==today)
states_metro_today <- states_metro %>% filter(date==today)
states_nonmetro_today <- states_nonmetro %>% filter(date==today)

write_csv(clean_today, "project/derived_data/clean_today.csv")
write_csv(states_today, "project/derived_data/states_today.csv")
write_csv(states_metro_today, "project/derived_data/states_metro_today.csv")
write_csv(states_nonmetro_today, "project/derived_data/states_nonmetro_today.csv")