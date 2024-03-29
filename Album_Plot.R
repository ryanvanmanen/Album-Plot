library(XML)
library(xml2)
library(methods)
library(plotly)
library(ggplot2)

##Order and manipulate album list
albums <- read.csv(file="/Users/ryanvanmanen/Documents/Album-Plot/Album_Data.csv")

#Create variable containing ordered dataframe
ordered_albums <-albums[order(albums$Released, decreasing = FALSE), ] 

#Remove rows with NA in Discovered column
ordered_albums <- ordered_albums[!is.na(ordered_albums$Discovered),]

#Write ordered dataframe to a csv and put it in specified directory location
write.csv(ordered_albums,file = "/Users/ryanvanmanen/Documents/Album-Plot/ordered_albums.csv")

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

x = (ordered_albums$Released)
y = (ordered_albums$Discovered)
#is_duplicate <- duplicated(x) | duplicated(x, fromLast = TRUE) | duplicated(y) | duplicated(y, fromLast = TRUE)

jitter_amount <- 0.05
#x_jittered <- ifelse(is_duplicate, x + runif(sum(is_duplicate), min = -jitter_amount, max = jitter_amount), x)
#y_jittered <- ifelse(is_duplicate, y + runif(sum(is_duplicate), min = -jitter_amount, max = jitter_amount), y)

fig <- plot_ly( 
  type ='scatter', 
  mode = 'markers',
)

fig <- fig %>% 
  add_trace(
    x = jitter(ordered_albums$Released,1), 
    y = jitter(ordered_albums$Discovered,0.5),
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
    xaxis = list(title = '<b>Release Year</b>',dtick=5), 
    yaxis = list(title = '<b>Discovery Year</b>',dtick=2),
    legend = list(title = list(text='<b>Legend</b>')),
      xaxis = list(
        dtick = 5, 
        tickmode = "linear"
      )
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
