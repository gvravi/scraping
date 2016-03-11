library(magrittr)
library(RCurl)
library(XML)
library(rvest)
library(dplyr)

url <- read_html("http://yellowpages.sulekha.com/ambulance-services_hyderabad_2")

ambul <- html_nodes(url, "address.pull-left, .contact-number , .GAQ_C_BUSL") %>% html_text() %>% data.frame()
#names(ambul)

#ambul$casecount <- rowSums(ambul[,] == 0)

df_ambul <- NULL
#nrow <- as.numeric (0)
#for(nrow in ambul)

for(i in 1:dim(ambul)[1])
  
  {
  if (i == i + 3)
  #if (rowSums(ambul[,1] == nrow + 3))
    
    {
    
    df <- as.data.frame(ambul)
    df_ambul <- rbind(df_ambul, df)
    #a <- bind_rows(a, d)
    i = i + 1
    
    
  }
  

}
  

