#######
# author: "Maite Moreno Góemz"
# date: "11/06/2024"
# proyecto: TFG/GB/UMA
#######

# Este archivo (chi2.R) contiene el código para un análisis no paramétrico con Chi-cuadrado de datos sobre el éxito del injerto en distintas variedades

library(readxl)

datos <- read_xlsx("Datos/NOMBREARCHIVO.xlsx",
                   sheet = "datos")
fitchisq <- chisq.test(datos)
fitchisq$statistic
fitchisq$p.value

library(corrplot)
corrplot(fitchisq$residuals, is.cor = FALSE)
