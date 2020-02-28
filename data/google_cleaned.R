google_initial <- read.csv("Google-Playstore-Full.csv")
library(dplyr)

google_cleaned <- google_initial %>%
  select(-c("Last.Updated", "Minimum.Version", "Latest.Version", 
            "X", "X.1", "X.2", "X.3")) %>%
  filter(grepl("?", App.Name))
  
