#Vectores
1:10 * 2
1:10 * 1:5

#Data Frames
library(ggplot2)
head(diamonds)
str(diamonds)

#Indexar
diamonds[1:5, ]
diamonds[diamonds$x == diamonds$y, ]
diamonds[-(1:53929), c("carat", "price")]

#Datos Faltantes
sum(c(5, NA), na.rm = TRUE)
mean(c(5, NA), na.rm = TRUE)

#Ambiente Interactivo
a <- 10
(a <- 15)

qplot(carat, price, data = diamonds, colour = clarity)

#Funciones y Reglas de B??squeda L??xica
wtd_mean <- function(x, wt = rep(1, length(x))) {
  sum(x * wt) / sum(wt)
}
wtd_mean(1:10)
wtd_mean(1:10, 10:1)

#Ejemplo de funciones
#1
x <- 5
f <- function(){
  y <- 10
  c(x = x, y = y) 
}
rm(x, f)

#2
x <- 5
g <- function(){
  x <- 20
  y <- 10
  c(x = x, y = y)
}
g()

#3
x <- 5
h <- function(){
  y <- 10
  i <- function(){
    z <- 20
    c(x = x, y = y, z = z)
  }
  i() 
}
h()

#4
j <- function(){
  if (!exists("a")){
    a <- 5
  } else{
    a <- a + 1 
  }
  print(a) 
}
x <- 0
y <- 10
j()

#5
k <- function(){
  x <- 1
  function(){
    y <- 2
    x + y 
  }
}
k()

#Gr??ficas de Dispersi??n
library(ggplot2)

head(mpg)
str(mpg)
summary(mpg)

ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point()

ggplot(mpg, aes(x = displ, y = hwy, color = class)) + 
  geom_point()

p <- ggplot(mpg, aes(x = displ, y = hwy))
p + geom_line() 

p <- ggplot(mpg, aes(x = cty, y = hwy))
p + geom_point() 

p + geom_jitter() 

ggplot(mpg, aes(x = class, y = hwy)) + 
  geom_point() 

ggplot(mpg, aes(x = reorder(class, hwy), y = hwy)) + 
  geom_point() 

ggplot(mpg, aes(x = reorder(class, hwy), y = hwy)) + 
  geom_jitter() 

ggplot(mpg, aes(x = reorder(class, hwy), y = hwy)) + 
  geom_boxplot() 

ggplot(mpg, aes(x = reorder(class, hwy), y = hwy)) + 
  geom_jitter() +
  geom_boxplot()

help (reorder)

ggplot(mpg, aes(x = reorder(class, hwy, median), y = hwy)) + 
  geom_boxplot() 

ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_jitter() +
  facet_wrap(~ cyl)

ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_jitter() +
  facet_grid(.~ class)

ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_jitter() +
  facet_grid(drv ~ class)

data(airquality)
ggplot(airquality, aes(x = Solar.R, y = Ozone)) + 
  geom_point() 

library(Hmisc)

airquality$Wind.cat <- cut2(airquality$Wind, g = 3) 
ggplot(airquality, aes(x = Solar.R, y = Ozone)) + 
  geom_point() +
  facet_wrap(~ Wind.cat)

ggplot(airquality, aes(x = Solar.R, y = Ozone)) + 
  geom_point() +
  facet_wrap(~ Wind.cat) + 
  geom_smooth(span = 3)

head(bnames)

bnames_John <- bnames[bnames$name == "John", ]
ggplot(bnames_John, aes(x = year, y = percent)) +
  geom_point()

ggplot(bnames_John, aes(x = year, y = percent, color = sex)) +
  geom_line()

###################################
######## TAREA ####################
###################################

library(ggplot2)
head(msleep)
str(msleep)
summary(msleep)
sapply(msleep, class)
names(msleep)


ggplot(msleep, aes(x = reorder(vore, sleep_total, median), y = sleep_total)) + 
  geom_boxplot() 

ggplot(msleep, aes(x = reorder(vore, awake, median), y = awake)) + 
  geom_boxplot() 

ggplot(msleep, aes(x = reorder(vore, sleep_rem, median), y = sleep_rem)) + 
  geom_boxplot() 

ggplot(msleep, aes(x = reorder(vore, sleep_cycle, median), y = sleep_cycle)) + 
  geom_boxplot() 

ggplot(msleep, aes(x = sleep_total, y = awake)) + 
  geom_jitter() +
  facet_grid(.~ vore)

ggplot(msleep, aes(x = sleep_total, y = sleep_rem)) + 
  geom_jitter() +
  facet_grid(.~ vore)+
 geom_smooth(stat = 'smooth')

ggplot(msleep, aes(x = brainwt, y = bodywt)) + 
  geom_jitter() +
  facet_grid(.~ vore)

help (geom_smooth)

library(Hmisc)

msleep$bodywt.cat <- cut2(msleep$bodywt, g = 9) 
ggplot(msleep, aes(x = sleep_total, y = sleep_rem)) + 
  geom_point() +
  facet_wrap(~ bodywt.cat)

msleep$bodywt.cat <- cut2(msleep$bodywt, g = 9) 
ggplot(msleep, aes(x = sleep_total, y = awake)) + 
  geom_point() +
  facet_wrap(~ bodywt.cat)
