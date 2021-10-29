# svi_rate.R
# Create figure for SVI rates

library(tidyverse)

us_rate <- read_csv("~/project/derived_data/us_rate.csv")
svi_a_rate <- read_csv("~/project/derived_data/svi_a_rate.csv")
svi_b_rate <- read_csv("~/project/derived_data/svi_b_rate.csv")
svi_c_rate <- read_csv("~/project/derived_data/svi_c_rate.csv")
svi_d_rate <- read_csv("~/project/derived_data/svi_d_rate.csv")

ggplot(us_rate, aes(date, complete)) + geom_line() +
  geom_line(data=svi_a_rate, color="red") + 
  geom_line(data=svi_b_rate, color="blue") + 
  geom_line(data=svi_c_rate, color="green") +
  geom_line(data=svi_d_rate, color="yellow")
ggsave("~/project/figures/svi_rate.png")