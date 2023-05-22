
library(XML)
library(xml2)
library(methods)
library(plotly)
library(ggplot2)

##Order and manipulate album list
albums <- read.csv(file="/Users/ryanvanmanen/Documents/Github/Album-Plot/Album_Data.csv")

#http://www.musicbrainz.org/ws/2/recording/?query=artist:nikes+recording:ftg2

artist_name <- albums$Artist

album_name <- albums$Album

for (i in albums){
  lookup_link = paste("http://www.musicbrainz.org/ws/2/recording/?query=artist:", 
                      albums$Artist,"+recording:",albums$Album)
  
}



#Write ordered dataframe to a csv and put it in specified directory location
write.csv(lookup_link,file = "/Users/ryanvanmanen/Documents/Github/Album-Plot/MBID_links.csv")






