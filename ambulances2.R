# Store web url
url <- read_html("http://yellowpages.sulekha.com/ambulance-services_hyderabad_1")

# Get Hosp titles
Hosp <- url %>% html_nodes("[itemprop=name]") %>% html_text()

# Get contact no
 Contact <-  url %>% html_nodes(".contact-number") %>%  html_text()
contact
# Get locations
location <- url %>% html_nodes("address.pull-left") %>% html_text()
location


amb <- data.frame(Hosp = ifelse(length(Hosp)==0, NA, Hosp),
  Contact = ifelse(length(Contact)==0, NA, Contact), stringsAsFactors=F) 


library(knitr)
kable(indeed_jobs, format = "html")