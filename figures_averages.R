# figures_averages.R
# Create line graph for US average, Metro average, Nonmetro average

library(tidyverse)

us_avg <- read_csv("~/project/derived_data/us_avg.csv")
metro_avg <- read_csv("~/project/derived_data/metro_avg.csv")
nonmetro_avg <- read_csv("~/project/derived_data/nonmetro_avg.csv")

ggplot(us_avg, aes(date, complete)) + geom_line() + geom_line(data=metro_avg, color="red") +
  geom_line(data=nonmetro_avg, color="blue")

ggplot(us_avg, aes(date, complete18)) + geom_line() + geom_line(data=metro_avg, color="red") +
  geom_line(data=nonmetro_avg, color="blue")

us_rate <- read_csv("~/project/derived_data/us_rate.csv")
metro_rate <- read_csv("~/project/derived_data/metro_rate.csv")
nonmetro_rate <- read_csv("~/project/derived_data/nonmetro_rate.csv")

ggplot(us_rate, aes(date, complete)) + geom_line() + geom_line(data=metro_rate, color="red") +
  geom_line(data=nonmetro_rate, color="blue")