library(dplyr)
library(stringr)
library(lintr)
library(styler)

get_summary_table_google <- function(google_df) {
  google_df <- google_df %>% filter(!is.na(as.numeric(Rating)))
  google_df <- google_df %>% filter(!is.na(Rating))
  google_df <- google_df %>% filter(!is.na(as.numeric(Reviews)))
  google_df <- google_df %>% filter(!is.na(Reviews))
  ret_table <- google_df %>%
    group_by(Category) %>%
    summarise(
      avg_rating = mean(as.numeric(Rating), na.rm = TRUE),
      avg_price = mean(as.numeric(gsub("[$]", "", Price)),
        na.rm = TRUE
      ),
      count = length(Category)
    ) %>%
    arrange(desc(count))
  return(ret_table)
}

get_summary_table_apple <- function(apple_df) {
  ret_table2 <- apple_df %>%
    group_by(prime_genre) %>%
    summarise(
      avg_rating = mean(as.numeric(user_rating), na.rm = TRUE),
      avg_price = mean(price, na.rm = TRUE),
      count = length(prime_genre)
    ) %>%
    arrange(desc(count))
  return(ret_table)
}
