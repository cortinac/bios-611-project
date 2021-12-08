# max_min.R
# See which counties have the highest and lowest rates

library(tidyverse)

clean <- read_csv("~/project/derived_data/clean.csv")

max_date <- max(clean$date)

clean_latest <- clean %>% filter(date==max_date)

clean_min <- clean_latest %>% arrange(series_complete_pop_pct)
clean_max <- clean_latest %>% arrange(-series_complete_pop_pct)

print(clean_min)