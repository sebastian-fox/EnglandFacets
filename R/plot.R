#' Map of charts faceted by Upper Tier Local Authority in England
#'
#' @details includes an inset for London
#' @import ggplot2
#' @importFrom grid viewport
#' @importFrom geofacet facet_geo
#' @export
utla_plot <- function(london_data, england_data, london_grid, england_grid, output_filename) {
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
    theme(legend.position = "bottom",
          panel.background = element_rect(fill = "transparent"),
          plot.background = element_rect(fill = "transparent")) +
    labs(title = unique(england_data$IndicatorName))
  # class(image_outside_london) <- c("gg","ggplot")


  # Create the background for England
  england_background <- ggplot(england_shp) +
    geom_sf(colour = "gray80",
            fill = NA) +
    theme_void() # +
    # theme(panel.background = element_rect(fill = "white"))

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
          strip.text = element_text(size = rel(0.55))) +
    labs(title = "London")
  # class(image_london) <- c("gg","ggplot")

  london_background <- ggplot(london_shp) +
    geom_sf(fill = NA,
            colour = "gray80") +
    theme_void() +
    theme(panel.background = element_rect(fill = "white"))

  # england_background +
  #   image_outside_london +
  #   london_background +
  #   image_london

  vplond <- grid::viewport(
    width = unit(0.35, "npc"),
    height = unit(0.14, "npc"),
    x = unit(0.15, "npc"),
    y = unit(0.4, "npc")
  ) #this allows ability to create map inset

  vplonddata <- grid::viewport(
    width = unit(0.29, "npc"),
    height = unit(0.11, "npc"),
    x = unit(0.15, "npc"),
    y = unit(0.42, "npc")
  )

  vpmain <- grid::viewport(
    width = unit(0.9, "npc"),
    height = unit(0.75, "npc")
  )

  png(output_filename,
      width = 33,
      height = 50,
      units = "cm",
      res = 400,
      bg = "transparent")
  print(england_background)
  print(image_outside_london,
        vp = vpmain)

  print(london_background, vp = vplond)
  print(image_london,
        vp = vplonddata)
  dev.off()
  cat(paste("png saved here:",
            output_filename))
}
