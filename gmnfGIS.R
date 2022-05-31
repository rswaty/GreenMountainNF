
# read in GMNF data from FGDB

library(sf)
library(tidyverse)
library(tmap)

# raed in data
data <- st_read("GMNFDataForLandFire.gdb")



#read layers
layers <- st_layers(dsn = "GMNFDataForLandFire.gdb")

#look at layers
layers

escLTA <- st_read("GMNFDataForLandFire.gdb", layer = "VT_EscarpmentLTA") %>%
  dplyr::select(4, 32) %>%
  rename(name = MAP_UNIT_NAME)

escLTA

st_write(escLTA, dsn = "gmnfData/escLTA.gpkg", delete_layer = TRUE)
