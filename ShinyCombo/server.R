# Define server
server_combo <- function(input, output){
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
  
  
  
  #data2 server
  
  output$pie19 <- renderPlot({
    # 19_may_top10
    players_df_19 <- read.csv("19_May_2022.csv")
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
    players_df_18 <- read.csv("18_May_2022.csv")
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
    players_df_14 <- read.csv("14_May_2022.csv")
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
    players_df_10 <- read.csv("10_May_2022.csv")
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
    players_df_9 <- read.csv("9_May_2022.csv")
    players_df_9$Current_Players <- as.numeric(gsub(",", "", players_df_9$Current_Players))
    
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
    players_df_8 <- read.csv("8_May_2022.csv")
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
  
  
  #data3 server
  
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
  
  output$predictchart <- renderPlotly({
    positive.feedback.rate <- c(85, 84, 86, 85, 87)
    discount.rate <- c(10, 20, 20, 40, 60)
    year.released <- c(2022, 2023, 2024, 2025, 2026)
    predict_df <- data.frame(positive.feedback.rate, discount.rate, year.released)
    
    predict_x <- plot_ly(
      predict_df, x = ~year.released, y = ~positive.feedback.rate, 
      type = "scatter", mode = "lines"
    )
    predict_x <- predict_x %>% add_trace(
      y = ~discount.rate, mode = "lines"
    )
    predict_x
  })
  
}