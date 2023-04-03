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

xref <- 2000:2024
yref <- 2000:2024
#Create scatter plot with hover over points for labels

fig <- plot_ly( 
  type ='scatter', 
  mode = 'markers',
  )


fig <- fig %>% 
  add_trace(
    x = ordered_albums$Released, 
    y = ordered_albums$Discovered,
    text = paste("<b>Album:</b> ",ordered_albums$Album, ",",ordered_albums$Released,"<br></br>",
                 "<b>Artist:</b> ", ordered_albums$Artist), 
    hoverinfo = 'text',
    marker = list(color='rgba(113, 189, 250, 1.1)'),
    name = 'Album'
  )


#Add Graph Title
fig <- fig %>%
  layout(
    title = list(text="Album Discovery vs. Release Year",
                 size = 8),
    xaxis = list(title = '<b>Release Year</b>'), 
    yaxis = list(title = '<b>Discovery Year</b>'),
    legend = list(title = list(text='<b>Legend</b>'))
    )
  
#Add Reference Line
fig <- fig %>%
  add_trace(
    x = xref, 
    y = yref,
    mode = "lines",
    name = "y=x Ref Line",
    line=list(color='#d0a12c'),
    opacity=0.50
    )
   
fig
