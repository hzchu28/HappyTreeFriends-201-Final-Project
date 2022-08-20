#UI
library(ggplot2)
library(stringr)
library(dplyr)
library(plotly)
library(shiny)

new <- read.csv("new.csv")

ui <- fluidPage(
  tags$head(
    tags$style(HTML("
                    @import url('https://fonts.google.com/specimen/Silkscreen');
                    body{
                    background-color: black;
                    color: white;
                    }
                    h3{
                    font-family: 'Silkscreen';
                    }
                    .shiny-input-container {
                    color: #FFFFFF;
                    }"))
  ),
  titlePanel("Rating"),
  sidebarLayout(
    sidebarPanel(
      tags$style(".well {background-color: #000000;}"),
      h3("Controls"),
      selectInput(
        inputId = "name",
        label = "Select game",
        choices = uniq_game_df,
      ),
      sliderInput(
        inputId = "percentage",
        label = "Which favorism rate range would you like to see",
        min = 0,
        max = 1,
        value = 0
      ),
      helpText("Those charts show the rating and comparison of 15 popular games.",
               "Percentage 1 chart displays how much people like this game.",
               "If the bar is higher on percentage 1 chart, this game has a higher favorism.",
               "Percentage -1 chart displays how much people do not like this game.",
               "If the bar is higher on percentage -1 chart, this game has a higher disfavorism.",
               "Percentage 1 chart and Percentage -1 chart's bar can be add up and become 1.")
    ),
    mainPanel(
      h3("Graphs"),
      plotOutput(outputId = "p1_bar"),
      plotOutput(outputId = "p_neg_one_bar"),
      h3("Select Result"),
      textOutput(outputId = "game_info"),
      h3("Game Rate Range Table"),
      tableOutput(outputId = "rate")
    )
  ),
  h3("Description"),
  p("Steam allows players to rate games and all the rating data will 
      be generated as a percentage. Players could view the rating on each 
      game page so they could make a reasonable consideration when purchasing 
      it. A higher feedback rate does not only mean this game is fun to play, 
      other features are also considered, such as gaming animation and 
      production. This dataset shows the popularity of 15 games within a bar 
      chart. Positive feedback rate can be shown when the bar is higher, and 
      vice versa.", style = "font-family: 'times'; font-si16pt; border:1px solid gray")
)
