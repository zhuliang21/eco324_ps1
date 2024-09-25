# Install the tidyverse package
if (!requireNamespace("tidyverse", quietly = TRUE)) {
  install.packages("tidyverse")
}

library(tidyverse)

# clear environment
rm(list=ls())

# set working directory
setwd("~/Projects/eco324_ps1")

# load the data
data <- read.csv("verboven_cars.csv")


# rename variables
data <- data %>%
  rename(year = ye,
         country = ma,
         population = pop,
         horsepower = hp,
         fuel = li,
         width = wi,
         height = he,
         weight = we,
         demographic = home,
         quantity = qu)

# generate new variables
data <- data %>%
  mutate(market_size = population/4) %>%
  # calculate market share s_j
  mutate(s_j = quantity/(market_size)) %>%
  # calculate the outside option market share s_0
  # which is 1 - sum(s_j) by year and country
  group_by(year, country) %>%
  mutate(s_0 = 1 - sum(s_j)) %>%
  ungroup() %>%
  # calculate y = log(s_j) - log(s_0)
  mutate(y = log(s_j) - log(s_0)) %>%
  # calculate ln_pop and ln_gdp
  mutate(ln_pop = log(population),
         ln_gdp = log(ngdp)) %>%
  # calculate price = eurpr/1000
  mutate(price = eurpr/1000)

# Install the `fixest` package for fixed effects regression
if (!requireNamespace("fixest", quietly = TRUE)) {
  install.packages("fixest")
}

library(fixest)


