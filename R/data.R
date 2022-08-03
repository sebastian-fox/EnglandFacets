#' A shapefile of low resolution boundary for England (2021) from the ONS geography portal
#'
#' @format an sf object with 1 row and 12 variables
#' \describe{
#'   \item{CTRY21CD}{ONS geography code}
#'   \item{CTRY21NM}{English name}
#'   \item{CTRY21NMW}{Welsh name}
#'   \item{BNG_E}{Eastings}
#'   \item{BNG_N}{Northings}
#'   \item{LONG}{Longitude}
#'   \item{LAT}{Latitude}
#'   \item{OBJECTID}{Object ID}
#'   \item{Shape__Area}{Area, m2}
#'   \item{Shape__Length}{m}
#'   \item{GlobalID}{Global ID}
#'   \item{geometry}{geometry}
#' }
"england_shp"

#' A shapefile of low resolution boundary for London (2021) from the ONS geography portal
#'
#' @format an sf object with 1 row and 12 variables
#' \describe{
#'   \item{RGN21CD}{ONS geography code}
#'   \item{RGN21NM}{Region name}
#'   \item{BNG_E}{Eastings}
#'   \item{BNG_N}{Northings}
#'   \item{LONG}{Longitude}
#'   \item{LAT}{Latitude}
#'   \item{OBJECTID}{Object ID}
#'   \item{Shape__Area}{Area, m2}
#'   \item{Shape__Length}{m}
#'   \item{GlobalID}{Global ID}
#'   \item{geometry}{geometry}
#' }
"london_shp"

#' A colour scheme for charts with labels for "Better", "Same", "Worse", and
#' "Not compared"
#'
#' A colour scheme based on the RAG colours in Fingertips
#'
#' @format a named vector with 4 items
"significance_colours"

#' Grid coordinates for Upper Tier Local Authorities in London
#'
#' A dataset containing x and y grid references for local authorities in London
#'
#' @format A data frame with 33 rows and 4 variables:
#' \describe{
#'   \item{code}{ONS geography code}
#'   \item{name}{ONS geography name}
#'   \item{col}{integer grid reference for where to place local authority on x axis}
#'   \item{row}{integer grid reference for where to place local authority on y axis}
#' }
"lond"

#' Grid coordinates for Upper Tier Local Authorities outside of London
#'
#' A dataset containing x and y grid references for local authorities outside of
#' London
#'
#' @format A data frame with 122 rows and 4 variables:
#' \describe{
#'   \item{code}{ONS geography code}
#'   \item{name}{ONS geography name}
#'   \item{col}{integer grid reference for where to place local authority on x axis}
#'   \item{row}{integer grid reference for where to place local authority on y axis}
#' }
"no_lond"

