library(XML)
library(xml2)
library(methods)

##XML conversion
#itunes <- xmlToDataFrame('/Users/ryanvanmanen/Music/iTunes Music Library.xml')

#View(itunes)

##Order and manipulate album list
albums <- read.csv(file="/Users/ryanvanmanen/Documents/Github/Album-Plot/Album_Data.csv")

#Create variable containing ordered dataframe
ordered_albums <-albums[order(albums$Released, decreasing = FALSE), ] 

View(ordered_albums)

#Write ordered dataframe to a csv and put it in specified directory location
write.csv(ordered_albums,file = "/Users/ryanvanmanen/Documents/Github/Album-Plot/ordered_albums.csv")

#Plot Release Date versus Discovery Date
#plot.default(ordered_albums$Released,ordered_albums$Discovered)

#Label points on scatter plot
#text(ordered_albums$Released, ordered_albums$Discovered, labels = ordered_albums$Album)

