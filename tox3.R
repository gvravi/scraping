toxicity <- NULL
#n <- 3
for (page in 1:2){
  
  url <- paste("http://www.medguideindia.com/show_toxication_details.php?generic_id=",page,"")
 
  link <- read_html(url)
  
  generic <- link %>% html_nodes("strong.red-txt") %>% html_text()
  

  #toxic <- data.frame(generic, indication, c_indication, caution, side_effect,stringsAsFactors=FALSE)
  toxicity <- rbind(toxicity, generic)
  page <- page + 1
}