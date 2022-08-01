#' @importFrom sf read_sf
#' @importFrom dplyr filter
#' @export
england_shapefile <- function(url = "https://services1.arcgis.com/ESMARspQHYMw9BZ9/arcgis/rest/services/Countries_December_2021_GB_BUC/FeatureServer/0/query?outFields=*&where=1%3D1&f=geojson") {
        shp <- sf::read_sf(dsn = url) |>
                dplyr::filter(
                        CTRY21NM == "England"
                )
        return(shp)
}


#' @importFrom sf read_sf
#' @importFrom dplyr filter
#' @export
london_shapefile <- function(url = "https://services1.arcgis.com/ESMARspQHYMw9BZ9/arcgis/rest/services/Regions_December_2021_EN_BUC/FeatureServer/0/query?outFields=*&where=1%3D1&f=geojson") {
        shp <- sf::read_sf(dsn = url) |>
                dplyr::filter(
                        RGN21NM == "London"
                )
        return(shp)
}
