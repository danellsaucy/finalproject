# For App Store
# A function that takes in a dataset and returns a list of info about it:
get_summary_info <- function(dataset) {
  ret <- list()
  ret$length <- length(dataset)
  # do some more interesting stuff
  ret$total_earned <- sum(dataset$price)
  ret$avg_user_rating <- mean(dataset$user_rating)
  ret$uniq_genre <- unique(dataset$prime_genre)
  return (ret)
} 
