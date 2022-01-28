
## Required Packages ----------------------------------------------------------

packages <- c("tidyverse", "sp", "mapdata")
for (i in seq_along(packages)) {
  if(!do.call(require, list(package = packages[i]))) {
    do.call(install.packages, list(pkgs = packages[i]))
    do.call(require, list(package = packages[i]))
  }
}

### Functions to plot fitted values -------------------------------------------

#' @title theme_map
#' @description theme for ggplot maps
#' @param plot ggplot object
theme_map <- function(plot) {
  
  require(tidyverse)
  
  plot +     
    theme_bw() + 
    guides(fill = guide_colorbar(title.position = "top", title.hjust = 0.5, 
                                  frame.colour = "black", frame.linewidth = 1.5, 
                                  ticks.colour = "black", ticks.linewidth = 1.5, 
                                  barwidth = unit(10, "lines"))) +
    guides(color = guide_colorbar(title.position = "top", title.hjust = 0.5, 
                                 frame.colour = "black", frame.linewidth = 1.5, 
                                 ticks.colour = "black", ticks.linewidth = 1.5, 
                                 barwidth = unit(10, "lines"))) + 
    theme(panel.border = element_rect(color = "black", size = 1.6),
          panel.spacing.x = unit(0, "lines"),
          strip.text = element_text(size = 12, face = "bold"), 
          strip.background = element_blank(), 
          axis.text = element_text(size = 12, color = "black"),
          axis.ticks.length = unit(0.4, "lines"),
          axis.ticks = element_line(size = 1),
          axis.title = element_blank(),
          panel.grid = element_blank(), 
          legend.position = "bottom")
}


#' @title map_EBS_grid
#' @description plot grid-scale fitted values for the Eastern Bering Sea
#' @param E_km vector with location of grid cells, eastings
#' @param N_km vector with location of grid cells, northings
#' @param fill vector with variable to color grid cells by
#' @param facet vector with variable to facet by, e.g. year
#' @return a map of EBS survey area, with grid cells colored by fill variable
map_EBS_grid <- function(E_km, N_km, fill, facet) {
  
  require(tidyverse)
  
  # Bind data into data frame
  plot_data <- data.frame(E_km = E_km, N_km = N_km, fill = fill, facet = facet)

  ## Retrieve spatial data for Alaskan coastline
  alaska <- filter(map_data("worldHires", region = "USA"), subregion == "Alaska")
  
  ## Convert coordinates to utm
  alaska_utm <- FishStatsUtils::project_coordinates(
    X = alaska$long, 
    Y = alaska$lat, 
    projargs = "+proj=utm +zone=2 +datum=WGS84"
  )
  
  ## Format for ggplot
  alaska_utm <- data.frame(
    E_km = as.data.frame(alaska_utm)$X/1000, 
    N_km = as.data.frame(alaska_utm)$Y/1000, 
    group = alaska$group
  )
  
  ### Plot EBS map
  EBS_map <- plot_data %>% 
    ggplot(aes(E_km, N_km, fill = fill)) + 
    scale_fill_viridis_c(option = "magma") +
    facet_wrap(~facet, ncol = 6) + 
    coord_cartesian(xlim = c(0, 1400), ylim = c(6000, 7000)) +
    geom_raster() + 
    geom_polygon(aes(E_km, N_km, group = group), data = alaska_utm, 
                 fill = "grey80", color = "black", 
                 inherit.aes = FALSE)
  
  ### Clean up and return map
  theme_map(EBS_map)
  
}