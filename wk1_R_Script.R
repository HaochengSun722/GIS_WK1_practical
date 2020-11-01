install.packages(c("sf","tmap","tmaptools","RSQLite","tidyverse"),
                 repos = "https://www.stats.bris.ac.uk/R/")
install.packages(c("sf", "tmap", "tmaptools", "RSQLite", "tidyverse"),
                 repos = "https://www.stats.bris.ac.uk/R/")

library(sf)
library(tmap)
library(tmaptools)
library(RSQLite)
library(tidyverse)

shape <- st_read("C:/Users/10126/OneDrive/CASA/module/
                 GIS/WK1-practical/statistical-gis-boundaries-london
                 /ESRI/London_Borough_Excluding_MHW.shp")

summary(shape)
plot(shape)


shape %>%
  st_geometry()%>%
  plot()

mycsv <- read.csv("C:/Users/10126/OneDrive/CASA/module/GIS
                  /WK1-practical/fly-tipping-borough_tidyed.csv")

mycsv
shape

shape <- shape%>%
  merge(.,
        mycsv,
        by.x="GSS_CODE",
        by.y="X")
shape%>%
  head(., n=10)


tmap_mode("plot")

shape %>%
  qtm(.,fill = "2011_12")
shape %>%
  qtm(.,fill = "x2011_12")
shape %>%
  qtm(.,fill = "X2012_13")
shape %>%
  st_write(.,"C:/Users/10126/OneDrive/CASA/module/GIS/WK1-practical/wk1_Rstudio_prac.gpkg",
           "london_borough_flytipping_2012_13",
           delete_layer=TURE)
shape %>%
  st_write(.,"C:/Users/10126/OneDrive/CASA/module/GIS/WK1-practical/wk1_Rstudio_prac.gpkg",
           "london_borough_flytipping_2012_13")

shape %>%
  st_write(.,"C:/Users/10126/OneDrive/CASA/module/GIS/WK1-practical/wk1_Rstudio_prac.gpkg",
           "london_borough_flytipping_2012_13",
           delete_layer=ture)

con <- dbConnect(RSQLite::SQLite(),dbname="C:/Users/10126/OneDrive/CASA/module/GIS/WK1-practical/wk1_Rstudio_prac.gpkg")

con %>%
  dbListTables()

con %>%
  dbWriteTable(.,
               "original_csv",
               mycsv,
               overwrite=TRUE)
con %>%
  dbListTables()
plot()
con%>%
  plot()
shape%>%
  plot()
mycsv%>%
  plot()
