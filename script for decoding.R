
library("twitteR", lib.loc="C:/Users/Christina/Documents/R/win-library/3.0")

#get the data
data <- read.csv("agu12justurl.csv", colClasses = "character")
#check it out
head(data)
str(data)
#test a single one
decode_short_url(data$url[2])
#this was for me trying to append, sigh
full.vec <- vector(mode="character")
#create a vector to put the new stuff in, then i'll append to the data frame, i hope

#make a subset that's easy to work with or at least more reasonable
data.sub<- data[c(1:200),]

#check the for loop at all
for (i in 1:200){print(data.sub$url[i])}
#that works
for (i in 1:3){print(decode_short_url(data.sub$url[i]))}
#that works - good to know, though, that if it can't be expanded it comes back null
for (i in 1:1502){urlhold<-decode_short_url(data$url[i]) 
                print(urlhold)
                  if (is.null(urlhold)) {urlhold<-data$url[i]}
                  append(full.vec,urlhold)
}
#stopped at last complete 121, line 97 - super long url, shortened and it fixed.
#appending to the vector is not working, but printing is so will run with that
for (i in 971:1502){
  if(nchar(data$url[i])>50){
    urlhold<-data$url[i]
  } else {
    urlhold<-decode_short_url(data$url[i]) 
  }
                  print(urlhold)
                  #if (is.null(urlhold)) {urlhold<-data$url[i]}
                  #append(full.vec,urlhold)
}
#failed for lenght, also some ow.ly and maybe others can't be expanded because they go directly to a file share - aren't really shortened
for (i in 1:10){
  if(nchar(data$url[i])>50){
    urlhold<-data$url[i]
  } else {
    urlhold<-decode_short_url(data$url[i]) 
  }
  full.vec[i]<-urlhold
  print(urlhold)

}
