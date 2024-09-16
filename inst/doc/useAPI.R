## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(tidyREDCap)

## ----getData, eval=FALSE------------------------------------------------------
#  rcon <- redcapAPI::redcapConnection(
#    url = 'https://redcap.miami.edu/api/',
#    token = Sys.getenv("nacho_anxiety_key")
#  )
#  
#  redcap <- redcapAPI::exportRecords(rcon)
#  
#  saveRDS(redcap, file = "redcap.rds")

