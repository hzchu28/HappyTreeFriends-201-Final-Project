library("dplyr")
library("knitr")
library("ggplot2")
library("leaflet")
library("shiny")
source("my_ui_d.R")
source("my_server_d.R")

shinyApp(ui = my_ui_d, server = my_server_d)