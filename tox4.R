library(rvest)
library(xml2)
library(dplyr)
library(xlsx)
toxicity <- NULL

for (page in 1:2){
  
  url <- paste("http://www.medguideindia.com/show_toxication_details.php?generic_id=",page,"")
  link <- read_html(url)
  tox <- html_nodes(link, ".middlepanelborder")
  

#   url <- "http://www.medguideindia.com/show_toxication_details.php?generic_id=2"
#   link<- read_html(url)
  
  # Find the html/css class under which all elements to be extracted occcur
  #tox <- html_nodes(link, ".middlepanelborder")
  
  
  #complete with NAs when tag is not present by looping through tags using lappy and do call
  
  toxic <-  do.call(rbind, lapply(tox, function(x) {
    Generic <- tryCatch(xml_text(xml_node(x, ".red-txt")),error=function(err) {NA})
    data.frame(Generic, stringsAsFactors=FALSE)
    
    
  }))
  
  # Bind ambulances rows to empty ambulances dataframe
  toxicity <- rbind(toxicity, toxic)
  
}


write.csv(toxicity, file = "toxicity.csv")
# write.xlsx(toxicity, file = "tox.excelfile.xlsx",
#            sheetName = "TestSheet", row.names = FALSE)
