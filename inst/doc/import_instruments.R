## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(tidyREDCap)

## ----eval=FALSE---------------------------------------------------------------
#  # Do not type your API token directly into your code
#  tidyREDCap::import_instruments(
#    url = "https://redcap.miami.edu/api/",
#    token = "1A2B3CXXYYZZOOMMGOSHNOOOOX1Y2Z3" # This is BAD!
#  )
#  
#  # A better way to do this is to read the API key from the .Renviron file.
#  #   For instructions on saving your API key, see link below.
#  tidyREDCap::import_instruments(
#    url = "https://redcap.miami.edu/api/",
#    token = Sys.getenv("nacho_anxiety_key")  # This is BETTER!
#  )

