library(xml2)
library(rvest)

#Declare null vector to get final data table

ambulances <- NULL

# loop through all page numbers

for( page in 0:6) {
  url <- paste("http://yellowpages.sulekha.com/ambulance-services_hyderabad_",page,sep="")
  link<- read_html(url)

# Find the html/css class under which all elements to be extracted occcur
  Hosp <- html_nodes(link, ".list-item")
  
  
#complete with NAs when tag is not present by looping through tags using lappy and do call
  
  ambul <-  do.call(rbind, lapply(Hosp, function(x) {
    Hospital <- tryCatch(xml_text(xml_node(x, "[itemprop=name]")),
                         error=function(err) {NA})
  
    Phone <- tryCatch(xml_text(xml_node(x, ".contact-number")),
                         error=function(err) {NA})
    Location <- tryCatch(xml_text(xml_node(x, "address.pull-left")),
                         error=function(err) {NA})
    data.frame(Hospital, Phone, Location, stringsAsFactors=FALSE)
    

}))
  
# Bind ambulances rows to empty ambulances dataframe
  ambulances <- rbind(ambulances, ambul)
}

# Finally write results to empty csv file
    write.csv(ambulances, file = "ambulances.csv",row.names=FALSE)
    
#     library(knitr)
#    a <- kable(ambulances, format = "html")
