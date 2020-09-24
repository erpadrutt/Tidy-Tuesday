#Load libraries

library(dplyr)
library(ggplot2)

#Import kids dataframe

library(readr)
kids <- read_csv("Desktop/kids.csv")
View(kids)

#Select rows for spending on PreK - 12 education in Wisconsin and Minnesota

MNWI = kids %>% filter(state == "Wisconsin" | state == "Minnesota")

MNWIEd = MNWI %>% filter(variable == "PK12ed")

#Graph comparing public spending per child on parks and rec for WI and MN from 1997 to 2019

ggplot(data = MNWIEd, aes(x = year, y = inf_adj_perchild, fill = state)) + 
  geom_bar(stat = "identity", position = "dodge") + 
  xlab("Year") + 
  ylab("Spending (in Thousands of Dollars) Per Child") + 
  ggtitle("Spending on PreK - 12 Education in MN and WI between 1997 and 2016") +
  xlim(1997, 2016) +
  theme_bw()
