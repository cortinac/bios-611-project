# negative_chg.R
# Filter to just counties/dates with a negative change in vaccination rate form 14 days ago.

library(tidyverse)
chg <- read_csv("~/project/derived_data/chg.csv")

neg_chg <- chg %>% filter(chg < 0)

write_csv(neg_chg, "~/project/derived_data/negative_chg.csv")