library(xml2)
library(rvest)
library(stringr)

drugUpdate <- NULL
for( page in 101:500) { #there is no zero page hence started with 1
  
url <- paste("http://www.drugsupdate.com/brand/listing/",page,sep="")

link <- read_html(url)
Brand <- link %>%  html_nodes("span.enhanced_text") %>% html_text()
Company <- link %>%  html_nodes(".company .brand_generic") %>% html_text() 
Company <- gsub("^-", "", Company)
Generic <-link %>% html_nodes(".company+ a .brand_generic") %>% html_text()
Generic <- gsub('^.', '', Generic) 
Generic <- gsub('.{1}$', '', Generic)
Combination <- link %>% html_nodes(".strengthlisting:nth-child(5) td:nth-child(1)") %>% html_text()
Volume <- link %>% html_nodes(".strengthlisting:nth-child(5) td:nth-child(2)") %>% html_text()
Presentation <- link %>% html_nodes(".strengthlisting:nth-child(5) td:nth-child(3)") %>% html_text()
Price <- link %>% html_nodes(".strengthlisting:nth-child(5) td:nth-child(4)") %>% html_text()
Price <- gsub('.{6}$', '', Price)  
 
#drugU <- data.frame(Brand,Company, Generic, stringsAsFactors=FALSE) 

drug1 <- data.frame(Brand,Company, Generic,Combination,Volume,Presentation,Price, stringsAsFactors=FALSE) 

# Bind ambulances rows to empty ambulances dataframe
drugUpdate <- rbind(drugUpdate, drug1)
print(page)

}

# Finally write results to empty csv file
write.csv(drugUpdate, file = "C:/Users/avon/Documents/R/drugupdate/drugUpdate101_500.csv",row.names=FALSE)
