#############################################################################
# SCRIPT TO READ IN THE ts2persp() CUSTOM FUNCTION AND ILLUSTRATE ITS USE
# Created by Gottfried Pestal (Solv Consulting Ltd.)
##############################################################################\

##### EL NINO INDEX EXAMPLE ######

library(tidyverse)


# download the custom functions and put the .R files into your working directory

# read in ts2persp() function
source("FUNCTION_ts2persp.R")

# read in a slightly modified version of the r2stl() function by Ian Walker
source("FUNCTION_r2stlMOD.R")

# DATA SOURCE
# World Meteorological Organization 
# Global Climate Observing System  (GCOS)
# https://www.esrl.noaa.gov/psd/gcos_wgsp/Timeseries/Data/nino4.long.anom.data
# Niño 4 SST Index
# Calculated from the HadISST1. It is the area averaged SST from 5S-5N and 160E-150W. 
# Citation: 
# Rayner N. A., D. E. Parker, E. B. Horton, C. K. Folland, L. V. Alexander, 
# D. P. Rowell, E. C. Kent, A. Kaplan, 
# Global analyses of sea surface temperature, sea ice, and night marine air 
# temperature since the late nineteenth century, 
# J. Geophys. Res., 108 (D14), 4407, doi:10.1029/2002JD002670, 2003. 


elnino.df <- read.table("https://www.esrl.noaa.gov/psd/gcos_wgsp/Timeseries/Data/nino4.long.anom.data",
                      skip = 1, header=FALSE, fill=TRUE, na.strings = "-99.99",stringsAsFactors = FALSE) 

# label the columns
names(elnino.df) <- c("Year",1:12)

# clean out the info at the end
elnino.df <- elnino.df %>%   dplyr::filter(!is.na(as.numeric(Year)))

# check the data
head(elnino.df)
tail(elnino.df)

# reorganize into flat file format (1 row / record), sort it, 
# drop incomplete 2019, and add a plotting index
elnino.flat <- elnino.df %>% tidyr::gather(key = "Month",value, -Year) %>%
                  dplyr::mutate(Month=as.numeric(Month)) %>%
                 dplyr::arrange(Year,Month) %>%
                  dplyr::mutate_all(funs(as.numeric)) %>%
                  dplyr::filter(Year<2019)
  
elnino.flat$ID <-  1:dim(elnino.flat)[1]

# do some basic plots first
plot(elnino.flat$ID , elnino.flat$value ,type="l")


# also look at annual averages

elnino.annualavg <- elnino.flat %>%  
    dplyr::select(Year, value) %>%
    dplyr::group_by(Year) %>%
    dplyr::summarise_all(funs(mean),na.rm=TRUE) 

plot(elnino.annualavg$Year, elnino.annualavg$value,type="l")

# look at positive anomalies in annual avg
elnino.posdev <-  elnino.annualavg
elnino.posdev[elnino.posdev$value < 0,"value"] <- 0 
plot(elnino.posdev$Year, elnino.posdev$value,type="l")



# scale relative to base/pedestal units and grid cells/ year
# some trial and error required for this
elnino.posdev.conv <- elnino.posdev$value *150
  
plot(elnino.posdev$Year, elnino.posdev.conv,type="l")


# convert time series to surface coordinates
elnino_persp <- ts2persp(elnino.posdev.conv)

# plot surface
persp(x=1:dim(elnino_persp)[1],y=1:dim(elnino_persp)[2],z=elnino_persp,
      theta=45,phi=35, zlim=c(min(elnino_persp),max(elnino_persp)), scale=FALSE)



# scale to determine size of eventual object (2 = half of default size)  
scalar <- 2

# create stl file
r2stl.mod(x=c(1:dim(elnino_persp)[1])/scalar,y=c(1:dim(elnino_persp)[2])/scalar,z=elnino_persp/scalar,filename="ElNino_PosAnom.stl",show.persp=TRUE,z.expand=TRUE)
