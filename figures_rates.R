# figures_rates.R
# Figure for overall rates

library(tidyverse)

us_rate <- read_csv("~/project/derived_data/us_rate.csv")
metro_rate <- read_csv("~/project/derived_data/metro_rate.csv")
nonmetro_rate <- read_csv("~/project/derived_data/nonmetro_rate.csv")

ggplot(us_rate, aes(date, complete)) + geom_line() + geom_line(data=metro_rate, color="red") +
  geom_line(data=nonmetro_rate, color="blue")
ggsave("~/project/figures/rate.png")

# ggplot(us_rate, aes(date, onedose)) + geom_line() + geom_line(data=metro_rate, color="red") +
#   geom_line(data=nonmetro_rate, color="blue")