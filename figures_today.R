# figures_today.R
# Build figures based off of "today" data

library(tidyverse)

states_today <- read_csv("project/derived_data/states_today.csv")
states_metro_today <- read_csv("project/derived_data/states_metro_today.csv")
states_nonmetro_today <- read_csv("project/derived_data/states_nonmetro_today.csv")

ggplot(states_today, aes(reorder(recip_state, -complete), complete)) + 
  geom_bar(stat="identity")

ggplot(states_metro_today, aes(reorder(recip_state, -complete), complete)) +
  geom_bar(stat="identity")

ggplot(states_nonmetro_today, aes(reorder(recip_state, -complete), complete)) +
  geom_bar(stat="identity")

ggplot(states_today, aes(reorder(recip_state, -complete18), complete18)) +
  geom_bar(stat="identity")

ggplot(states_metro_today, aes(reorder(recip_state, -complete18), complete18)) +
  geom_bar(stat="identity")

ggplot(states_nonmetro_today, aes(reorder(recip_state, -complete18), complete18)) +
  geom_bar(stat="identity")

ggplot(states_today, aes(reorder(recip_state, -complete12), complete12)) +
  geom_bar(stat="identity")

ggplot(states_metro_today, aes(reorder(recip_state, -complete12), complete12)) +
  geom_bar(stat="identity")

ggplot(states_nonmetro_today, aes(reorder(recip_state, -complete12), complete12)) +
  geom_bar(stat="identity")

ggplot(states_today, aes(reorder(recip_state, -complete65), complete65)) +
  geom_bar(stat="identity")

ggplot(states_metro_today, aes(reorder(recip_state, -complete65), complete65)) +
  geom_bar(stat="identity")

ggplot(states_nonmetro_today, aes(reorder(recip_state, -complete65), complete65)) +
  geom_bar(stat="identity")