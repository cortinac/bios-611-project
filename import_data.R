# import_data.R
# Import vaccination data from CDC API

#source("config.R")

library("RSocrata")
library(tidyverse)

system.time(vax_data <- read.socrata("https://data.cdc.gov/resource/8xkx-amqh.json"))

write_csv(vax_data, "derived_data/vax_data.csv")
