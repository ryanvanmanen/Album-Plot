library(XML)
library(xml2)
library(methods)
library(plotly)
library(ggplot2)

##Order and manipulate album list
albums <- read.csv(file="/Users/ryanvanmanen/Documents/Github/Album-Plot/Album_Data.csv")

#Create variable containing ordered dataframe
ordered_albums <-albums[order(albums$Released, decreasing = FALSE), ] 

#Remove rows with NA in Discovered column
ordered_albums <- ordered_albums[!is.na(ordered_albums$Discovered),]

#Write ordered dataframe to a csv and put it in specified directory location
write.csv(ordered_albums,file = "/Users/ryanvanmanen/Documents/Github/Album-Plot/ordered_albums.csv")

#View(ordered_albums)

#Change Column Names with setNames
#ordered_albums <-setNames(ordered_albums, c("Number","Album", "Artist","Released","Discovered"))

#Plot Release Date versus Discovery Date
#plot.default(ordered_albums$Released,ordered_albums$Discovered)

#Label points on scatter plot
#text(ordered_albums$Released, ordered_albums$Discovered, labels = ordered_albums$Album)

#Create scatter plot with hover over points for labels

fig <- plot_ly( type ='scatter', mode = 'markers' ) 

fig <- fig %>%
  add_trace(
    x = ordered_albums$Released, 
    y = ordered_albums$Discovered,
    text = ordered_albums$Album,
    hoverinfo = 'text',
    marker = list(color='green'),
    showlegend = F

  )
  
fig