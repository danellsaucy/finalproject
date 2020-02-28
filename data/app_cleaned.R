app_initial <- read.csv("AppleStore.csv")

library(dplyr)
app_cleaned <- app_initial %>%
  select(-c("X", "id", "currency", "ver", "vpp_lic"))
