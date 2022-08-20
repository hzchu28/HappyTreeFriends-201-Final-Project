# Define UI
discount_ui <- fluidPage(
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
  titlePanel("Trendings showed by Discount Rate, Released Year, and Positive Feedback Rate"),
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
      tableOutput(outputId = "table"),
      p("With some collected data of current popular games, it seems hard to find out the relationship between 
          discount and positive feedback rates. However, if we calculate mean collect data with a bigger sample size, 
          there is a resonable relationship shown."),
      plotlyOutput(outputId = "line2"), 
      p("This chart shows the relationship between the 
          games’ positive feedback rates change and discount rates. We found that on average in a big dataset of games, 
          there is a trend that games discount less than 30% tend to have positive feedback rate greater than 85%, and those has dicount greater than
          30% tend to have positive feedback rate less than 85 in a unstable way. The 
          about games’ discount rates and users’ feedback rates.")
    )
  )
)
