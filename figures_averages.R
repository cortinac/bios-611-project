# figures_averages.R
# Create line graph for US average, Metro average, Nonmetro average

library(tidyverse)

us_avg <- read_csv("~/project/derived_data/us_avg.csv")
metro_avg <- read_csv("~/project/derived_data/metro_avg.csv")
nonmetro_avg <- read_csv("~/project/derived_data/nonmetro_avg.csv")

ggplot(us_avg, aes(date, complete)) + geom_line() + geom_line(data=metro_avg, color="red") +
  geom_line(data=nonmetro_avg, color="blue")
ggsave("~/project/figures/avg.png")

ggplot(us_avg, aes(date, change)) + geom_line() + geom_line(data=metro_avg, color="red") +
  geom_line(data=nonmetro_avg, color="blue")
ggsave("~/project/figures/avg_chg.png")

# ggplot(us_avg, aes(date, onedose)) + geom_line() + geom_line(data=metro_avg, color="red") +
#   geom_line(data=nonmetro_avg, color="blue")