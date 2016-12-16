# ZXYet
R ZXY Sport Tracking data edition tools
Español - Spanish
--------------------------------------------------------------------------------------------------
Herramientas de edición para tablas generadas por sistemas de rastreo deportivo ZXY ( ZXY Sport tracking systems )

Este paquete contiene funciones para limpiar, recortar y graficar información de bases de  datos generadas por sistemas de rastreo deportivo ZXY.

ZXYet contiene las siguientes funciones

MrgCln( raw.csv, agg.csv )
Función que se alimenta de dos tablas, la principal y la a agregar respectivamente. MrgCLn limpia las bases de datos de manera que quede solo una captura por segundo. ( los sistemas ZXY pueden capturar mas de 20 capturas por segundo ). Fusiona las tablas resultantes y exporta una nueva tabla fusionada y limpia.


PlotMS(nombre.csv)
Crea una gráfica de barras de la máxima velocidad alcanzada por cada jugador.

CutPlyr(data.csv, a:b)
Función que recorta la tabla por jugador, se le puede indicar un solo jugador o un conjunto de jugadores

AniGam(data.csv, n)
Crea un conjunto de capturas de la posición de los jugadores respecto al tiempo. n indica el numero de capturas.
Las cuales después se pueden convertir a gif para ver una recreación animada de la parte de partido deseada.

Puede encontrar tablas de este tipo para hacer pruebas ( son las que utilizé para probar el código ) en el siguiente link:

http://home.ifi.uio.no/paalh/dataset/alfheim/

Donde se encuentran disponibles para uso publico con fines de investigación gracias a los desarrolladores de Bagadus, un sistema para análisis técnico de fútbol, desarrollado en Noruega. 
Se pueden descargar las capturas ZXY y videos de distintos ángulos de 3 partidos distintos. Estos partidos fueron jugados por clubes de fútbol de primera división de Noruega.
Hay dos bases de datos .csv por cada tiempo de cada partido. Es decir. Cuatro por partido.
Para cada tiempo hay una base de datos principal y otra a agregar, la cual contiene algunas variables diferentes.

Si utiliza los conjuntos de datos, se nos pide que se agregue al trabajo la siguiente cita:

"Soccer video and player position dataset": S. A. Pettersen, D. Johansen, H. Johansen, V. Berg-Johansen, V. R. Gaddam, A. Mortensen, R. Langseth, C. Griwodz, H. K. Stensland, and P. Halvorsen, in Proceedings of the International Conference on Multimedia Systems (MMSys), Singapore, March 2014 
[pdf]

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

La causa
Este primera contribución comenzó como una asesoría de R que estuve impartiendo.
No había trabajado antes con R así que tuve que estudiar antes de darla.
Son mis primeras funciones en R, sumamente sencillas, ideales para iniciarse en este gran lenguaje.
Cualquier comentario, sugerencia o ayuda para mejorar las funciones y/o agregar nuevas será apreciado y bienvenido.

En la web de el proyecto bagadus

http://site.uit.no/iad/sports/bagadus/
Podemos leer que:
Basados en los datos de los sensores ZXY, podemos hacer queries  para analizar estadísticas como el total de distancia recorrida, número de sprints de una velocidad dada, etc. Podemos hacer queries de la posición exacta de cualquier jugador en cualquier instante. 
Me gustaría que me ayudaran a hacer este tipo de queries.

Detalles
Hay algunos detalles interesantes de las tablas de el juego con fecha 2013-11-03
son los siguientes:
No tiene capturas del jugador 4
El jugador 3 tiene muy pocas capturas
El jugador 12 está casi inmóvil
Los jugadores se teletransportan ( ver sample de animación de AniGam() )
No he visto todavía los vídeos del partido para verificar pero creo que las primeras tres observaciones podrían ser errores en las capturas de los sensores ZXY.

La razón por la cual los jugadores se teletransportan es por que se utilizaron sensores aleatorios para proteger la privacidad de los jugadores… los desarrolladores de bagadus mencionan que no son permitidos intentos de re identificar jugadores individuales, crear perfiles de desempeño de jugador/club, o actividades similares. 

Para más información
puede escribir a 

atilaorlov@gmail.com

Estaré encantado de escuchar de usted.

------------------------------------------------------------------------------------------------------------------------------------
English - Inglés
--------------------------------------------------------------------------------------------------

R ZXY Sport Tracking data edition tools

Package name:
ZXYet
( sexy isn't it ? )

This package contains functions to clean, cut and plot data output of ZXY Sport Tracking systems.

ZXYet contains the following functions

MrgCln( raw.csv, agg.csv )
R function. pass two ZXYdata.csv as input ( raw and agg). The output is a new merged data frame with only one capture per second.

MaxSPlot(data.csv)
output .png file with bar plot of maximum speed reached per player. ( upload sample )

CutPlyr(data.csv, a:b)
Makes new .csv with data for each player in work directory

AniGam(data.csv, n)
Export .png plot of position of all players one per second to convert later to .gif animation with ImageMagick
n is the number of captures to output. 
( Upload sample )

It was written to manage ZXY data. It was tested with ZXY data that you can find at the following link for educational purposes:

http://home.ifi.uio.no/paalh/dataset/alfheim/

If you use the dataset, please cite the dataset paper:
"Soccer video and player position dataset": S. A. Pettersen, D. Johansen, H. Johansen, V. Berg-Johansen, V. R. Gaddam, A. Mortensen, R. Langseth, C. Griwodz, H. K. Stensland, and P. Halvorsen, in Proceedings of the International Conference on Multimedia Systems (MMSys), Singapore, March 2014 
[pdf]


Why ? The motivations
This first contribution started because of an R Assessment i gave.
I like to code in C but i haven't worked in R before.
This was my first time using R so I'm sure you will find details in coding and i appreciate comments, suggestions or any help to improve this functions
and/or add more interesting functions to the package.

On the bagadus project website

http://site.uit.no/iad/sports/bagadus/
you can read that :
Based on these sensor data ( ZXY Sport tracking sensor ), statistics like total length ran, number of sprints of a given speed, etc. can be queried for, in addition, to the exact position of all players at all times.
i would like some help on how can i do this kind of queries.

Some curious things about the data of the 2013-11-03 game are:
it does not have captures for player 4
player 3 have very little captures. 
Player 12 barely moves…
Players are teleporters ( see the animation sample )
The link i proportioned above have some video files of the games that i haven't seen but i think the observations i made about the data of player 4,3 and 12 may be errors of the ZXY tracking system???

The reason why players teleport is because randomized sensor tags where used to protect the privacy of players… bagadus developers claim that
attempts to re-identify individual players, create player/club performance profiles, and similar, are not allowed. Be adviced.

For more information, and/or, if you are learning R and you want to know in detail how the functions where written and why please feel free to visit my blog:

or ask directly to me

atilaorlov@gmail.com

i will be happy to hear from you.
