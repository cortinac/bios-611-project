# matrix
# Create matrix with variables

library(tidyverse)
library(GGally)

clean1115 <- read_csv("~/project/derived_data/clean1115.csv")

m <- clean1115 %>% select(series_complete_pop_pct, chg_aug_1, RPL_THEME1, RPL_THEME2,
                          RPL_THEME3, RPL_THEME4, RPL_THEMES, metro_status, svi_ctgy)

ggpairs(m, aes(color=svi_ctgy), alpha=0.5)
ggsave("~/project/figures/matrix_themes.png")