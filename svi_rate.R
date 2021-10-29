# svi_rate.R
# Create figure for SVI rates

library(tidyverse)

us_rate <- read_csv("~/project/derived_data/us_rate.csv")
svi_a_rate <- read_csv("~/project/derived_data/svi_a_rate.csv")
svi_b_rate <- read_csv("~/project/derived_data/svi_b_rate.csv")
svi_c_rate <- read_csv("~/project/derived_data/svi_c_rate.csv")
svi_d_rate <- read_csv("~/project/derived_data/svi_d_rate.csv")

ggplot(us_rate, aes(date, complete)) + geom_line(aes(color="us")) +
  geom_line(data=svi_a_rate, aes(color="a")) + 
  geom_line(data=svi_b_rate, aes(color="b")) + 
  geom_line(data=svi_c_rate, aes(color="c")) +
  geom_line(data=svi_d_rate, aes(color="d")) +
  xlab("Date") + ylab("% Complete Vaccine Sequence") +
  scale_color_manual(values = c("us"="black", "a"="blue", "b"="red", "c"="green", "d"="orange"),
                     labels = c("US Rate", "A", "B", "C", "D"),
                     name = "SVI Category")
ggsave("~/project/figures/svi_rate.png")