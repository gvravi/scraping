
if (!require(XML)) install.packages('XML')
library(XML)

library(XML)
library(rvest)
library(data.table)
library(dplyr)
drugsF <- NULL
for( page in 0:2 ){
url <- paste("http://www.medguideindia.com/show_brand.php?nav_link=&pageNum_rr=",page,sep="")
doc1 <- read_html(url)
drugs <-  doc1%>% html_nodes(".tabsborder2")  %>% .[[1]] %>% html_table(fill = TRUE)
drugs<- head(drugs, -2)
drugsF <- rbind(drugsF, drugs)
#a <- bind_rows(a, d)
page = page + 1

}

c <- a[, colSums(is.na(a)) != nrow(a)]


e <- a[ , ! apply( a , 2 , function(x) (is.na(x)) ) ]











