#Server
library(ggplot2)
library(stringr)
library(dplyr)
library(plotly)
library(shiny)

server <- function(input, output){
  output$p1_bar <- renderPlot({
    par(bg = "black")
    p1_bar <- barplot(p1, 
                      col.axis = "white",
                      col.lab = "white",
                      col.main = "white",
                      xlab = 'Name',
                      ylab = 'Score',
                      cex.names = 0.4,
                      las = 2,
                      col = 'orange',
                      main = "Percentage 1")
  })
  
  output$p_neg_one_bar <- renderPlot({
    par(bg = "black")
    p_neg_one_bar <- barplot(p_neg_one,
                             col.axis = "white",
                             col.lab = "white",
                             col.main = "white",
                             xlab = 'Name',
                             ylab = 'Score',
                             cex.names = 0.4,
                             las = 2,
                             col = 'orange',
                             main = "Percentage -1")
  })
  
  output$game_info <- renderText({
    h_percentage_of_1 <- round(100 * percentage_of_1(input$name), digits = 2)
    h_percentage_of_neg_1 <- round(100 * percentage_of_neg_one(input$name), digits = 2)
    script <- paste0("You have selected ", input$name, ", ", h_percentage_of_1, "% of people like this game and ", h_percentage_of_neg_1, "% of people do not like this game.")
    return(script)
  })
  
  output$rate <- renderTable({
    filter(all_df, p1 <= input$percentage)
  })
  
}