#############################################################################
# SCRIPT TO READ IN THE ts2persp() CUSTOM FUNCTION AND ILLUSTRATE ITS USE
# Created by Gottfried Pestal (Solv Consulting Ltd.)
##############################################################################\

##### STATION ALOHA EXAMPLE ######

library(tidyverse)


# download the custom functions and put the .R files into your working directory

# read in ts2persp() function
source("FUNCTION_ts2persp.R")

# read in a slightly modified version of the r2stl() function by Ian Walker
source("FUNCTION_r2stlMOD.R")

# DATA SOURCE
# HOT-DOGS (Hawaii Ocean Time-series Data Organization & Graphical System)
# http://hahana.soest.hawaii.edu/hot/products/HOT_surface_CO2.txt
# Citation: 
# Dore, J.E., R. Lukas, D.W. Sadler, M.J. Church, and D.M. Karl.  2009.  
# Physical and biogeochemical modulation of ocean acidification in the central North Pacific.  
# Proc Natl Acad Sci USA 106:12235-12240."
# Also see plot at https://www.eea.europa.eu/data-and-maps/daviz/decline-in-ph-measured-at-2#tab-chart_1_filters=%7B%22rowFilters%22%3A%7B%7D%3B%22columnFilters%22%3A%7B%22columnfilter_Filter%22%3A%5B%22pHcalc_insitu%22%3B%22pHmeas_insitu%22%5D%7D%7D


aloha.df <- read.table("http://hahana.soest.hawaii.edu/hot/products/HOT_surface_CO2.txt",
                      skip = 8, header=TRUE, fill=TRUE, na.strings = "-999" )

# check the data
head(aloha.df)

#check the variable names
names(aloha.df)

# fix the date variable and add year, month colums
aloha.df$date <- lubridate::dmy(aloha.df$date) # fix the date formatting

aloha.df <- aloha.df %>% dplyr::mutate(year = lubridate::year(date),
                                       month = lubridate::month(date))



# do some basic plots first
plot(aloha.df$date , aloha.df$pHcalc_insitu,type="l")
plot(aloha.df$date , aloha.df$temp,type="l")


# look at annual averages
# NOTE: 1988 is incomplete (records start in Oct), so drop from the avg
aloha.df.annualavg <- aloha.df %>% dplyr::select(year, pHcalc_insitu,temp) %>% 
  dplyr::group_by(year) %>%
  dplyr::summarise_all(funs(mean),na.rm=TRUE) %>%
  dplyr::filter(year>1988)

plot(aloha.df.annualavg$year, aloha.df.annualavg$pHcalc_insitu,type="l")
plot(aloha.df.annualavg$year, aloha.df.annualavg$temp,type="l")



# change to difference from lowest value (plus a base of 5%) and 
# scale relative to base/pedestal units and grid cells/ year
# some trial and error required for this
aloha.pH.conv <- ((aloha.df.annualavg$pHcalc_insitu * 1000 - min(950* aloha.df.annualavg$pHcalc_insitu) ) -400) *1.3
aloha.temp.conv <- (aloha.df.annualavg$temp *60 - min(57* aloha.df.annualavg$temp) ) - 70

plot(aloha.df.annualavg$year,aloha.pH.conv,type="l")
plot(aloha.df.annualavg$year,aloha.temp.conv,type="l")

# convert time series to surface coordinates
pH_persp <- ts2persp(aloha.pH.conv )
temp_persp <- ts2persp(aloha.temp.conv )

# plot surface
persp(x=1:dim(pH_persp)[1],y=1:dim(pH_persp)[2],z=pH_persp,
      theta=45,phi=35, zlim=c(min(pH_persp),max(pH_persp)), scale=FALSE)

persp(x=1:dim(temp_persp)[1],y=1:dim(temp_persp)[2],z=temp_persp,
      theta=45,phi=35, zlim=c(min(temp_persp),max(temp_persp)), scale=FALSE)

# scale to determine size of eventual object (2 = half of default size)  
scalar <- 2

# create stl file
r2stl.mod(x=c(1:dim(pH_persp)[1])/scalar,y=c(1:dim(pH_persp)[2])/scalar,z=pH_persp/scalar,filename="StationALOHA_pH.stl",show.persp=TRUE,z.expand=TRUE)
r2stl.mod(x=c(1:dim(temp_persp)[1])/scalar,y=c(1:dim(temp_persp)[2])/scalar,z=temp_persp/scalar,filename="StationALOHA_temp.stl",show.persp=TRUE,z.expand=TRUE)
