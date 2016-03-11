library(XML)
library(rvest)
library(data.table)
library(dplyr)
library("data.table")

url <- "http://www.healthfrog.in/laboratory/blood-banks/andhra-pradesh/hyderabad"
htmlpage <- read_html(url)
forecasthtml <- html_nodes(htmlpage, ".listing")
forecast <- html_text(forecasthtml) #%>% paste(forecast, collapse =",")
df <- as.data.frame(forecast) 
names(df) 

##Splitting text column into ragged multiple new columns in a data table in R

split_result <- strsplit(as.character(df$forecast), ",")
length_n <- sapply(split_result, length)
length_max <- seq_len(max(length_n))
z <- as.data.frame(t(sapply(split_result, "[", i = length_max))) # Or as.data.table(...)

# columns to paste together
cols <- z[2:7]

# create a new column `x` with the three columns collapsed together
z$address <- apply(z[ , cols ] , 1 , paste , collapse = "-" )


library("reshape2")
df.m<-melt(z,id.vars=c("V2","V3", "V4"))

#colnames(z) <- c("Blood Bank name", "address", "phone")




#how to save data table into csv in R 
write.csv(z, file = "bloodbank2.csv",row.names=FALSE)
