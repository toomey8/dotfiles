# import

read.csv("~/Dropbox/JBAnalyticsClients/wine-country/Sonoma-no-blank.csv", header = TRUE)-> s
head(s)
head(s)
names(s)
class(s$sonoma)
as.character()
colnames()

## remove spaces col name
names(ctm2) <- sub(" ", ".", names(ctm2))
names(ctm2) <- sub(" ", ".", names(ctm2))

## remove capital in names
names(r) <- tolower(names(r)

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

function.name <- function(arguments) 
{
  computations on the arguments
  some other code
}

table
as.data.frame
colnames
t(s.keywords)->s.keywords$[23:34]
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


# plyr


ddply(b, .(Customer), summarise,
         Country = sum(USA), 
         N = length(Cost),
         sumCost = sum(Cost),
         sumExtension = sum(Extension),
         sumUnitPrice = sum(UnitPrice),
         sumQty = sum(Qty),
         MeanCost = mean(Cost),
         MeanExtension = mean(Extension),
         MeanUnitPrice = mean(UnitPrice),
         MeanQty = mean(Qty),
         SDCost = sd(Cost),
         SDExtension = sd(Extension),
         SDUnitPrice = sd(UnitPrice),
         SDQty = sd(Qty)) -> b.customer

# alternative to beautiful soup

- http://blog.rstudio.org/2014/11/24/rvest-easy-web-scraping-with-r/

# vim r markdown

Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin '[vim-pandoc/vim-rmarkdown][]'
Plugin 'Vim-R-plugin'

[vim-pandoc/vim-rmarkdown]: https://github.com/vim-pandoc/vim-rmarkdown
