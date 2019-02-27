a <- clean_link_list[1]
b <- clean_link_list[5]

## TESTING LOOP 1
loop1 <- function(URLLink){
  PlayerScrape <- read_html(URLLink)
  res.txt <- PlayerScrape %>%
    html_nodes(".col-xs-4") %>%
    html_text()
  
  res.df <- as.data.frame(res.txt)
  res.df <- t(res.df)
  
  res.df <- res.df %>%
    str_replace_all(pattern = "\n", replacement = " ") %>%
    str_replace_all(pattern = "\r", replacement = " ") %>%
    str_replace_all(pattern = "\t", replacement = " ") %>%
    str_trim(side = "both")
  
  res.df <- as.data.frame(t(res.df))
}

test1 <- loop1(a)


## TESTING LOOP 2
loop2 <- function(URLLink){
  PlayerScrape <- read_html(URLLink)
  
  res.txt <- PlayerScrape %>%
    html_nodes("p") %>%
    html_text()
  
  res.df <- as.data.frame(res.txt)
  
  res.df <- t(res.df)
  
  res.df <- res.df %>%
    str_replace_all(pattern = "\n", replacement = " ") %>%
    str_replace_all(pattern = "\r", replacement = " ") %>%
    str_replace_all(pattern = "\t", replacement = " ") %>%
    str_trim(side = "both")
  
  res.df <- as.data.frame(t(res.df))
}

test2 <- loop2(a)

## TESTING LOOP 3
loop3 <- function(URLLink) {
  PlayerScrape <- read_html(URLLink)
  
  res.txt <- PlayerScrape %>%
    html_nodes(".lease-text") %>%
    html_text()
  
  res.df <- as.data.frame(res.txt[1])
  
  res.df <- t(res.df)
  
  res.df <- res.df %>%
    str_replace_all(pattern = "\n", replacement = " ") %>%
    str_replace_all(pattern = "\r", replacement = " ") %>%
    str_replace_all(pattern = "\t", replacement = " ") %>%
    str_trim(side = "both")
}

test3 <- loop3(a)
test3.1 <- loop3(b)
