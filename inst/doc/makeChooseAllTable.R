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

## ----show_results-------------------------------------------------------------
make_choose_all_table(redcap, "ingredients") 

## ----show_results_pretty, results='asis'--------------------------------------
redcap %>% 
  make_choose_all_table("ingredients") %>% 
  knitr::kable()

