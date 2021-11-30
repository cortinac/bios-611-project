# themes_scatter.R
# Make scatter plots by theme

library(tidyverse)

clean1115 <- read_csv("~/project/derived_data/clean1115.csv")

ggplot(clean1115, aes(RPL_THEMES, series_complete_pop_pct)) + geom_point(aes(color=svi_ctgy), alpha=0.5)
ggsave("~/project/figures/themes.png")
ggplot(clean1115, aes(RPL_THEMES, chg_aug_1)) + geom_point(aes(color=svi_ctgy), alpha=0.5)
ggsave("~/project/figures/themes_aug1.png")
ggplot(clean1115, aes(RPL_THEMES, chg30)) + geom_point(aes(color=svi_ctgy), alpha=0.5)
ggsave("~/project/figures/themes_chg30.png")

ggplot(clean1115, aes(RPL_THEME1, series_complete_pop_pct)) + geom_point(aes(color=svi_ctgy), alpha=0.5)
ggsave("~/project/figures/theme1.png")
ggplot(clean1115, aes(RPL_THEME1, chg_aug_1)) + geom_point(aes(color=svi_ctgy), alpha=0.5)
ggsave("~/project/figures/theme1_aug1.png")
ggplot(clean1115, aes(RPL_THEME1, chg30)) + geom_point(aes(color=svi_ctgy), alpha=0.5)
ggsave("~/project/figures/theme1_chg30.png")

ggplot(clean1115, aes(RPL_THEME2, series_complete_pop_pct)) + geom_point(aes(color=svi_ctgy), alpha=0.5)
ggsave("~/project/figures/theme2.png")
ggplot(clean1115, aes(RPL_THEME2, chg_aug_1)) + geom_point(aes(color=svi_ctgy), alpha=0.5)
ggsave("~/project/figures/theme2_aug1.png")
ggplot(clean1115, aes(RPL_THEME2, chg30)) + geom_point(aes(color=svi_ctgy), alpha=0.5)
ggsave("~/project/figures/theme2_chg30.png")

ggplot(clean1115, aes(RPL_THEME3, series_complete_pop_pct)) + geom_point(aes(color=svi_ctgy), alpha=0.5)
ggsave("~/project/figures/theme3.png")
ggplot(clean1115, aes(RPL_THEME3, chg_aug_1)) + geom_point(aes(color=svi_ctgy), alpha=0.5)
ggsave("~/project/figures/theme3_aug1.png")
ggplot(clean1115, aes(RPL_THEME3, chg30)) + geom_point(aes(color=svi_ctgy), alpha=0.5)
ggsave("~/project/figures/theme3_chg30.png")

ggplot(clean1115, aes(RPL_THEME4, series_complete_pop_pct)) + geom_point(aes(color=svi_ctgy), alpha=0.5)
ggsave("~/project/figures/theme4.png")
ggplot(clean1115, aes(RPL_THEME4, chg_aug_1)) + geom_point(aes(color=svi_ctgy), alpha=0.5)
ggsave("~/project/figures/theme4_aug1.png")
ggplot(clean1115, aes(RPL_THEME4, chg30)) + geom_point(aes(color=svi_ctgy), alpha=0.5)
ggsave("~/project/figures/theme4_chg30.png")