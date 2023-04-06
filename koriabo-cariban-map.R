library(tidyverse)
library(sf)
library(shiny)
library(leaflet)
library(leaflet.extras)
library(sp)
library(rgdal)
library(magrittr)

ui <- fluidPage(
  leafletOutput(outputId = "koriaboMap")
)

server <- function(input, output){
  output$koriaboMap <- renderLeaflet() %>% 
    leaflet() %>% 
    setView(lng = -60, lat = 2, zoom = 4.5) %>% 
    
    #Basemap layers and Minimap
    addProviderTiles(providers$Esri.WorldTerrain, group = "ESRI Terrain") %>%
    addProviderTiles(providers$OpenTopoMap, group = "Open Topographical")
}

shinyApp(ui, server)

#saveWidget(widget = koriaboMap, file = "C:/Users/Bruno/OneDrive/Documentos/koriabo-map/index.html")

