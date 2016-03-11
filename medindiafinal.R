library(XML)
library(rvest)
library(data.table)
library(dplyr)
library(xml2)

setwd("C:/Users/avon/Documents/R/medindia")
drugsF <- NULL


#write.csv(drugsF, file = "medindia1.csv",row.names=FALSE)

for( page in 901:1000 ){
  url <- paste("http://www.medguideindia.com/show_brand.php?nav_link=&pageNum_rr=",page,sep="")
  doc1 <- read_html(url)
  drugs <-  doc1%>% html_nodes(".tabsborder2")  %>% .[[1]] %>% html_table(fill = TRUE)
  drugs<- head(drugs, -2)
  #drugs <- tail(drugs, -2)
  drugs <- tail(drugs, -1)
  drugs <- drugs[, colSums(is.na(drugs)) != nrow(drugs)]
  drugsF <- rbind(drugsF, drugs)
  #a <- bind_rows(a, d)
  page = page + 1
  print(page)
}

names(drugsF) <- c("S.No", "Manfacturer", "Brand", "Type","Category", "Unit","Package Unit","Price(in Rs)",
                   "Price/Unit(in Rs)", "Constituents/Unit")
write.csv(drugsF, file = "medindia901_1000.csv",row.names=FALSE)
