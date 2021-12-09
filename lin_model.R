# lin_model.R
# linear regression models for vax vs SVI data

library(tidyverse)

clean1 <- read_csv("~/project/derived_data/clean1.csv")
clean2 <- read_csv("~/project/derived_data/clean2.csv")

lm1 <- lm(series_complete_pop_pct ~ RPL_THEME1 + RPL_THEME2 + RPL_THEME3 + RPL_THEME4 + EP_UNINSUR + metro_status,
          clean1)
names(lm1$coefficients) <- c('(Intercept)', 'Theme 1: Socioeconomic Status',
                             'Theme 2: Household Composition & Disability',
                             'Theme 3: Minority Status & Language',
                             'Theme 4: Housing Type & Transportation',
                             'Uninsured (%)', 'Metro Status (Reference = Non-metro)')
summary(lm1)
t1 <- coef(summary(lm1)) %>% as.data.frame() %>% mutate(Estimate=round(Estimate, digits=3),
                                                        `Std. Error`=round(`Std. Error`, digits=3),
                                                        `t value`=round(`t value`, digits=3),
                                                        ` `=if_else(`Pr(>|t|)`<0.05, '*', ''),
                                                        `Pr(>|t|)`=format.pval(`Pr(>|t|)`, digits=2, eps=0.001, nsmall=3))

lm2 <- lm(chg_aug_1 ~ RPL_THEME1 + RPL_THEME2 + RPL_THEME3 + RPL_THEME4 + EP_UNINSUR + metro_status,
          clean2)
names(lm2$coefficients) <- c('(Intercept)', 'Theme 1: Socioeconomic Status',
                             'Theme 2: Household Composition & Disability',
                             'Theme 3: Minority Status & Language',
                             'Theme 4: Housing Type & Transportation',
                             'Uninsured (%)', 'Metro Status (Reference = Non-metro)')
summary(lm2)
t2 <- coef(summary(lm2)) %>% as.data.frame() %>% mutate(Estimate=round(Estimate, digits=3),
                                                        `Std. Error`=round(`Std. Error`, digits=3),
                                                        `t value`=round(`t value`, digits=3),
                                                        ` `=if_else(`Pr(>|t|)`<0.05, '*', ''),
                                                        `Pr(>|t|)`=format.pval(`Pr(>|t|)`, digits=2, eps=0.001, nsmall=3))

lm1_1 <- lm(series_complete_pop_pct ~ EP_POV + EP_UNEMP + EP_PCI + EP_NOHSDP + EP_AGE65 + EP_AGE17 +
              EP_DISABL + EP_SNGPNT + EP_MINRTY + EP_LIMENG + EP_MUNIT + EP_MOBILE + EP_CROWD +
              EP_NOVEH + EP_GROUPQ + EP_UNINSUR + metro_status, clean1)
names(lm1_1$coefficients) <- c('(Intercept)', 'Below Poverty (%)', 'Unemployed (%)', 'Per Capita Income',
                               'No High School Diploma (%)', 'Aged 65 or Older (%)', 'Aged 17 or Younger (%)',
                               'Civilian with a Disability (%)', 'Single-Parent Households (%)', 
                               'Minority (%)', 'Speaks English "Less than Well" (%)', 'Multi-Unit Structures (%)',
                               'Mobile Homes (%)', 'Crowding (%)', 'No Vehicle (%)', 'Group Quarters (%)',
                               'Uninsured (%)', 'Metro Status (Reference = Non-metro)')
summary(lm1_1)
t3 <- coef(summary(lm1_1)) %>% as.data.frame() %>% mutate(Estimate=round(Estimate, digits=3),
                                                        `Std. Error`=round(`Std. Error`, digits=3),
                                                        `t value`=round(`t value`, digits=3),
                                                        ` `=if_else(`Pr(>|t|)`<0.05, '*', ''),
                                                        `Pr(>|t|)`=format.pval(`Pr(>|t|)`, digits=2, eps=0.001, nsmall=3))

lm2_1 <- lm(chg_aug_1 ~ EP_POV + EP_UNEMP + EP_PCI + EP_NOHSDP + EP_AGE65 + EP_AGE17 +
              EP_DISABL + EP_SNGPNT + EP_MINRTY + EP_LIMENG + EP_MUNIT + EP_MOBILE + EP_CROWD +
              EP_NOVEH + EP_GROUPQ + EP_UNINSUR + metro_status, clean2)
names(lm2_1$coefficients) <- c('(Intercept)', 'Below Poverty (%)', 'Unemployed (%)', 'Per Capita Income',
                               'No High School Diploma (%)', 'Aged 65 or Older (%)', 'Aged 17 or Younger (%)',
                               'Civilian with a Disability (%)', 'Single-Parent Households (%)', 
                               'Minority (%)', 'Speaks English "Less than Well" (%)', 'Multi-Unit Structures (%)',
                               'Mobile Homes (%)', 'Crowding (%)', 'No Vehicle (%)', 'Group Quarters (%)',
                               'Uninsured (%)', 'Metro Status (Reference = Non-metro)')
summary(lm2_1)
t4 <- coef(summary(lm2_1)) %>% as.data.frame() %>% mutate(Estimate=round(Estimate, digits=3),
                                                        `Std. Error`=round(`Std. Error`, digits=3),
                                                        `t value`=round(`t value`, digits=3),
                                                        ` `=if_else(`Pr(>|t|)`<0.05, '*', ''),
                                                        `Pr(>|t|)`=format.pval(`Pr(>|t|)`, digits=2, eps=0.001, nsmall=3))