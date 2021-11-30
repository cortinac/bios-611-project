# clean_svi
# Clean SVI data set

library(tidyverse)

svi <- read_csv("~/project/source_data/SVI2018_US_COUNTY.csv")

svi_clean <- svi %>% filter(RPL_THEMES >= 0)

svi_themes <- svi_clean %>% select(FIPS, RPL_THEME1, RPL_THEME2,
                             RPL_THEME3, RPL_THEME4,
                             RPL_THEMES, EP_POV, EP_UNEMP, EP_PCI,
                             EP_NOHSDP, EP_AGE65, EP_AGE17, EP_DISABL,
                             EP_SNGPNT, EP_MINRTY, EP_LIMENG, EP_MUNIT,
                             EP_MOBILE, EP_CROWD, EP_NOVEH, EP_GROUPQ,
                             EP_UNINSUR, E_DAYPOP)

write_csv(svi_themes, "~/project/derived_data/svi_themes.csv")