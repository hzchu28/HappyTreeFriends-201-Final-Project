library("dplyr")
library("knitr")
library("ggplot2")
library("leaflet")
library("shiny")

my_ui <- navbarPage(
  #page 1: home
  title = "Happy Tree Friends",
  tabPanel(
    "Home page",
    img(src = "https://specials-images.forbesimg.com/imageserve/1023761676/960x0.jpg?fit=scale"),
    h3("Introduction:
       Steam is the most popular video game digital distribution service 
       and storefront nowadays. The steam platform often has discounts, and 
       this report will aim to examine the reasons for them, as well as to 
       predict the trend of discounts. For the data part, we are going to 
       analyze 3 groups of data, to find out the relationship between the 
       number of current players, the hours users' played and the Steam game 
       discount price reduction."),

    
    #page 2: Rating
    tabPanel(
      "Rating",
      titlePanel("这里是图标题"),
      mainPanel(
        leafletOutput(outputId = "这里放图"),
        tableOutput(outputId = "这里放图")
      ),
      h3("Steam allows players to rate games and all the rating data will 
      be generated as a percentage. Players could view the rating on each 
      game page so they could make a reasonable consideration when purchasing 
      it. A higher feedback rate does not only mean this game is fun to play, 
      other features are also considered, such as gaming animation and 
      production. This dataset shows the popularity of 15 games within a bar 
      chart. Positive feedback rate can be shown when the bar is higher, and 
      vice versa."),
    ),
    
    
    #page 3: Peak player
    tabPanel(
      "Peak Player",
      fluidPage(
        titlePanel("The top 10 games Current player "),
        mainPanel(
          plotOutput(outputId = "pie_chart"),
        ),
        column(
          4,
          sliderInput("slider1",
                      label = h3("Select the date"), 
                      min = 6,
                      max = 15, 
                      value = 50
          )
        ),
      ),
      h3("While there are some differences in the column names and the formats 
      of the dataset, we are able to do data cleaning and work with the data. 
      Through visualizing and analyzing the dataset, we find that the top 10 
      games ranked by the number of current players do not change a lot; 
      however, the percentage changes slightly each day. By analyzing the 
      difference between the number of current players by day, we are able to 
      find a correlation between the number of current players and factors 
      influencing that, such as a discount on the game or update publishment."),
    ),
    
    
    #page 4: Discount
    tabPanel(
      "Discount",
      titlePanel("这里是图标题"),
      mainPanel(
        leafletOutput(outputId = "这里放图"),
        tableOutput(outputId = "这里放图")
      ),
      h3("The line plots are good used to show trending of value changes and 
      comparing values. The first chart shows the relationship between the 
      games’ positive feedback rates change and discount rates, and the second 
      chart shows the relationship between the games’ average, min, and max 
      discount rates and the games’ released year from 2002 to 2022. The 
      charts provided us with trends and helped us make future predictions 
      about games’ discount rates and users’ feedback rates."),
    ),
    #page 5: Summary
    tabPanel(
      "DSummary",
      titlePanel("这里是标题"),
      mainPanel(
        leafletOutput(outputId = "这里放图"),
        tableOutput(outputId = "这里放图")
      ),
      h3("来个人写文字"),
    ),
    
    
    