library(dplyr)

# app_cleaned <- app_initial %>%
#   select(-c("X", "id", "currency", "ver", "sup_devices.num", "ipadSc_urls.num", "vpp_lic"))
  
apple_initial <- read.csv("./data/AppleStore.csv", stringsAsFactors = FALSE)
apple_cleaned <- apple_initial %>%
  select(c(
    size_bytes, price,
    rating_count_tot, user_rating,
    cont_rating, prime_genre
  ))
apple_cleaned <- apple_cleaned %>%
  mutate(new_content_rating = as.numeric(gsub("[+]", "", cont_rating)))
as.numeric(gsub("[+]", "", apple_cleaned[1, 5]))
apple_cleaned <- apple_cleaned %>%
  select(-c(cont_rating))

