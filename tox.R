library(xml2)
library(rvest)
library(dplyr)
library(tidyr)


toxicity <- NULL
#n <- 3
for (page in 1:2){
  
#   initiate empty data.frame, in which we will store the data
#   toxicity <- data.frame(generic = character(0), indication = character(0), 
#                     c_indication = character(0),caution = character(0), 
#                    side_effect = character(0))
#                     
  
  url <- paste("http://www.medguideindia.com/show_toxication_details.php?generic_id=",page,"")
 # url <- "http://www.medguideindia.com/show_toxication_details.php?generic_id=2"
  
  Generic <- tryCatch(xml_text(xml_node(x, "strong.red-txt.selectorgadget_selected")),error=function(err) {NA})
 
  link <- read_html(url)
  # tox <- link %>% html_nodes(".middlepanelborder") %>% html_table(fill=TRUE)
  
  generic <- link %>% html_nodes("strong.red-txt") %>% html_text()
  
  indication <- link %>% html_nodes("tr:nth-child(1) .mosttext") %>% html_text()
  
  c_indication <- link %>% html_nodes("tr:nth-child(3) .mosttext") %>% html_text()
  
  caution <- link %>% html_nodes("tr:nth-child(5) .mosttext") %>% html_text()
  
  side_effect <- link %>% html_nodes("tr:nth-child(7) .mosttext") %>% html_text()
  
  toxic <- data.frame(generic, indication, c_indication, caution, side_effect,stringsAsFactors=FALSE)
  toxicity <- rbind(toxicity, toxic)
  page <- page + 1
}