# import_data.R
# Import vaccination data from CDC API

#source("config.R")

library("RSocrata")
library(tidyverse)

system.time(vax_data <- read.socrata("https://data.cdc.gov/resource/8xkx-amqh.json?$where=date>='2021-08-01T00:00:00.000'"))

write_csv(vax_data, "~/project/derived_data/vax_data.csv")
