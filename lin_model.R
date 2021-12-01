# lin_model.R
# linear regression models for vax vs SVI data

library(tidyverse)

clean1115 <- read_csv("~/project/derived_data/clean1115.csv")

lm1 <- lm(series_complete_pop_pct ~ RPL_THEME1 + RPL_THEME2 + RPL_THEME3 + RPL_THEME4 + EP_UNINSUR + metro_status, clean1115)
summary(lm1)

lm2 <- lm(chg_aug_1 ~ RPL_THEME1 + RPL_THEME2 + RPL_THEME3 + RPL_THEME4 + EP_UNINSUR + metro_status, clean1115)
summary(lm2)

#lm3 <- lm(chg30 ~ RPL_THEME1 + RPL_THEME2 + RPL_THEME3 + RPL_THEME4 + EP_UNINSUR + metro_status, clean1115)
#summary(lm3)

lm1_1 <- lm(series_complete_pop_pct ~ EP_POV + EP_UNEMP + EP_PCI + EP_NOHSDP + EP_AGE65 + EP_AGE17 +
              EP_DISABL + EP_SNGPNT + EP_MINRTY + EP_LIMENG + EP_MUNIT + EP_MOBILE + EP_CROWD +
              EP_NOVEH + EP_GROUPQ + EP_UNINSUR + metro_status, clean1115)
summary(lm1_1)

lm2_1 <- lm(chg_aug_1 ~ EP_POV + EP_UNEMP + EP_PCI + EP_NOHSDP + EP_AGE65 + EP_AGE17 +
              EP_DISABL + EP_SNGPNT + EP_MINRTY + EP_LIMENG + EP_MUNIT + EP_MOBILE + EP_CROWD +
              EP_NOVEH + EP_GROUPQ + EP_UNINSUR + metro_status, clean1115)
summary(lm2_1)

#lm3_1 <- lm(chg30 ~ EP_POV + EP_UNEMP + EP_PCI + EP_NOHSDP + EP_AGE65 + EP_AGE17 +
#              EP_DISABL + EP_SNGPNT + EP_MINRTY + EP_LIMENG + EP_MUNIT + EP_MOBILE + EP_CROWD +
#              EP_NOVEH + EP_GROUPQ + EP_UNINSUR + metro_status, clean1115)
#summary(lm3_1)