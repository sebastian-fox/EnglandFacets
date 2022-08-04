#' Map of charts faceted by Upper Tier Local Authority in England
#'
#' @details includes an inset for London
#' @param london_data a data table for London Upper Tier Local Authorities with
#'   the structure supplied from the fingertipsR package
#' @param england_data a data table for Upper Tier Local Authorities not in
#'   London with the structure supplied from the fingertipsR package
#' @param london_grid a data table with one record for each Upper Tier Local for
#'   the areas in London Authority, and a column for ONS Code, ONS Name, row and
#'   col, which refers the the x, y coordinate for the grid
#' @param england_grid a data table with one record for each Upper Tier Local
#'   for the areas outside of London Authority, and a column for ONS Code, ONS
#'   Name, row and col, which refers the the x, y coordinate for the grid
#' @import ggplot2
#' @importFrom grid viewport
#' @importFrom gridExtra grid.arrange
#' @importFrom geofacet facet_geo
#' @export
utla_plot <- function(london_data, england_data, london_grid, england_grid) {
  # Outside of London
  image_outside_london <- ggplot(
    england_data,
    aes(
      x = Timeperiod,
      y = Value,
      group = name)
    ) +
    geom_line() +
    geom_point(
      aes(colour = ComparedtoEnglandvalueorpercentiles),
      size = 0.75
    ) +
    scale_colour_manual(name = "Compared to England",
                        values = significance_colours,
                        breaks = names(significance_colours)) +
    facet_geo(~ name,
              grid = england_grid) +
    theme_void() +
    theme(text = element_text(face = "bold"),
          legend.position = "bottom") +
    labs(title = unique(england_data$IndicatorName))


  # Create the background for England
  england_background <- ggplot(england_shp) +
    geom_sf(colour = "gray60",
            fill = NA) +
    theme_void() # +

  # London
  image_london <- ggplot(london_data,
                         aes(x = Timeperiod, y = Value, group = name)) +
    geom_line() +
    geom_point(aes(colour = ComparedtoEnglandvalueorpercentiles),
               size = 0.5) +
    scale_colour_manual(name = "Compared to England",
                        values = significance_colours,
                        breaks = names(significance_colours)) +
    facet_geo(~ name,
              grid = london_grid) +
    theme_void() +
    theme(legend.position = "none",
          strip.text = element_text(size = rel(0.55)),
          text = element_text(face = "bold")) +
    labs(title = "London")

  london_background <- ggplot(london_shp) +
    geom_sf(fill = NA,
            colour = "gray60") +
    theme_void() +
    theme(panel.background = element_rect(fill = "white",
                                          colour = NA))

  plot <- england_background +
    ggplot2::annotation_custom(
      grob = ggplot2::ggplotGrob(london_background),
      xmin = -9,
      xmax = -2.25,
      ymin = 51.7,
      ymax = 53.62
    ) +
    ggplot2::annotation_custom(
      grob = ggplot2::ggplotGrob(image_london),
      xmin = -7.5,
      xmax = -3.7,
      ymin = 52,
      ymax = 53.65
    ) +
    ggplot2::annotation_custom(
      grob = ggplot2::ggplotGrob(image_outside_london),
      xmin = -6.5,
      xmax = 1.75,
      ymin = 49.75,
      ymax = 56
    )

  return(plot)

}
