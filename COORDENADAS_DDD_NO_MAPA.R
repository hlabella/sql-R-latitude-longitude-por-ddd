
################ libraries #############################

library(leaflet)
library(tidyr)
library(RODBC)

################ connection #############################

conn <- odbcDriverConnect("Driver=SQL Server Native Client 11.0;
                Server=seu server; Database=sua database; 
                Uid=seu username; trusted_connection=yes")




################ query to get the data #############################


query <- paste("SELECT * FROM CDG..DEPARA_DDD_COORD", sep = "") 

data_df <- sqlQuery(conn,query)



################ labels and map #############

#coordinates labels
data_df$LABELS <- paste("DDD: " , as.character(data_df$DDD), " - ", data_df$LUGAR)

#map
m <- leaflet() %>% addTiles() %>% addCircleMarkers(data = data_df, lat = data_df$LAT, lng = data_df$LONG, radius = 1, label = data_df$LABELS, color = "red", fill = TRUE) 
m







