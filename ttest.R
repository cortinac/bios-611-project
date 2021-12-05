# ttest.R
# T-test to look at metro vs nonmetro

library(tidyverse)

clean1115 <- read_csv("~/project/derived_data/clean1115.csv") %>% filter(!is.na(metro_status))

t.test(clean1115$series_complete_pop_pct~clean1115$metro_status)

t.test(clean1115$chg_aug_1~clean1115$metro_status)

ggplot(clean1115, aes(metro_status, series_complete_pop_pct)) + geom_boxplot() +
  stat_summary(fun=mean, shape=23, fill="blue")
ggsave("~/project/figures/metro_box.png")
ggplot(clean1115, aes(metro_status, chg_aug_1)) + geom_boxplot() +
  stat_summary(fun=mean, shape=23, fill="blue")
ggsave("~/project/figures/metro_box_chg.png")