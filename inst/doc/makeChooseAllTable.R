## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, message=FALSE-----------------------------------------------------
library(tidyREDCap)
library(dplyr)

## -----------------------------------------------------------------------------
redcap <- readRDS(file = "./redcap.rds")
redcap %>% 
  select(starts_with("ingredients___")) %>% 
  head()

## ----getData, eval=FALSE------------------------------------------------------
#  rcon <- redcapAPI::redcapConnection(
#    url = 'https://redcap.miami.edu/api/',
#    token = Sys.getenv("NCI_API_Key")
#  )
#  
#  redcap <- redcapAPI::exportRecords(rcon)

## ----show_results-------------------------------------------------------------
make_choose_all_table(redcap, "ingredients") 

## ----show_results_pretty, results='asis'--------------------------------------
redcap %>% 
  make_choose_all_table("ingredients") %>% 
  knitr::kable()

