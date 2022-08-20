library(dplyr)
library(stringr)
library(plotly)
steam_df <- read.csv("steam_db.csv")
nrow(steam_df)
ncol(steam_df)
#Extract useful information
useful_df <- filter(steam_df, Original.price != 0 & Promotional.price != 0)
useful_df <- filter(useful_df, Reviews != "There is no reviews for this game.")


#Calculate the sale rate.
sale_rate <- function(origin, onsale){
  percentoff = round(((origin - onsale) / origin) * 100)
}

#Extract percentage of positive feedback.
pos_fb <- substr(useful_df$Reviews, start = 1, stop = 4)
pos_fb <- gsub(" ", "", pos_fb)
pos_fb <- gsub("%", "", pos_fb)
pos_fb

#Create new columns.
useful_new <- mutate(useful_df, 
  summarise(useful_df, Discount = sale_rate(useful_df$Original.price, useful_df$Promotional.price)), 
  summarise(useful_df, Positive.rate = pos_fb)
)

#sorting
dis_pos <- select(useful_new, Discount, Positive.rate)

ten <- filter(dis_pos, Discount == 10)
mean10 <- round(mean(as.numeric(ten$Positive.rate)))

twenty <- filter(dis_pos, Discount <= 20)
twenty <- filter(twenty, Discount > 10)
mean20 <- round(mean(as.numeric(twenty$Positive.rate)))
mean20

thirty <- filter(dis_pos, Discount <= 30)
thirty <- filter(thirty, Discount > 20)
mean30 <- round(mean(as.numeric(thirty$Positive.rate)))
mean30

forty <- filter(dis_pos, Discount <= 40)
forty <- filter(forty, Discount > 30)
forty
mean40 <- round(mean(as.numeric(forty$Positive.rate)))
mean40

fifty <- filter(dis_pos, Discount <= 50)
fifty <- filter(fifty, Discount > 40)
fifty
mean50 <- round(mean(as.numeric(fifty$Positive.rate)))
mean50

sixty <- filter(dis_pos, Discount <= 60)
sixty <- filter(sixty, Discount > 50)
sixty
mean60 <- round(mean(as.numeric(sixty$Positive.rate)))
mean60

seventy <- filter(dis_pos, Discount <= 70)
seventy <- filter(seventy, Discount > 60)
seventy
mean70 <- round(mean(as.numeric(seventy$Positive.rate)))
mean70

eighty <- filter(dis_pos, Discount <= 80)
eighty <- filter(eighty, Discount > 70)
eighty
mean80 <- round(mean(as.numeric(eighty$Positive.rate)))
mean80

ninety <- filter(dis_pos, Discount <= 90)
ninety <- filter(ninety, Discount > 80)
ninety
mean90 <- round(mean(as.numeric(ninety$Positive.rate)))
mean90

hundred <- filter(dis_pos, Discount <= 100)
hundred <- filter(hundred, Discount > 90)
hundred
mean100 <- round(mean(as.numeric(hundred$Positive.rate)))
mean100

#Graph making
#Q1: Is there a relationship between the ratio of promotion price and original price and the positive feedback rate?
x <- c("<10%", "10%-20%", "20%-30%", "30%-40%", "40%-50%", "50%-60%", "60%-70%", "70%-80%", "80%-90%", "90%-100%")
meanfb <- c(mean10, mean20, mean30, mean40, mean50, mean60, mean70, mean80, mean90, mean100)
data1 <- data.frame(x, meanfb)
fig1 <- plot_ly(data1, x = ~x, y = ~meanfb, name = "Average Positive Feedback Rate", type = "scatter", mode = "lines", 
               line = list(color = "rgb(0, 100, 80)", width = 4))
fig1 <- fig1 %>% layout(title = "Discount vs. Positive Feedback Rate", 
                      xaxis = list(title = "Discount"), 
                      yaxis = list(title = "Positive Feedback Rate(%)"))
fig1

#Dataframe with release date and discount
useful_date <- filter(useful_new, Release.date != "NA")

#Calculate max, min, and average discount on release year
useful_dd <- summarise(group_by(useful_date, Release.date), 
                       MeanDiscount = round(mean(Discount)), 
                       MaxDiscount = max(Discount), 
                       MinDiscount = min(Discount))



#Graph making
#Is there a relationship between the ratio of promotional price and original price and the game release date?

typeof(useful_dd$Release.date)


useful_dd$Release.date <- factor(useful_dd$Release.date, levels = useful_dd[["Release.date"]])

fig2 <- plot_ly(useful_dd, x = ~useful_dd$Release.date, y = ~useful_dd$MaxDiscount, type = 'scatter', mode = 'lines',
               line = list(color = 'transparent'),
               showlegend = FALSE, name = 'Max.Discount') 
fig2 <- fig2 %>% add_trace(y = ~useful_dd$MinDiscount, type = 'scatter', mode = 'lines',
                         fill = 'tonexty', fillcolor='rgba(0,100,80,0.2)', line = list(color = 'transparent'),
                         showlegend = FALSE, name = 'Min.Discount') 
fig2 <- fig2 %>% add_trace(x = ~useful_dd$Release.date, y = ~useful_dd$MeanDiscount, type = 'scatter', mode = 'lines',
                         line = list(color='rgb(0,100,80)'),
                         name = 'Average.Discount') 
fig2 <- fig2 %>% layout(title = "Average, Max and Min Discount in Release Year",
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

fig2


a <- c("0", "1", "2", "3")
typeof(a)
aa <- as.numeric(a)
typeof(aa)