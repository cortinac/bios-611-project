# svi_figures.R
# Figures based off SVI categories

library(tidyverse)

us_avg <- read_csv("~/project/derived_data/us_avg.csv")
svi_a <- read_csv("~/project/derived_data/svi_a.csv")
svi_b <- read_csv("~/project/derived_data/svi_b.csv")
svi_c <- read_csv("~/project/derived_data/svi_c.csv")
svi_d <- read_csv("~/project/derived_data/svi_d.csv")

ggplot(us_avg, aes(date, complete)) + geom_line(aes(color="us")) + geom_line(data=svi_a, aes(color="a")) +
  geom_line(data=svi_b, aes(color="b")) + geom_line(data=svi_c, aes(color="c")) +
  geom_line(data=svi_d, aes(color="d")) + xlab("Date") + ylab("% Complete Vaccine Sequence") +
  scale_color_manual(values = c("us"="black", "a"="blue", "b"="red", "c"="green", "d"="orange"),
                     labels = c("US Average", "A", "B", "C", "D"),
                     name = "SVI Category")
ggsave("~/project/figures/svi_avg.png")

ggplot(us_avg, aes(date, change)) + geom_line(aes(color="us")) + geom_line(data=svi_a, aes(color="a")) +
  geom_line(data=svi_b, aes(color="b")) + geom_line(data=svi_c, aes(color="c")) +
  geom_line(data=svi_d, aes(color="d")) + xlab("Date") + ylab("Change in % Complete Vaccine Sequence from August 1") +
  scale_color_manual(values = c("us"="black", "a"="blue", "b"="red", "c"="green", "d"="orange"),
                     labels = c("US Average", "A", "B", "C", "D"),
                     name = "SVI Category")
ggsave("~/project/figures/svi_chg.png")

