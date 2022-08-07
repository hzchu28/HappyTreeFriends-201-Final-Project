# **HappyTreeFriends-201-Final-Project**
INFO-201-SU-AA Final Project, edited by Rita Hwang, Michelle Zhang, Yizhou Ding.



### **Domain of interest**

Topic: Steam Gaming Platform Data Analysis

**#1 Why are you interested in this field/domain?**

- We would like to predict the future game number/sales trend by analyzing the relationship between user's game time, game user numbers, game users' feedback, and the discounted price of games on Steam platform.

**#2 What other examples of data driven project have you found related to this domain (share at least 3)?**

- https://steamdb.info/graph/

- https://steamdb.info/sales/

- https://www.kaggle.com/datasets/nikdavis/steam-store-games

**#3 What data-driven questions do you hope to answer about this domain (share at least 3)?**

- Q1: Is there a relationship between the discount rate and the positive feedback rate?

- Q2: Is there a relationship between the discount rate and the game release date?

- Q3: Is there any regulation of the game's current players, peak players, and hours played between every month?

- Q4: What leads to the changes of current players, peak players, and hours played for different games in a month?

- Q5: How popular is the game now and how will it be in the future?

- Q6: Do players recommend this game?



### **Finding Data**

_**DATA ONE**_

**#1 Where did you download the data (e.g., a web URL)?**

- https://www.kaggle.com/datasets/karkourmehdi/database-of-games-from-the-steam-platform?select=steam_db.csv

**#2 How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?**

- This database contains over 15,000 video games available on the Steam platform. For each game an id has been assigned as well as the name of the game, the original price of the game, the promotion of the game at the date the promotion was checked and the steam link of the game to allow downloading.

- *Some of the data contain incorrect information,  and need to filter before using the data.

**#3 How many observations (rows) are in your data?**

- 15762

**#4 How many features (columns) are in your data?**

- 8

**#5 What questions (from above) can be answered using the data in this dataset?**

- Q1, Q2



_**DATA TWO**_

**#1 Where did you download the data (e.g., a web URL)?**

- https://www.kaggle.com/datasets/elmartini/steam-games-hours-played-and-peak-no-of-players

**#2 How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?**

  - The data is about the current players, peak players, and hours played for different games in a month. 

**#3 How many observations (rows) are in your data?**

- 

**#4 How many features (columns) are in your data?**

- 

**#5 What questions (from above) can be answered using the data in this dataset?**

- Q3, Q4



_**DATA THREE**_

**#1 Where did you download the data (e.g., a web URL)?**

- https://www.kaggle.com/datasets/andrewmvd/steam-reviews

**#2 How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?**

  - This data combines over 6.4 million public reviews in English from Steam Reviews portion of Steam store. These reviews represent the satisfaction and dissatisfaction factors about each game throughout time. 

**#3 How many observations (rows) are in your data?**

- 6417106

**#4 How many features (columns) are in your data?**

- 2

**#5 What questions (from above) can be answered using the data in this dataset?**

- Q5, Q6
