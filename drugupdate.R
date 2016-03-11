library(xml2)
library(rvest)
library(stringr)

drugUpdate <- NULL
for( page in 0:6) {
  
url <- paste("http://www.drugsupdate.com/brand/listing/",page,sep="")

link <- read_html(url)
Brand <- link %>%  html_nodes("span.enhanced_text") %>% html_text()
Company <- link %>%  html_nodes(".company .brand_generic") %>% html_text() 
Company <- gsub("^-", "", Company)
Generic <-link %>% html_nodes(".company+ a .brand_generic") %>% html_text()
Generic <- gsub('^.', '', Generic) 
Generic <- gsub('.{1}$', '', Generic)
# Strength <- link %>% html_nodes(".strengthlisting:nth-child(5) td:nth-child(1)") %>% html_text()
# 
# #Strength <- link %>% html_nodes(".strengthlisting td:nth-child(1)") %>% html_text()


drugU <- data.frame(Brand,Company, Generic, stringsAsFactors=FALSE) 

# drug1 <- data.frame(Brand,Company, Generic,Strength, stringsAsFactors=FALSE) 

# Bind ambulances rows to empty ambulances dataframe
drugUpdate <- rbind(drugUpdate, drugU)
print(page)

}

# Finally write results to empty csv file
write.csv(ambulances, file = "drugUpdate1.csv",row.names=FALSE)
