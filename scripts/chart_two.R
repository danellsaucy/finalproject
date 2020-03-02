library(dplyr)
library(tidyr)
library(ggplot2)
library(gapminder)
library(ggpubr)
library(plotly)

source("./scripts/sum_table.R")

plot_two_google <- plot_ly(
  test,
  x = ~avg_rating, y = ~avg_price,
  # Hover text:
  text = ~ paste(
    "Category: ", Category,
    "<br>Average rating: ", avg_rating,
    "<br>Average price:", avg_price,
    "<br>Total number of applications: ", count
  ),
  color = ~avg_price, size = ~avg_price
)
plot_two_google <- plot_two_google %>% layout(title = "Google")

plot_two_apple <- plot_ly(
  test2,
  x = ~avg_rating, y = ~avg_price,
  # Hover text:
  text = ~ paste(
    "Category: ", prime_genre,
    "<br>Average rating: ", avg_rating,
    "<br>Average price:", avg_price,
    "<br>Total number of applications: ", count
  ),
  color = ~avg_price, size = ~avg_price
)
plot_two_apple <- plot_two_apple %>% layout(title = "Apple")
