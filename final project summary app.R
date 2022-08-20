library(ggplot2)
library(stringr)
library(dplyr)
library(plotly)
library(shiny)

ui <- fluidPage(
  tags$head(
    tags$style(HTML("
                    @import url('https://fonts.google.com/specimen/DynaPuff');
                    body{
                    background-color: black;
                    color: white;
                    }
                    h4{
                    font-family: 'DynaPuff';
                    }
                    p{
                    font-family: 'Times';
                    }"))
),
  titlePanel("Summary"),
  mainPanel(
    plotOutput(outputId = "p1_bar"),
    plotOutput(outputId = "p_neg_one_bar"),
    plotlyOutput(outputId = "line1"),
    tableOutput(outputId = "table"),
    plotlyOutput(outputId = "line2"),
    tabPanel("May-8-2022",
             plotOutput(outputId = "pie8")
    ),
    tabPanel("May-9-2022",
             plotOutput(outputId = "pie9")
    ),
    tabPanel("May-10-2022",
             plotOutput(outputId = "pie10")
    ),
    tabPanel("May-14-2022",
             plotOutput(outputId = "pie14")
    ),
    tabPanel("May-18-2022",
             plotOutput(outputId = "pie18")
    ),
    tabPanel("May-19-2022",
             plotOutput(outputId = "pie19")
    ),     
  ),
  br(),
  h4("Our design analyze the rating, peak play time, and discount relationships 
  between games on Steam."),
  br(),
  h4("With our design, users could have a clear view on:"),
  p("1. The positive and negative rating percentage"),
  p("2. Current players and peak time played"),
  p("3. Discount rate trend"),
  br(),
  h4("Three specific takeaways that we have found from our analysis:"),
  p("1. Rating on each game not only representing how popular this game is, but
    also demonstrates how well the game is designed and made. Users will also focus
    on games'animation and production which contribute a huge part for increasing
    their gaming experience."),
  p("2. The most popular games remain almost unchanged for each 
    day and have a huge share of the market share. And these games generally do 
    not change a lot of discounts because they do not need to get more users by 
    discounting."),
  p("3. Since our charts are based on a huge amount of data (over 10,000 rows), 
    we got what seems to be a reasonable trend. However, randomly choosing one game 
    may highly likely to fail supporting our conclusions, as the feedbacks a game 
    receives are not only depend on the year of release and the discount rate. 
    Therefore, it is important that in the future we can only use this analysis 
    as a reference for the prediction of prices and reviews of future games, but 
    not as strong evidence."),
  br(),
  h4("Notable data-insight discovered"),
  p("We have discovered that game is likely to have discount if they are introduced
    in early years - which means recent games are less likely to have discount.
    However, games with higher postive rate are less likely to have discount despite
    they have been introduced for a long time."),
  br(),
  h4("Broader implication"),
  p("One implication that we would like to introduce to every player is - 'be
    chill'. It is sad that one game that you really want to play is not on discount,
    but according to our analysis, it is very likely that this game is a very good game
    with a sustainable popularity and positive rate!"),
  br(),
  h4("Contributors:"),
  p("Michelle Zhang, Rita Hwang, Yizhou Ding")
  )

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
  
  output$pie19 <- renderPlot({
    # 19_may_top10
    players_df_19 <- read.csv("data/19_May_2022.csv")
    players_df_19$Current_Players <- as.numeric(gsub(",", "", players_df_19$Current_Players))
    
    players_19_top10 <- players_df_19 %>%
      head(10)
    
    players_19_top10_names <- players_19_top10 %>%
      pull(Name)
    
    players_19_top10_curr_player <- players_19_top10 %>%
      pull(Current_Players)
    
    pct_19 <- round(players_19_top10_curr_player/sum(players_19_top10_curr_player) * 100)
    
    lbls_19 <- paste(pct_19, players_19_top10_names, sep="% ")
    
    pie(players_19_top10_curr_player, lbls_19, main = "Current Player Pie Chart 19-May", col=rainbow(length(players_19_top10_names)))
    
  })
  
  output$pie18 <- renderPlot({
    players_df_18 <- read.csv("data/18_May_2022.csv")
    players_df_18$Current_Players <- as.numeric(gsub(",", "", players_df_18$Current_Players))
    
    players_18_top10 <- players_df_18 %>%
      head(10)
    
    players_18_top10_names <- players_18_top10 %>%
      pull(Name)
    
    players_18_top10_curr_player <- players_18_top10 %>%
      pull(Current_Players)
    
    pct_18 <- round(players_18_top10_curr_player/sum(players_18_top10_curr_player) * 100)
    
    lbls_18 <- paste(pct_18, players_18_top10_names, sep="% ")
    
    pie(players_18_top10_curr_player, lbls_18, main = "Current Player Pie Chart 18-May", col=rainbow(length(players_18_top10_names)))
    
  })
  
  output$pie14 <- renderPlot({
    players_df_14 <- read.csv("data/14_May_2022.csv")
    players_df_14$Current_Players <- as.numeric(gsub(",", "", players_df_14$Current_Players))
    
    players_14_top10 <- players_df_14 %>%
      head(10)
    
    
    players_14_top10_names <- players_14_top10 %>%
      pull(Game)
    
    players_14_top10_curr_player <- players_14_top10 %>%
      pull(Current_Players)
    
    pct_14 <- round(players_14_top10_curr_player/sum(players_14_top10_curr_player) * 100)
    
    lbls_14 <- paste(pct_14, players_14_top10_names, sep="% ")
    
    pie(players_14_top10_curr_player, lbls_14, main = "Current Player Pie Chart 14-May", col=rainbow(length(players_14_top10_names)))
    
  })
  
  output$pie10 <- renderPlot({
    players_df_10 <- read.csv("data/10_May_2022.csv")
    players_df_10$Current_Players <- as.numeric(gsub(",", "", players_df_10$Current.Players))
    
    players_10_top10 <- players_df_10 %>%
      head(10)
    
    players_10_top10_names <- players_10_top10 %>%
      pull(Name)
    
    players_10_top10_curr_player <- players_10_top10 %>%
      pull(Current_Players)
    
    pct_10 <- round(players_10_top10_curr_player/sum(players_10_top10_curr_player) * 100)
    
    lbls_10 <- paste(pct_10, players_10_top10_names, sep="% ")
    
    pie(players_10_top10_curr_player, lbls_10, main = "Current Player Pie Chart 10-May", col=rainbow(length(players_10_top10_names)))
    
  })
  output$pie9 <- renderPlot({
    players_df_9 <- read.csv("data/9_May_2022.csv")
    players_df_9$Current_Players <- as.numeric(gsub(",", "", players_df_9$Current.Players))
    
    players_9_top10 <- players_df_9 %>%
      head(10)
    
    players_9_top10_names <- players_9_top10 %>%
      pull(Name)
    
    players_9_top10_curr_player <- players_9_top10 %>%
      pull(Current_Players)
    
    pct_9 <- round(players_9_top10_curr_player/sum(players_9_top10_curr_player) * 100)
    
    lbls_9 <- paste(pct_9, players_9_top10_names, sep="% ")
    
    pie(players_9_top10_curr_player, lbls_9, main = "Current Player Pie Chart 9-May", col=rainbow(length(players_9_top10_names)))
  })
  
  output$pie8 <- renderPlot({
    players_df_8 <- read.csv("data/8_May_2022.csv")
    players_df_8$Current_Players <- as.numeric(gsub(",", "", players_df_8$Current.Players))
    
    players_8_top10 <- players_df_8 %>%
      head(10)
    
    players_8_top10_names <- players_8_top10 %>%
      pull(Name)
    
    players_8_top10_curr_player <- players_8_top10 %>%
      pull(Current_Players)
    
    pct_8 <- round(players_8_top10_curr_player/sum(players_8_top10_curr_player) * 100)
    
    lbls_8 <- paste(pct_8, players_8_top10_names, sep="% ")
    
    pie(players_8_top10_curr_player, lbls_8, main = "Current Player Pie Chart 8-May", col=rainbow(length(players_8_top10_names)))
    
  })
  
}

shinyApp(ui = ui, server = server)