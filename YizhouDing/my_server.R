library("dplyr")
library("knitr")
library("ggplot2")
library("leaflet")
library("shiny")
library("plotly")


source("my_ui.R")

my_server <- function(input, output) {
  source("steamdb.r")
  output$line1 <- renderPlotly({
    
    re_usefuldd <- filter(useful_dd, Release.date != 2002)
    nofactordf <- data.frame(year_range = c(2006:2022), 
                             mean = re_usefuldd$MeanDiscount, 
                             max = re_usefuldd$MaxDiscount, 
                             min = re_usefuldd$MinDiscount,
                             stringsAsFactors = F)
    
    selected_df <- reactive({
      useful_dd_ <- filter(nofactordf, year_range <= input$year[2] & year_range >= input$year[1])
      useful_dd_
    })
    
    yearrange <- reactive({
      selected_df()$year_range
    })
    
    MaxDis <- reactive({
      selected_df()$max
    })
    
    MinDis <- reactive({
      selected_df()$min
    })
    
    MeanDis <- reactive({
      selected_df()$mean
    })
    
    fig1 <- plot_ly(selected_df(), x = ~yearrange(), y = ~MaxDis(), type = 'scatter', mode = 'lines',
                    line = list(color = 'transparent'),
                    showlegend = FALSE, name = 'Max.Discount') 
    fig1 <- fig1 %>% add_trace(y = ~MinDis(), type = 'scatter', mode = 'lines',
                               fill = 'tonexty', fillcolor='rgba(0,100,80,0.2)', line = list(color = 'transparent'),
                               showlegend = FALSE, name = 'Min.Discount') 
    fig1 <- fig1 %>% add_trace(x = ~yearrange(), y = ~MeanDis(), type = 'scatter', mode = 'lines',
                               line = list(color='rgb(0,100,80)'),
                               name = 'Average.Discount') 
    fig1 <- fig1 %>% layout(title = "Average, Max and Min Discount in Release Year",
                            paper_bgcolor='rgb(255,255,255)', plot_bgcolor='rgb(229,229,229)',
                            xaxis = list(title = "Years",
                                         gridcolor = 'rgb(255,255,255)',
                                         showgrid = TRUE,
                                         showline = FALSE,
                                         showticklabels = TRUE,
                                         tickcolor = 'rgb(127,127,127)',
                                         ticks = 'outside',
                                         zeroline = FALSE),
                            yaxis = list(title = "Discount Percentage(%)",
                                         gridcolor = 'rgb(255,255,255)',
                                         showgrid = TRUE,
                                         showline = FALSE,
                                         showticklabels = TRUE,
                                         tickcolor = 'rgb(127,127,127)',
                                         ticks = 'outside',
                                         zeroline = FALSE))
    
    fig1
  })
  
  output$table <- renderTable({
    game_rate_discount_df <- data.frame(
      Game = c("Counter-Strike: Global Offensive", "Terraria", "Call of Duty: Black Ops II", "Rust", "Grand Theft Auto V", "Sekiro: Shadows Die Twice"), 
      Released.Year = c(2017, 2011, 2015, 2018, 2015, 2019),
      Positive.Rate = c(96, 97, 84, 87, 85, 94), 
      Historical.Greatest.Discount = c("NA-FreeGame", 80, 50, 100, 56, 35)
    )
  })
  
  output$line2 <- renderPlotly({
    x <- c("<10%", "10%-20%", "20%-30%", "30%-40%", "40%-50%", "50%-60%", "60%-70%", "70%-80%", "80%-90%", "90%-100%")
    meanfb <- c(mean10, mean20, mean30, mean40, mean50, mean60, mean70, mean80, mean90, mean100)
    data1 <- data.frame(x, meanfb)
    fig2 <- plot_ly(data1, x = ~x, y = ~meanfb, name = "Average Positive Feedback Rate", type = "scatter", mode = "lines", 
                    line = list(color = "rgb(0, 100, 80)", width = 4))
    fig2 <- fig2 %>% layout(title = "Discount vs. Positive Feedback Rate", 
                            xaxis = list(title = "Discount"), 
                            yaxis = list(title = "Positive Feedback Rate(%)"))
    fig2
  })
}
