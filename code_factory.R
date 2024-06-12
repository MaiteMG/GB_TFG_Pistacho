#######
# author: "Maite Moreno Góemz"
# date: "11/06/2024"
# proyecto: TFG/GB/UMA
#######

# Este archivo (code_factory.R) contiene un bucle que llama de forma interactiva a un archivo tipo Rmarkdown 
# (i.e. analsisi_exploratorio_morfofisiologia.Rmd).

# carga de los paquetes necesarios
library(knitr)
library(markdown)
library(rmarkdown)
library(readxl)

# importar los datos de una pestaña específica dentro de la hoja de datos.
datos <- read_excel("Datos/NOMBREARCHIVO.xlsx",
                    sheet = "datos")

#variables <- c(-7) # crear un vector con las columnas (variables) que no se quieren analizar indicando el número de columna de la tabla original en valor negativo.

#datos <- datos[,variables]

# para cada variable variable (dependiente) del estudio, genera un informe en formato html
# los informes se salvan en el directorio definido en output_dir
# con el nombre especificado por output_file

for (i in c(3:length(names(datos)))){
  #  para informes en formato html
  rmarkdown::render(input = "R/analisis_exploratorio_morfofisiologia.Rmd",
                    output_format = "html_document",
                    output_file = paste(i,"_",names(datos[i]),".html", sep=''),
                    output_dir = "Resultados")
}

# for (i in c(3:length(names(datos)))){
#   #  para informes en formato html
#   rmarkdown::render(input = "R/Nested_ANOVA.Rmd",
#                     output_format = "html_document",
#                     output_file = paste(i,"_",names(datos[i]),".html", sep=''),
#                     output_dir = "Resultados")
# }
