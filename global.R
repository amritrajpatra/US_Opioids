library(shinydashboard)
library(tidyverse)
library(ggplot2)
library(plotly)
  

#saveRDS(all_overdoses, file = "all_overdoses.RDS")

all_overdoses_RDS <- readRDS(file = "all_overdoses.RDS")
years <- as.data.frame(all_overdoses_RDS) %>% 
  select(Year) %>% 
  unique()

years <- sort(years$Year, decreasing = TRUE)


#saveRDS(opioids_prescribed_by_state, file = "opioids_prescribed_by_state.RDS")

opioids_prescribed_by_state_RDS <- readRDS(file = "opioids_prescribed_by_state.RDS")
states <- as.data.frame(opioids_prescribed_by_state_RDS) %>% 
  select(State) %>% 
  unique()

state <- sort(states$State)

