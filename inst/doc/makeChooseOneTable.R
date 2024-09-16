## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#"
)

## ----setup--------------------------------------------------------------------
library(tidyREDCap)

## -----------------------------------------------------------------------------
redcap <- readRDS(file = "./redcap.rds")
redcap$ingredients___1

## -----------------------------------------------------------------------------
table(redcap$ingredients___1)

## ----example_raw--------------------------------------------------------------
make_choose_one_table(redcap$ingredients___1) 

## ----example_pretty, results="asis"-------------------------------------------
make_choose_one_table(redcap$ingredients___1) %>% 
  knitr::kable()

## ----example2, results="asis"-------------------------------------------------
make_choose_one_table(
  redcap$ingredients___2,
  subset = TRUE
) %>% 
  knitr::kable()

## ----example3,  results="asis", fig.align="left"------------------------------
redcap %>% 
  make_choose_one_table(ingredients___3) %>% 
  knitr::kable() 

