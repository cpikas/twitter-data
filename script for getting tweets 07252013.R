#set working directory



library("twitteR", lib.loc="C:/Users/Christina/Documents/R/win-library/3.0")

#necessary step for Windows?
download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")

cred <- OAuthFactory$new(consumerKey='N3YA6GJRwBWArhTfMOwSiw',
                         consumerSecret='JG2TkDleOwQ1CmRqezQH9v9sbeGkSX90Wg918UDps',
                         requestURL='https://api.twitter.com/oauth/request_token',
                         accessURL='https://api.twitter.com/oauth/access_token',
                         authURL='http://api.twitter.com/oauth/authorize')
#necessary step for Windows
cred$handshake(cainfo="cacert.pem")
#save for later use for Windows
save(list="cred", file="twitteR_credentials")

#if coming back in do this
load("twitteR_credentials")

registerTwitterOAuth(cred)
6518617


#test
s <- searchTwitter("#icanhazpdf", cainfo="cacert.pem")
AGU13.1210 <- searchTwitter("#AGU13", cainfo="cacert.pem")


# Get the timeline
person <- userTimeline("cpikas",n=5)

#################################
#Start here
#set working directory


#load the twitter package
library("twitteR", lib.loc="C:/Users/Christina/Documents/R/win-library/3.0")

#load saved twitter credentials
load("twitteR_credentials")

#register credentials
registerTwitterOAuth(cred)

### searches
#note: maximum returned defaults to 25, add since for each time these are pulled down
# can do instead sinceID
AGU13.1210 <- searchTwitter("#AGU13", n=2000, since = "2013-12-01", cainfo="cacert.pem")
#save(AGU13.1210, file="AGU13-1210") #saves weird object as is
#make into df, and nothing is lost as df so why not?
AGU13.1210.df <- twListToDF(AGU13.1210)
#save as more easily usable csv
write.csv(AGU13.1210.df, file="AGU13-1210")

##
#need to catch up
AGU13.1210.big <- searchTwitter("#AGU13", n=2000, since = "2013-12-01", until="2013-12-11", retryOnRateLimit=120, cainfo="cacert.pem")
AGU13.1210.big.df <- twListToDF(AGU13.1210.big)
write.csv(AGU13.1210.big.df,file="AGU13.1210.big")
#this only went back to 20:50 on 12-10 - 1000 tweets
410559435040227000
AGU13.1211 <- searchTwitter("#AGU13", n=2000, sinceID = 410559435040227000 , retryOnRateLimit=120, cainfo="cacert.pem")
AGU13.1211.df <- twListToDF(AGU13.1211)
write.csv(AGU13.1211.df, "AGU13-1211a")

#later 1211 pick up at id 410620095182823424
AGU13.1212 <- searchTwitter("#AGU13", n=2000, sinceID = 410620095182823424 , retryOnRateLimit=120, cainfo="cacert.pem")
AGU13.1212.df <- twListToDF(AGU13.1212)
write.csv(AGU13.1212.df, "AGU13-1212")
#that only got 99... geez, last id 410965715491889000 run at 9:58 12/11/2013
AGU13.1211b <- searchTwitter("#AGU13", n=2000, sinceID = 410620095182823424 , since="2013-12-10" ,until="2013-12-12", retryOnRateLimit=120, cainfo="cacert.pem")
AGU13.1211b.df <- twListToDF(AGU13.1211b)
write.csv(AGU13.1211b.df, "AGU13-1211b")
#run 12/12 12:44 99, last id 411189772431147009
AGU13.1212a <- searchTwitter("#AGU13", n=2000, sinceID = 410965715491889000, retryOnRateLimit=120, cainfo="cacert.pem")
AGU13.1212a.df <- twListToDF(AGU13.1212a)
write.csv(AGU13.1212a.df, "AGU13-1212a")
#run 12/12 10:52pm, 598 last id 411343150645792768
AGU13.1213 <- searchTwitter("#AGU13", n=2000, sinceID = 411189772431147009, retryOnRateLimit=240, cainfo="cacert.pem")
AGU13.1213.df <- twListToDF(AGU13.1213)
write.csv(AGU13.1213.df, "AGU13-1213")
#run 12/13 9:28pm, 998 last id 411684216137469952
AGU13.1214 <- searchTwitter("#AGU13", n=2000, sinceID = 411343150645792768, retryOnRateLimit=240, cainfo="cacert.pem")
AGU13.1214.df <- twListToDF(AGU13.1214)
write.csv(AGU13.1214.df, "AGU13-1214")

