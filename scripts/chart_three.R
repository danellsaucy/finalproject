library(dplyr)
library(tidyr)
library(ggplot2)
library(ggpubr)

source("./data/app_cleaned.R")
source("./data/google_cleaned.R")

age_rating_apple <- apple_cleaned %>% 
  group_by(new_content_rating, prime_genre) %>%
  summarise(amount_spent = sum(price, na.rm = TRUE))

apple_rating_4 <- age_rating_apple %>% filter(new_content_rating == "4")
apple_rating_9 <- age_rating_apple %>% filter(new_content_rating == "9")
apple_rating_12 <- age_rating_apple %>% filter(new_content_rating == "12")
apple_rating_17 <- age_rating_apple %>% filter(new_content_rating == "17")
my_cols <- c("#FF0000", "#000000", "#0000FF", "#00FF00", "#FFFF00", "#FFFFFF", "#00FFFF", "#00FFCD", "#DAFFCD", "#DA58CD", "#E85877", "#FF36AE", "")

plot_4 <- ggplot(apple_rating_4, aes(x="", y=amount_spent, fill=prime_genre))+
  geom_bar(width = 1, stat = "identity")
plot_4 <- plot_4 + coord_polar("y", start=0) + scale_fill_manual(values = my_cols)
plot_9 <- ggplot(apple_rating_9, aes(x="", y=amount_spent, fill=prime_genre))+
  geom_bar(width = 1, stat = "identity")

plot_12 <- ggplot(apple_rating_12, aes(x="", y=amount_spent, fill=prime_genre))+
  geom_bar(width = 1, stat = "identity")

plot_17 <- ggplot(apple_rating_17, aes(x="", y=amount_spent, fill=prime_genre))+
  geom_bar(width = 1, stat = "identity")