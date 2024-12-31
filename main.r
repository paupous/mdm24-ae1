
# Load CSV Data
column_names <- c("IP", "Timestamp", "Peticion", "Codigo", "Bytes")

data <- read.table("data/epa-http.csv",
  col.names=column_names,
  sep=" ",
  fill=TRUE,
  quote="\"")

# Format and clean data
data$Bytes <- as.numeric(data$Bytes)
data$Bytes <- ifelse(is.na(data$Bytes), 0, data$Bytes)

data$Timestamp <- gsub("\\[|\\]", "", data$Timestamp)
data$Hour <-
  sapply(strsplit(data$Timestamp, ":"), function(x) as.numeric(x[2]))
data$P_Tipo <-
  sapply(strsplit(data$Peticion, " "), function(x) as.character(x[1]))
data$P_Url <-
  sapply(strsplit(data$Peticion, " "), function(x) as.character(x[2]))
data$P_Protocolo <-
  sapply(strsplit(data$Peticion, " "), function(x) as.character(x[3]))

# Pregunta 1
##1. Cuales son las dimensiones del dataset cargado (número de filas y columnas)
dimensions <- dim(data)

cat("Number of rows:", dimensions[1], "\n")
cat("Number of columns:", dimensions[2], "\n")

##2. Valor medio de la columna Bytes
mean_bytes <- mean(data$Bytes, na.rm=TRUE)
cat("Valor medio de la columna Bytes:", mean_bytes, "\n")

# Pregunta 2
## De las diferentes IPs de origen accediendo al servidor, ¿cuantas pertenecen a una IP claramente educativa (que contenga ".edu")?
educational_ips <- sum(grepl(".edu", data$IP))
cat("Número de IPs educativas:", educational_ips, "\n")

# Pregunta 3
## De todas las peticiones recibidas por el servidor cual es la hora en la que hay mayor volumen de peticiones HTTP de tipo "GET"?

get_requests <- subset(data, data$P_Tipo == "GET")
requests_by_hour <- table(get_requests$Hour)

max_count <- max(requests_by_hour)
max_hour <- names(requests_by_hour[requests_by_hour == max_count])

cat("La hora con mayor volumen de peticiones GET es:", max_hour, "con un total de", max_count, "peticiones.\n")

# Pregunta 4
## De las peticiones hechas por instituciones educativas (.edu), ¿Cuantos bytes en total se han transmitido, en peticiones de descarga de ficheros de texto ".txt"?
eduactional_requests <- subset(data, grepl(".edu", data$IP))

total_txt_requests <- sum(subset(eduactional_requests, grepl(".txt", P_Url))$Bytes)

cat("Total de bytes transmitidos en peticiones .txt de IPs educativas:", total_txt_requests, "\n")

# Pregunta 5
# Si separamos la petición en 3 partes (Tipo, URL, Protocolo), usando str_split y el separador " " (espacio), ¿cuantas peticiones buscan directamente la URL = "/"?

root_requests <- subset(data, P_Url == "/")
cat("Número de peticiones que buscan directamente la URL = /:", nrow(root_requests), "\n")

# Pregunta 6
# Aprovechando que hemos separado la petición en 3 partes (Tipo, URL, Protocolo) ¿Cuantas peticiones NO tienen como protocolo "HTTP/0.2"?

non_http_02_requests <- subset(data, P_Protocolo != "HTTP/0.2")
cat("Número de peticiones que NO tienen como protocolo HTTP/0.2:", nrow(non_http_02_requests), "\n")