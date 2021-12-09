# pca_figures.R
# Create scatter plots from PCA analysis

library(tidyverse)

pca1 <- read_csv("~/project/derived_data/pca1.csv")
pca2 <- read_csv("~/project/derived_data/pca2.csv")
pca3 <- read_csv("~/project/derived_data/pca3.csv")
pca4 <- read_csv("~/project/derived_data/pca4.csv")

ggplot(pca1, aes(PC1, PC2)) + geom_point(aes(color=series_complete_pop_pct), alpha=0.5) +
  scale_color_viridis_c() + labs(color="Vaccination Rate")
ggsave("~/project/figures/pca1_rate.png", width=9, height=6, units="in")

ggplot(pca3, aes(PC1, PC2)) + geom_point(aes(color=chg_aug_1), alpha=0.5) +
  scale_color_viridis_c() + labs(color="Change from Aug 1")
ggsave("~/project/figures/pca1_chg.png", width=9, height=6, units="in")

ggplot(pca2, aes(PC1, PC2)) + geom_point(aes(color=series_complete_pop_pct), alpha=0.5) +
  scale_color_viridis_c() + labs(color="Vaccination Rate")
ggsave("~/project/figures/pca2_rate.png", width=9, height=6, units="in")

ggplot(pca4, aes(PC1, PC2)) + geom_point(aes(color=chg_aug_1), alpha=0.5) +
  scale_color_viridis_c() + labs(color="Change from Aug 1")
ggsave("~/project/figures/pca2_chg.png", width=9, height=6, units="in")