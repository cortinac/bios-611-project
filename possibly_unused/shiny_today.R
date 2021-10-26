# shiny_today.R
# Create a shiny app to display bar graphs of the most recent day's percents

library(tidyverse)

states_today <- read_csv("project/derived_data/states_today.csv")
states_metro_today <- read_csv("project/derived_data/states_metro_today.csv")
states_nonmetro_today <- read_csv("project/derived_data/states_nonmetro_today.csv")

ggplot(states_today, aes(reorder(recip_state, -complete), complete)) + 
  geom_bar(stat="identity")