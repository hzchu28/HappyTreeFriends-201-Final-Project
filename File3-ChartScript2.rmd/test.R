library(dplyr)
library(ggplot2)
library(plotly)

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

pie(players_19_top10_curr_player, lbls_19, main = "Current Player Pie Chart 19_May", col=rainbow(length(players_19_top10_names)))


# 18_may_top10
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

pie(players_18_top10_curr_player, lbls_18, main = "Current Player Pie Chart 18_May", col=rainbow(length(players_18_top10_names)))


# 15_may_top15
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

pie(players_14_top10_curr_player, lbls_14, main = "Current Player Pie Chart 14_May", col=rainbow(length(players_14_top10_names)))



# 14_may_top10
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

pie(players_14_top10_curr_player, lbls_14, main = "Current Player Pie Chart 14_May", col=rainbow(length(players_14_top10_names)))


# 10_may_top10
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

pie(players_10_top10_curr_player, lbls_10, main = "Current Player Pie Chart 10_May", col=rainbow(length(players_10_top10_names)))



# 8_may_top10
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

pie(players_8_top10_curr_player, lbls_8, main = "Current Player Pie Chart 8_May", col=rainbow(length(players_8_top10_names)))

