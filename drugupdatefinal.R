library(xml2)
library(rvest)
library(stringr)

drugUpdate <- NULL
for( page in 1:100) { #there is no zero page hence started with 1
  
  url <- paste("http://www.drugsupdate.com/brand/listing/",page,sep="")
  
  link <- read_html(url)
  Brand <- link %>%  html_nodes("span.enhanced_text") %>% html_text()
  Company <- link %>%  html_nodes(".company .brand_generic") %>% html_text() 
  
  #Removes starting character hyphen(-)
  Company <- gsub("^-", "", Company)
  Generic <-link %>% html_nodes(".company+ a .brand_generic") %>% html_text()
  
  #The two commands remove first and last character like [abc]
  Generic <- gsub('^.', '', Generic) 
  Generic <- gsub('.{1}$', '', Generic)
  
  drugU <- data.frame(Brand,Company, Generic, stringsAsFactors=FALSE) 
  
  
  # Bind ambulances rows to empty ambulances dataframe
  drugUpdate <- rbind(drugUpdate, drugU)
  print(page)
  
}

# Finally write results to empty csv file
write.csv(drugUpdate, file = "C:/Users/avon/Documents/R/drugupdate/drugUpdate1.csv",row.names=FALSE)
