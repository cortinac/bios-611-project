# svi_figures.R
# Figures based off SVI categories

library(tidyverse)

us_avg <- read_csv("~/project/derived_data/us_avg.csv")
svi_a <- read_csv("~/project/derived_data/svi_a.csv")
svi_b <- read_csv("~/project/derived_data/svi_b.csv")
svi_c <- read_csv("~/project/derived_data/svi_c.csv")
svi_d <- read_csv("~/project/derived_data/svi_d.csv")

ggplot(us_avg, aes(date, complete)) + geom_line() + geom_line(data=svi_a, color="red") +
  geom_line(data=svi_b, color="blue") + geom_line(data=svi_c, color="green") +
  geom_line(data=svi_d, color="yellow")
ggsave("~/project/figures/svi_avg.png")

ggplot(us_avg, aes(date, change)) + geom_line() + geom_line(data=svi_a, color="red") +
  geom_line(data=svi_b, color="blue") + geom_line(data=svi_c, color="green") +
  geom_line(data=svi_d, color="yellow")
ggsave("~/project/figures/svi_chg.png")

