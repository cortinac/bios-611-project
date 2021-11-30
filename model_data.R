# model_data.R
# Get data ready for model, save some scatter plots

library(tidyverse)

clean <- read_csv("~/project/derived_data/chg.csv")

clean1115 <- clean %>% filter(date==as.Date("2021-11-15")) %>% rename(chg30=chg) %>%
  filter(chg_aug_1 >= 0)

write_csv(clean1115, "~/project/derived_data/clean1115.csv")