## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, message=FALSE-----------------------------------------------------
library(tidyREDCap)
library(dplyr)

## -----------------------------------------------------------------------------
redcap <- readRDS(file = "./redcap_nacho_anxiety.rds")

redcap %>% 
  select(
    # Select these two columns
    record_id, redcap_event_name,
    # And also select all columns between "nachos" and "nci_complete"
    nachos:nci_complete
  ) %>% 
  # Make the table pretty
  knitr::kable()

## ----getData, eval=FALSE------------------------------------------------------
#  rcon <- redcapAPI::redcapConnection(
#    url = 'https://redcap.miami.edu/api/',
#    token = Sys.getenv("nacho_anxiety_Key")
#  )
#  
#  redcap_nacho_anxiety <- redcapAPI::exportRecords(rcon)
#  
#  saveRDS(redcap_nacho_anxiety, file = "redcap_nacho_anxiety.rds")

## -----------------------------------------------------------------------------
make_instrument(redcap, "concented", "enrollment_complete") %>% 
  knitr::kable()

## -----------------------------------------------------------------------------
make_instrument(redcap, "nachos", "nci_complete") %>% 
  knitr::kable()

## -----------------------------------------------------------------------------
make_instrument(
  redcap,
  "nachos", "nci_complete",
  drop_which_when = TRUE
) %>% 
  knitr::kable()

