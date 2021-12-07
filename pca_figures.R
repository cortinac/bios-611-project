# pca_figures.R
# Create scatter plots from PCA analysis

pca1 <- read_csv("~/project/derived_data/pca1.csv")
pca2 <- read_csv("~/project/derived_data/pca2.csv")
pca3 <- read_csv("~/project/derived_data/pca3.csv")
pca4 <- read_csv("~/project/derived_data/pca4.csv")

ggplot(pca1, aes(PC1, PC2)) + geom_point(aes(color=series_complete_pop_pct), alpha=0.5) +
  scale_color_viridis_c()
ggsave("~/project/figures/pca1_rate.png")

ggplot(pca3, aes(PC1, PC2)) + geom_point(aes(color=chg_aug_1), alpha=0.5) +
  scale_color_viridis_c()
ggsave("~/project/figures/pca1_chg.png")

ggplot(pca2, aes(PC1, PC2)) + geom_point(aes(color=series_complete_pop_pct), alpha=0.5) +
  scale_color_viridis_c()
ggsave("~/project/figures/pca2_rate.png")

ggplot(pca4, aes(PC1, PC2)) + geom_point(aes(color=chg_aug_1), alpha=0.5) +
  scale_color_viridis_c()
ggsave("~/project/figures/pca2_chg.png")