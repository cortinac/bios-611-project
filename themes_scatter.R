# themes_scatter.R
# Make scatter plots by theme

library(tidyverse)

clean1115 <- read_csv("~/project/derived_data/clean1115.csv")

ggplot(clean1115, aes(RPL_THEMES, series_complete_pop_pct)) + geom_point(aes(color=svi_ctgy), alpha=0.5) +
  xlab("Overall SVI Score") + ylab("COVID-19 Vaccination Rate") + scale_color_discrete("SVI Category")
ggsave("~/project/figures/themes.png", width=9, height=6, units="in")
ggplot(clean1115, aes(RPL_THEMES, chg_aug_1)) + geom_point(aes(color=svi_ctgy), alpha=0.5) +
  xlab("Overall SVI Score") + ylab("Change in Vaccination Rate from August 1") + scale_color_discrete("SVI Category")
ggsave("~/project/figures/themes_aug1.png", width=9, height=6, units="in")

ggplot(clean1115, aes(RPL_THEME1, series_complete_pop_pct)) + geom_point(aes(color=svi_ctgy), alpha=0.5)
ggsave("~/project/figures/theme1.png", width=9, height=6, units="in")
ggplot(clean1115, aes(RPL_THEME1, chg_aug_1)) + geom_point(aes(color=svi_ctgy), alpha=0.5)
ggsave("~/project/figures/theme1_aug1.png", width=9, height=6, units="in")

ggplot(clean1115, aes(RPL_THEME2, series_complete_pop_pct)) + geom_point(aes(color=svi_ctgy), alpha=0.5)
ggsave("~/project/figures/theme2.png", width=9, height=6, units="in")
ggplot(clean1115, aes(RPL_THEME2, chg_aug_1)) + geom_point(aes(color=svi_ctgy), alpha=0.5)
ggsave("~/project/figures/theme2_aug1.png", width=9, height=6, units="in")

ggplot(clean1115, aes(RPL_THEME3, series_complete_pop_pct)) + geom_point(aes(color=svi_ctgy), alpha=0.5)
ggsave("~/project/figures/theme3.png", width=9, height=6, units="in")
ggplot(clean1115, aes(RPL_THEME3, chg_aug_1)) + geom_point(aes(color=svi_ctgy), alpha=0.5)
ggsave("~/project/figures/theme3_aug1.png", width=9, height=6, units="in")

ggplot(clean1115, aes(RPL_THEME4, series_complete_pop_pct)) + geom_point(aes(color=svi_ctgy), alpha=0.5)
ggsave("~/project/figures/theme4.png", width=9, height=6, units="in")
ggplot(clean1115, aes(RPL_THEME4, chg_aug_1)) + geom_point(aes(color=svi_ctgy), alpha=0.5)
ggsave("~/project/figures/theme4_aug1.png", width=9, height=6, units="in")