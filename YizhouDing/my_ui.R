library("dplyr")
library("knitr")
library("ggplot2")
library("leaflet")
library("shiny")

my_ui <- navbarPage(
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
  #page 1: home
  title = "Happy Tree Friends",
  tabPanel(
    "Home page",
    #img(src = "https://specials-images.forbesimg.com/imageserve/1023761676/960x0.jpg?fit=scale"),
    h3("Introduction:
       Steam is the most popular video game digital distribution service
       and storefront nowadays. The steam platform often has discounts, and
       this report will aim to examine the reasons for them, as well as to
       predict the trend of discounts. For the data part, we are going to
       analyze 3 groups of data, to find out the relationship between the
       number of current players, the hours users' played and the Steam game
       discount price reduction.")
  ),

    #page 2: Rating
    # tabPanel(
    #   "Rating",
    #   titlePanel("这里是图标题"),
    #   mainPanel(
    #     leafletOutput(outputId = "这里放图"),
    #     tableOutput(outputId = "这里放图")
    #   ),
    #   h3("Steam allows players to rate games and all the rating data will
    #   be generated as a percentage. Players could view the rating on each
    #   game page so they could make a reasonable consideration when purchasing
    #   it. A higher feedback rate does not only mean this game is fun to play,
    #   other features are also considered, such as gaming animation and
    #   production. This dataset shows the popularity of 15 games within a bar
    #   chart. Positive feedback rate can be shown when the bar is higher, and
    #   vice versa.")
    # ),


    #page 3: Peak player

    tabPanel(
      "Peak Player",
      tabsetPanel(type = "tab",
                  tabPanel("INTRO",
                           h3("The second database collects 
                           the names of 200 different games, 
                           current players, peak players, and hours 
                           played between May 8, 2022 and May 19,
                           2022. The aim of this data is to discover 
                           the regulation betweeneveryday and the reason 
                           for the changes of the most popular games. In
                           the 4 pie charts for data 2, shown the percentage 
                           of the top 15 populargames in the whole Steam 
                           game market for 6 days in May 2022. ")
                  ),
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
                  tabPanel("Summary",
                           h3("While there are some differences in the column 
                              names and the formats of the dataset, we are able 
                              to do data cleaning and work with the data. 
                              Through visualizing ana analyzing the dataset, 
                              we find that top 10 games ranked by the numebr 
                              of current players do not change a lot; however, 
                              the percent changes slightly each day. By 
                              analyzing the difference between the number of 
                              current players by day, we are able to find 
                              correlation between the number of current players 
                              and factors influencing that, such as discount 
                              on the game or update publishment.")
                  )
      )
    )

    #page 4: Discount
    # tabPanel(
    #   "Discount",
    #   titlePanel("这里是图标题"),
    #   mainPanel(
    #     leafletOutput(outputId = "这里放图"),
    #     tableOutput(outputId = "这里放图")
    #   ),
    #   h3()
    # ),

    #page 5: Summary
    # tabPanel(
    #   "DSummary",
    #   titlePanel("这里是标题"),
    #   mainPanel(
    #     leafletOutput(outputId = "这里放图"),
    #     tableOutput(outputId = "这里放图")
    #   ),
    #   h3("来个人写文字")
    # )

)
