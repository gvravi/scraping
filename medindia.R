library(XML)
library(rvest)
library(data.table)
library(dplyr)
drugsF <- NULL
names(drugsF) <- c("S.No", "Manfacturer", "Brand", "Type","Category", "Unit","Package Unit","Price(in Rs)",
                   "Price/Unit(in Rs)", "Constituents/Unit")
write.csv(drugsF, file = "medindia.csv",row.names=FALSE)
for( page in 0:150 ){
  url <- paste("http://www.medguideindia.com/show_brand.php?nav_link=&pageNum_rr=",page,sep="")
  doc1 <- read_html(url)
  drugs <-  doc1%>% html_nodes(".tabsborder2")  %>% .[[1]] %>% html_table(fill = TRUE)
  drugs<- head(drugs, -2)
  drugs <- tail(drugs, -2)
  drugs <- drugs[, colSums(is.na(drugs)) != nrow(drugs)]
  drugsF <- rbind(drugsF, drugs)
  #a <- bind_rows(a, d)
  page = page + 1
  
}

