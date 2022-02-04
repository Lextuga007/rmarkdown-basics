# remotes::install_github("apreshill/bakeoff")

library(bakeoff)
library(tidyverse)

# split up the ratings into a list, split by series
ratings_by_series <- ratings %>% 
  group_split(series) 

# need series numbers
series <- sort(unique(ratings$series))

walk2(
  ratings_by_series, series, 
  ~ readr::write_csv(.x, path = here::here(glue::glue("data/ratings-{.y}.csv")))
  )
