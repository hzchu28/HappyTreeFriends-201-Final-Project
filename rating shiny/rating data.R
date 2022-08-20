#Rating Data
#Clear data and make charts
library(ggplot2)
library(stringr)
library(dplyr)
library(plotly)
library(shiny)

uniq_game <- unique(new$name)
uniq_game_df <- data.frame(uniq_game)

percentage_of_1 <- function(gname){
  element <- filter(new, name == gname)
  glength <- nrow(element)
  one <- filter(element, score == 1)
  num_1 <- nrow(one)
  per_1 <- num_1 / glength
  return(per_1)
}

percentage_of_neg_one <- function(gname){
  element <- filter(game_score, name == gname)
  glength <- nrow(element)
  neg_one <- filter(element, score == -1)
  num_neg_one <- nrow(neg_one)
  per_neg_one <- num_neg_one / glength
  return(per_neg_one)
}

p1 <- sapply(uniq_game, percentage_of_1)
p_neg_one <- sapply(uniq_game, percentage_of_neg_one)

default_margins <- par("mar")
new_margins <- default_margins + c(8, 0, 0, 0)
par(mar = new_margins)

p1_bar <- barplot(p1, 
                  xlab = 'Name',
                  ylab = 'Score',
                  cex.names = 0.4,
                  las = 2,
                  col = 'orange',
                  main = "Percentage 1")
p_neg_one_bar <- barplot(p_neg_one,
                         xlab = 'Name',
                         ylab = 'Score',
                         cex.names = 0.4,
                         las = 2,
                         col = 'orange',
                         main = "Percentage -1")

p1_df <- data.frame(p1)
p_neg_one_df <- data.frame(p_neg_one)
all_df <- data.frame(uniq_game, p1, p_neg_one)
colnames(all_df) <- c("game", "positive_rates", "negative_rates")
