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

## ----eval=FALSE---------------------------------------------------------------
#  # This is the data produced by exporting using point-and-click REDCap export.
#  manual_export <- data
#  
#  manual_export |>
#    select(starts_with("ingredient")) |> # get all the ingredient variables
#    select(-ends_with(".factor")) |>     # drop the factor version of the ingredient variables
#    make_choose_all_table("ingredient")  # make the table

