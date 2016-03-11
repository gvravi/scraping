library(magrittr)
url <- read_html("http://yellowpages.sulekha.com/ambulance-services_hyderabad_1")

ambul <- html_nodes(url, ".GAQ_C_BUSL, .contact-number, address.pull-left") %>% html_text() 
ambul

Hosp_name <- url %>% html_nodes(".GAQ_C_BUSL") %>% html_text()

#contact_no <- url %>% html_nodes(".contact-number")  %>% html_text()


contact_no <- lapply(contact_no, function(pn) {
    pn %>% html_nodes(".contact-number") %>%  html_text() %>%
    ifelse(identical(., character(0)), NA, .)  
  
     })
 contact_no <- unlist(contact_no)


 
 
 r.precio.antes <- url %>% html_nodes(".GAQ_C_BUSL") %>%
   lapply(. %>% html_nodes("..contact-number") %>% html_text() %>% 
            ifelse(identical(., character(0)), NA, .)) %>% unlist










# r.precio.antes <- page_source %>% html_nodes(".product_price") %>%
#   lapply(. %>% html_nodes(".normal_encontrado") %>% html_text() %>% 
#            ifelse(identical(., character(0)), NA, .)) %>% unlist()


# product_nodes <- page_source %>% html_nodes(".product_price")
# Then I could use lapply in more traditional way:
#   
#   r.precio.antes <- lapply(product_nodes, function(pn) {
#     pn %>% html_nodes(".normal_encontrado") %>% html_text()
#   })
# r.precio.antes <- unlist(r.precio.antes)


#missing <- function(x){
#  if(".contact-number" %in% names(x))
 #   html_node(x[[".contact-number"]])
 # else NA}




address <- url %>% html_nodes("[itemprop=address]") %>% html_text()

ambulances <- data.frame(Hosp_name,contact_no, address)


df3 <- do.call(rbind, lapply(ambul, data.frame, stringsAsFactors=FALSE))

df1 <- data.frame(t(sapply(ambul,c)))

df <- data.frame(matrix(unlist(ambul), ncol=2, byrow=T),stringsAsFactors=FALSE)

lapply(ambul, function(X) X:(X+3))

lapply(seq(1, 58, 3), function(X) X:(X+3)) -> Indices
Columns <- lapply(Indices, function(X) ambul[X,])
Columns
ambul[Columns,]
df <- as.data.frame(t(Columns))
NewDF <- do.call(cbind, Columns)
