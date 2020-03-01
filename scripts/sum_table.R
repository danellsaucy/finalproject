library(dplyr)
library(stringr)
library(lintr)
library(styler)
source("./Data/app_cleaned.R")
source("./Data/google_cleaned.R")

get_summary_table_google <- function(google_cleaned) {
  google_cleaned <- google_cleaned %>% filter(!is.na(as.numeric(Rating)))
  google_cleaned <- google_cleaned %>% filter(!is.na(Rating))
  google_cleaned <- google_cleaned %>% filter(!is.na(as.numeric(Reviews)))
  google_cleaned <- google_cleaned %>% filter(!is.na(Reviews))
  ret_table <- google_cleaned %>%
    group_by(Category) %>%
    summarise(
      avg_rating = mean(as.numeric(Rating), na.rm = TRUE),
      avg_price = mean(as.numeric(gsub("[$]", "", price)),
        na.rm = TRUE
      ),
      count = length(Category)
    ) %>%
    arrange(desc(count))
  return(ret_table)
}

test <- get_summary_table_google(google_cleaned)
get_summary_table_apple <- function(apple_df) {
  ret_table <- apple_df %>%
    group_by(prime_genre) %>%
    summarise(
      avg_rating = mean(as.numeric(user_rating), na.rm = TRUE),
      avg_price = mean(price, na.rm = TRUE),
      count = length(prime_genre)
    ) %>%
    arrange(desc(count))
  return(ret_table)
}
test2 <- get_summary_table_apple(apple_cleaned)
