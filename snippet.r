# import

read.csv("~/ropbox/JBAnalyticsClients/wine-country/Sonoma-no-blank.csv", header = TRUE)-> s
head(s)
head(s)
names(s)
class(s$sonoma)
as.character()
colnames()

# libraries

library(colorout)
library(setwidth)
library(lubridate)
library(plyr)
library(vimcom)
library(ggplot2)
library(directlabels)
library(corrplot)
library(gridExtra)

# table & export 

table
as.data.frame
colnames
t(s.keywords)->s.keywords
s.keywords <- rename(s.keywords,
                     c("Var1" = "Keyword",
                       "Freq" = "Frequency"))
s.keywords <- s.keywords[order(-s.keywords$Freq),] 

# directory and write

getwd() 
setwd("~/Dropbox/JBAnalyticsClients/"
write.csv(s.keywords[,1:2], 
          file = "Sonoma-Table.csv",
          row.names=FALSE)


