library("dplyr")
library("ggplot2")
library("shiny")
library("stringr")
library("plotly")

source("steam_db.csv")
source("steamdb.r")

source("new.csv")
source("rating data.R")

source("ui.R")
source("server.R")

#setup the app
shinyApp(ui = ui_combo, server = server_combo)