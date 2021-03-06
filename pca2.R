# pca2.R
# PCA for change from August 1

library(tidyverse)
library(matlab)

#clean1 <- read_csv("~/project/derived_data/clean1.csv")
clean2 <- read_csv("~/project/derived_data/clean2.csv")

c <- clean2 %>% arrange(RPL_THEME1) %>%
  mutate(metro=if_else(metro_status=='Metro',1,ifelse(metro_status=='Non-metro',0,NA))) %>%
  filter(!is.na(metro)) %>% mutate(index=1:nrow(.))

pca_set1 <- c %>% select(RPL_THEME1, RPL_THEME2, RPL_THEME3, RPL_THEME4, EP_UNINSUR, metro) %>%
  as.matrix()

pca_set2 <- c %>% select(EP_POV, EP_UNEMP, EP_PCI, EP_NOHSDP, EP_AGE65, EP_AGE17,
                         EP_DISABL, EP_SNGPNT, EP_MINRTY, EP_LIMENG, EP_MUNIT, EP_MOBILE, 
                         EP_CROWD, EP_NOVEH, EP_GROUPQ, EP_UNINSUR, metro) %>%
  as.matrix()

r1 <- prcomp(pca_set1, center=T, scale=T)
sum1_2 <- summary(r1)
sum1_2

r2 <- prcomp(pca_set2, center=T, scale=T)
sum2_2 <- summary(r2)
sum2_2

r1_ <- r1$x %>% as_tibble() %>% mutate(index=1:nrow(.))
r2_ <- r2$x %>% as_tibble() %>% mutate(index=1:nrow(.))

c1 <- c %>% as_tibble() %>% left_join(r1_, by="index")
c2 <- c %>% as_tibble() %>% left_join(r2_, by="index")

write_csv(c1, "~/project/derived_data/pca3.csv")
write_csv(c2, "~/project/derived_data/pca4.csv")