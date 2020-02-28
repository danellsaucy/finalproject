library(dplyr)
library(stringr)

test <- read.csv("./data/Google-Playstore-Full.csv", stringsAsFactors = FALSE)
test <- test %>% filter(!is.na(as.numeric(Rating)))
test <- test %>% filter(!is.na(Rating))
test <- test %>% filter(!is.na(as.numeric(Reviews)))
test <- test %>% filter(!is.na(Reviews))
temp <- test %>% group_by(Category) %>% summarise(avg_rating = mean(as.numeric(Rating), na.rm = TRUE), avg_reviews = mean(as.numeric(Reviews), na.rm = TRUE), avg_installs = mean(as.numeric(gsub("[+]", "", str_replace_all(Installs, "[[:punct:]]", "")))), count = length(Category))

get_summary_table_google <- function(dataset) {
  dataset <- dataset %>% filter(!is.na(as.numeric(Rating)))
  dataset <- dataset %>% filter(!is.na(Rating))
  dataset %>% group_by(Category) %>% summarise(avg_rating = mean(as.numeric(Rating), na.rm = TRUE))
  ret_table <- 
  return (ret)
} 