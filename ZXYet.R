
#probar limpiar tabla haciendo promedios.\\
# 1. CAMBIANDO DIRECTORIO DE TRABAJO 
setwd('/Users/estebanorlov/Desktop')
# 2. IMPORTANDO TABLA PRINCIPAL Y A AGREGAR
principal<- read.csv("first.csv")
agregar <- read.csv("agg.csv")
# Merge Clean - MrgCln
MrgCln<- function (P,A){

print("Verificando que dplyr se encuentre instalado")
if(!any(grepl("dplyr",installed.packages())))
{ 
  print("Instalando dplyr")
  install.packages("dplyr")
}else print("el paquete dplyr ya se encuentra instalado")
colnames(P)<- c("v1", "v2", "v3", "v4", "v5", "v6", "v7", "v8", "v9")   
colnames(A)<- c("v1", "v2", "v10", "v11", "v12", "v13") 
#Limpiar milisegundos
P$v1 <- format(as.POSIXct(strptime(P$v1,"%Y-%m-%d %H:%M:%OS",tz="")) ,format = "%Y-%m-%d %H:%M:%S")
A$v1 <- format(as.POSIXct(strptime(A$v1,"%Y-%m-%d %H:%M:%OS",tz="")) ,format = "%Y-%m-%d %H:%M:%S")
#Limpiar valores repetidos a una captura por segundo
library(dplyr)
P<- distinct(P, v1,v2, .keep_all = TRUE)
A<- distinct(A, v1, v2, .keep_all = TRUE)
#Fusionando las tablas
PA <- merge(P, A, by=c("v1","v2"), all = TRUE)
#Ordenando respecto a tiempo
PA <- PA[order(PA$v1),]
#Ordenando respecto a jugador
PA <- PA[order(PA$v2),]
#cambiando NA por ceros
PA[is.na(PA)] <- 0
# Exportar el archivo
print("Exportando archivo")
write.csv(PA, "Bingo.csv", row.names = FALSE)
print("Bingo")
View(PA)
}
# Plot Max Speed - PlotMS
PlotMS<- function(PA){
  #Colecta jugadores
  J<- PA[!duplicated(PA$v2), 2]
  maximos=c()
  nombres=c()
  #Colectando valores maximos de velocidad por jugador
  for(i in J ){
    jug<-PA[PA$v2==i,]
    maximos[i]<-max(jug$v8)
    nombres[i]<-paste("J",i,sep='')
    cat(paste("Vel", nombres[i], ":", maximos[i]), sep = '\n')
  }
  #capturamos maximo para limite de grafica
  maximos[is.na(maximos)] <- 0
  lim<- as.integer(max(maximos)+1)
  #aqui se configura para exportar archivo .png
  png(file = "MxSpd.png",width = 540, height = 334, units = "px" )
  #parametros
  par(
    bg="mintcream" ,
    col.lab="darkblue",
    col.main="black",
    pty = "m"
  )
  #grafica de barras
  barplot(maximos,names.arg=nombres,col="cyan3" ,border="black",xlab="Jugador",ylab="Velocidad (m/s)?",main="VELOCIDAD MAXIMA POR JUGADOR",las=2, yaxp=c(0,lim,lim), ylim =c(0,lim))
  box(col = 'black')
  dev.off()
  
}
# Player Cut - PlyrCut
PlyrCut<- function(PA, a,b){
  # se recortaran tablas desde la de el jugador a hasta la de el jugador b
  ### PlyrCut(PA, a,b) para todos los jugadores desde el a hasta el b...
  ### Dado A<=x<=B donde A el jugador con numero mas bajo y B el del mas alto
  ### PlyrCut(PA, x,x) para unicamente jugador x
  for(i in a:b){
    
    name = paste('J',i,'.csv',sep='')
    jug<-PA[PA$v2==i,]
    write.csv(jug, name, row.names = FALSE)
    
  }
  
}
# Animate Game - AniGam
# crear antes directorio para guardar imagenes
AniGam<- function(PA, n){
# n es el numero de capturas que se quieren
# para tabla limpia con una captura por segundo n=60 nos da el primer minuto del partido
# Lo convertimos despues con ImageMagick entrando al directorio
# EN TERMINAL convert *.png  -loop 0 ani_gam.gif
setwd('/Users/estebanorlov/Desktop/R/images')
for(i in tail(PA$v1, n)){
  name = paste(i,'.png',sep='')
  x<-PA[(PA$v1==i),3]
  y<-PA[PA$v1==i,4]
  png(name,width = 440, height = 365, units = "px")
  par(
    pty = "m"
  )
  plot(x, y, ylim =c(0,75), xlim = c(0,110), ylab="Longitud (metros)", xlab ="Longitud (metros)", type = "n")
  z<-par("usr")
  rect(z[1],z[3],z[2],z[4],col="forestgreen" )
  points(x,y, col=c("blue" ,"red", "orange","black", "yellow", "green", "pink", "cyan", "gainsboro", "gray", "hotpink", "violet", "purple", "peru"))
  title( main=paste(i))
  dev.off()
  }

}