## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(tidyREDCap)

## ----getData, eval=FALSE------------------------------------------------------
#  
#  rcon <- redcapAPI::redcapConnection(
#    url = 'https://redcap.miami.edu/api/',
#    token = Sys.getenv("NCI_API_Key")
#  )
#  
#  redcap <- redcapAPI::exportRecords(rcon)
#  
#  saveRDS(redcap, file = "redcap.rds")

## ----univariate---------------------------------------------------------------
redcap <- readRDS(file = "./redcap.rds")

# Chips
janitor::tabyl(redcap$ingredients___1) %>% 
  janitor::adorn_pct_formatting() %>% 
  knitr::kable()

# Yellow cheese
janitor::tabyl(redcap$ingredients___2) %>% 
  janitor::adorn_pct_formatting() %>% 
  knitr::kable()


## ----loadData-----------------------------------------------------------------
redcap <- readRDS(file = "./redcap.rds")

suppressPackageStartupMessages(
  library(dplyr)
)

analysis <- redcap %>% 
  select(starts_with("ingredients___")) 
  
knitr::kable(tail(analysis))
  

## ----nachoExample-------------------------------------------------------------
patterns <- make_binary_word(analysis) 
janitor::tabyl(patterns)

## ----nachoAbreviations--------------------------------------------------------
labels <- c("C", "Y", "O", "W", "M", "B", "T", "P")

patterns <- make_binary_word(analysis, the_labels = labels)

janitor::tabyl(patterns)

