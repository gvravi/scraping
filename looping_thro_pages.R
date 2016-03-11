for (page in 1:pages){
  # create the new URL for the current page
  url <- paste0("http://aviation-safety.net/database/dblist.php?Year=1962&lang=&page=", page)
}
  
  
  for( page in 0:2 ) {
    url <- paste("http://www.medguideindia.com/show_brand.php?nav_link=&pageNum_rr=",page,sep="")
    doc1 <- read_html(url)
  }
  
  for( page in 0:6) {
    url <- paste("http://yellowpages.sulekha.com/ambulance-services_hyderabad_",page,sep="")

#     docz <- read_html(url)
#     print(docz)
    
  }
  
