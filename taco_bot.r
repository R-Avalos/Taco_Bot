# Taco Bot
library(httr)
library(tidyjson)
library(dplyr)
library(lubridate)
library(ggplot2)

# Test API call NYPL
x <- GET("http://httpbin.org/get")
str(content(x, "parsed"))


## Setup Calls
token <- scan("api.token", what="") # read in api token
nypl_url <- "http://api.menus.nypl.org/"
dish_url <- paste0(nypl_url, "dishes?token={", token, "}")
menu_url <- paste0(nypl_url, "menus?token={", token, "}")
# curl "http://api.menus.nypl.org/menus/12848.xml?token={YOUR_API_TOKEN}"

x <- GET(menu_url)
str(content(x))
y <- x %>%
        gather_array()
# Get dishes
# curl "http://api.menus.nypl.org/dishes?token={YOUR_API_TOKEN}"