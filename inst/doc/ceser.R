## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE---------------------------------------------------------------
#  vcovCESE(mod, cluster = NULL, type=NULL)

## ----eval=FALSE---------------------------------------------------------------
#  vcovCESE(..., cluster = ~ country, ...)

## ----eval=FALSE---------------------------------------------------------------
#  vcovCESE(..., cluster = ~ country + gender, ...)

## ----setup--------------------------------------------------------------------
library(ceser)
data(dcese)

## -----------------------------------------------------------------------------
mod  = lm(enep ~  enpc + fapres + enpcfapres + proximity
                       + eneg + logmag + logmag_eneg , data=dcese)

## -----------------------------------------------------------------------------
vcovCESE(mod, cluster = ~country, type="HC3")

## -----------------------------------------------------------------------------
library(lmtest)
coeftest(mod, vcov = vcovCESE, cluster = ~ country, type="HC3")

