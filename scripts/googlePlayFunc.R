# For Google Store
# A function that takes in a dataset and returns a list of info about it:
get_summary_info <- function(dataset) {
  ret <- list()
  ret$length <- length(dataset)
  # do some more interesting stuff
  ret$total_earned <- sum(dataset$price)
  ret$avg_reviews <- mean(as.numeric(dataset$Reviews), na.rm = FALSE)
  ret$uniq_cont_rating <- unique(dataset$Content.Rating)
  return(ret)
}

get_summary_info(google_cleaned)
