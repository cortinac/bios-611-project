# outliers.R
# Remove outliers

library(tidyverse)

clean1115 <- read_csv("~/project/derived_data/clean1115.csv")

q1 <- quantile(clean1115$series_complete_pop_pct, probs=c(.25, .75), na.rm = FALSE)
q2 <- quantile(clean1115$chg_aug_1, probs=c(.25, .75), na.rm = FALSE)
iqr1 <- IQR(clean1115$series_complete_pop_pct)
iqr2 <- IQR(clean1115$chg_aug_1)

v1 <- c(q1[1] - (1.5*iqr1), q1[2] + (1.5*iqr1))
v2 <- c(q2[1] - (1.5*iqr1), q2[2] + (1.5*iqr2))

clean1 <- clean1115 %>% filter(series_complete_pop_pct >= v1[1] & series_complete_pop_pct <= v1[2])
clean2 <- clean1115 %>% filter(chg_aug_1 >= v2[1] & chg_aug_1 <= v2[2])

write_csv(clean1, "~/project/derived_data/clean1.csv")
write_csv(clean2, "~/project/derived_data/clean2.csv")