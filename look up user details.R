
library("twitteR", lib.loc="C:/Users/Christina/Documents/R/win-library/3.0")

#get the data
data <- read.csv("C:/Users/Christina/Dropbox/Dissertation/agu2012/agu12uniquetweeters.csv", colClasses = "character")
USERdata<-vector()

userInfo<-function(USER){
  temp<-getUser(USER, cainfo="cacert.pem")
  print(temp$statusesCount)  
  print(temp$followersCount)
  print(temp$created)
  USERdata<-c(USER,temp$created,temp$statusesCount,temp$followersCount)
  return(USERdata)
}

#test for users 4-6
tweeter.info<-sapply(data$user[4:6],userInfo)
#other testing stuff
# transpose is t()
write.csv(tweeter.info.df.t,file="testuserdata2")

#trying a longer way


get.USER.info<-function(startno,stopno){
  # set up the vectors first
  n<-stopno-startno+1
  USER.name<-character(n)
  USER.created<-numeric(n)
  USER.posts<-numeric(n)
  USER.foll<-numeric(n)
  for (i in startno:stopno) {
    thing<-getUser(data$user[i], cainfo="cacert.pem")
    USER.name[i]<-data$user[i]
    if (!is.null(thing)){
    USER.created[i]<-thing$created
    USER.posts[i]<-thing$statusesCount
    USER.foll[i]<-thing$followersCount
    }
    }
    
  return(data.frame(username=USER.name,created=USER.created, posts=USER.posts,followers=USER.foll, stringsAsFactors=FALSE))
}

#does not work to skip nulls will have to skip manually... they are
#1234, 40, 1121,1110, 1088, 1081, 1077, 1061, 1050, 1031, 79,469, 437,381,287

for (i in 1:1276){print((is.null(easy.tweeters$data$user[i])))}

#going back to mess with easy.tweeters <- which was a lookup of all data$users

#this worked
testdf<-twListToDF(easy.tweeters[1])
#how to loop, though
testbigdf<-data.frame()
for (i in 38:41){holddf<-twListToDF(easy.tweeters[i])
                testbigdf<-rbind(testbigdf,holddf)
}

#####################
#this is the one that works, super simple, end up with a df
easy.tweeters.noNA<-lookupUsers(data$user, cainfo="cacert.pem")
length(easy.tweeters.noNA)
#1247 so there were 29 accounts missing hrm.2%
testbigdf<-data.frame()
for (i in 1:1247){holddf<-twListToDF(easy.tweeters.noNA[i])
                 testbigdf<-rbind(testbigdf,holddf)
}


write.csv(testbigdf, file="agu12userdetails.csv")