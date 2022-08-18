library("dplyr")
library("knitr")
library("ggplot2")
library("leaflet")
library("shiny")

my_ui <- navbarPage(
  title = "",
  tabPanel(
    "Introduction",
    img(src = "https://specials-images.forbesimg.com/imageserve/1023761676/960x0.jpg?fit=scale"),
    h3("Steam is the most popular video game digital distribution 
       service and storefront nowadays. The steam platform often 
       has discounts, and this report will aim to examine the reasons 
       for them, as well as to predict the trend of discounts. For the 
       data part, we are going to analyze 3 groups of data, to find out 
       the relationship between the number of current players, the hours 
       users' played and the Steam game discount price reduction."),
    h3("We will be addressing the problem by visualizing the trends of car accidents throughout the decades of F1. By showcasing the trend and providing a universal point for all of the data, the direct workers for F1 can look into this data and see where their new measures were effective and ineffective for increasing safety for drivers. We will also be data wrangling the different dataset from each decade of F1 and join them by their ID column to compare the data."),
  ),