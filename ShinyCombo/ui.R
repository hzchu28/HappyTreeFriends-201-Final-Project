# Define each UI 
#Combine UI
ui_combo <- navbarPage(
  title = "Happy Tree Friends' Steam Analysis", 
  
  #intro page
  tabPanel(
    titlePanel("Home Page"),
    fluidPage(
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
      h3(
        "HappyTreeFriends
    -Michelle Zhang
    -Rita Hwang
    -Yizhou Ding"
      ),
      HTML('<p><img src="https://static1.srcdn.com/wordpress/wp-content/uploads/2018/11/Steam-Logo-Big-Picture.jpg"/></p>'), 
      h3(
        "Introduction:
       Steam is the most popular video game digital distribution service
       and storefront nowadays. The steam platform often has discounts, and
       this report will aim to examine the reasons for them, as well as to
       predict the trend of discounts. For the data part, we are going to
       analyze 3 groups of data, to find out the relationship between the
       number of current players, the hours users' played and the Steam game
       discount price reduction."
      )
    )
  ), 
  
  #data1 page
  tabPanel(
    titlePanel("Rating"), 
    fluidPage(
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
  ), 
  
  #data2 page
  tabPanel(
    titlePanel("Peak Player"), 
    fluidPage(
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
  ), 
  
  #data3 page
  tabPanel(
    titlePanel("Discount"), 
    fluidPage(
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
      p(
        "Trendings showed by Discount Rate, Released Year, and Positive Feedback Rate"
      ),
      sidebarLayout(
        sidebarPanel(
          tags$style(".well {background-color: #000000;}"),
          h3("Controls"), 
          sliderInput(
            inputId = "year", 
            label = "Year Range", 
            min = 2006, max = 2022, step = 1, 
            value = c(2006, 2022)
          )
        ), 
        mainPanel(
          plotlyOutput(outputId = "line1"), 
          p("The line plots are good used to show trending of value changes and 
        comparing values. This chart shows the relationship between the games’ average, min, and max 
        discount rates and the games’ released year from 2006 to 2022. By filtering years, we see on average 
        that with more recent release year, the chance a game to have high discount rate is low."), 
          p("We can thus speculate that the probability of having a higher discount for games released recently
            is small. This may be sending us a message that the discount rate is indeed related to the year of 
            release, and that players should not have high expectations of buying a good game with high discount 
            that have just been released. In fact, there is always a saying that 'buy early and enjoy early'.") 
          
        )
      )
    )
  ), 
  
  
  #summary page
  tabPanel(
    titlePanel("Summary"),
    fluidPage(
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
      mainPanel(
        h4("Below are some related charts we summarized with previous analyzation."), 
        tableOutput(outputId = "table"),
        p("With some collected data of current popular games, it seems hard to find out the relationship between 
          discount and positive feedback rates. However, if we calculate mean collect data with a bigger sample size, 
          there is a resonable relationship shown."),
        plotlyOutput(outputId = "line2"), 
        p("This chart shows the relationship between the 
          games’ positive feedback rates change and discount rates. We found that on average in a big dataset of games, 
          there is a trend that games discount less than 30% tend to have positive feedback rate greater than 85%, and those has dicount greater than
          30% tend to have positive feedback rate less than 85 in a unstable way. The 
          about games’ discount rates and users’ feedback rates."), 
        plotlyOutput(outputId = "predictchart"), 
        p("This is a prediction line chart of a game released at 2022. The lines represents it's future trends of discount changes
          and positive feedback rate changes.")
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
    h4("Broader implication and notable data-insight discovered"),
    p("1. We have discovered that game is likely to have discount if they are introduced
    in early years - which means recent games are less likely to have discount.
    However, games with higher postive rate are less likely to have discount despite
    they have been introduced for a long time."),
    p("2. Games with higher popularity is likely to remain its favorism among players
        over years, such as CSGO and Dota 2. They will constantly have a huge amount of
        players and not only during their gaming peak time,"),
    p("3. We would like to ask every player to - 'be chill'. It is sad
      that one game that you really want to play is not on discount, but according
      to our analysis, it is very likely that this game is a very good game with
      a sustainable popularity and positive rate!"),
    br(),
    h4("Contributors:"),
    p("Michelle Zhang, Rita Hwang, Yizhou Ding")
  )
)
