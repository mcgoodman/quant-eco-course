
library(tidyverse)
library(mgcv)
library(dismo)

thrasher <- read.csv("thrasher_occurrence_data.csv")

bioclim <- read.csv("bioclim_1970-2020.csv")
ss585 <- read.csv("bioclim_2081-2100_ss585.csv")
ss245 <- read.csv("bioclim_2081-2100_ss245.csv")

thrasher_gam <- gam(
  present ~ s(bio1) + s(bio9) + s(bio4) + s(bio12),
  data = thrasher, 
  family = binomial(link = "logit")
)

thrasher$p_thrasher <- predict(thrasher_gam, type = "response")
bioclim$p_thrasher <- predict(thrasher_gam, newdata = bioclim, type = "response")
ss585$p_thrasher <- predict(thrasher_gam, newdata = ss585, type = "response")
ss245$p_thrasher <- predict(thrasher_gam, newdata = ss245, type = "response")

p <- as.numeric(thrasher$p_thrasher[thrasher$present == 1])
a <- as.numeric(thrasher$p_thrasher[thrasher$present == 0])
ROC <- dismo::evaluate(p, a)
threshold <- dismo::threshold(ROC)$spec_sens

bioclim %>% 
  ggplot(aes(lon, lat, fill = p_thrasher)) +
  geom_raster() +
  scale_fill_viridis_c(option = "magma")

ss245 %>% 
  ggplot(aes(lon, lat, fill = p_thrasher)) +
  geom_raster() +
  scale_fill_viridis_c(option = "magma")

ss585 %>% 
  ggplot(aes(lon, lat, fill = p_thrasher)) +
  geom_raster() +
  scale_fill_viridis_c(option = "magma")
