#############################################################################
# SCRIPT TO READ IN THE ts2persp() CUSTOM FUNCTION AND ILLUSTRATE ITS USE
# Created by Gottfried Pestal (Solv Consulting Ltd.)
##############################################################################

##### STATION ALOHA EXAMPLE ######

# download the custom functions and put the .R files into your working directory

# read in ts2persp() function
source("FUNCTION_ts2persp.R")

# read in a slightly modified version of the r2stl() function by Ian Walker
source("FUNCTION_r2stlMOD.R")

# DATA SOURCE
# HOT-DOGS (Hawaii Ocean Time-series Data Organization & Graphical System)
# Bottle Extraction page at http://hahana.soest.hawaii.edu/hot/hot-dogs/bextraction.html
# Settings: 0-20m
# Variables: Bottle pH, Bottle Salinit, CTD Salinity, CTD Temp
# Note: Seemed to have a bug with the pH extraction. Had to extract pH separately, else would get a column of -9.
# Copied the extracted data into a text file. 


# read in the txt files


####################
# rest not yet updated

# scrape the Annual Mean CO2 estimates at Mauna Loa Observatory (MLO) from the NOAA website
MLO_CO2 <- read.table("ftp://ftp.cmdl.noaa.gov/ccg/co2/trends/co2_annmean_mlo.txt")



MLO_CO2 # check

MLO_AnnMeanC02 <- MLO_CO2[,2]
MLO_AnnMeanC02 # check

# change to difference from lowest value (plus a base of 5%) and 

MLO_AnnMeanC02_conv <- MLO_AnnMeanC02 - min(0.95* MLO_AnnMeanC02) 

#rescale to a max height of some specified units relative to the 4 grid cells/year
MLO_AnnMeanC02_conv <- MLO_AnnMeanC02_conv/max(MLO_AnnMeanC02_conv)*80  

# convert time series to surface coordinates
MLO_persp <- ts2persp(MLO_AnnMeanC02_conv)

# plot surface
persp(x=1:dim(MLO_persp)[1],y=1:dim(MLO_persp)[2],z=MLO_persp,theta=45,phi=35, zlim=c(0,max(MLO_persp)), scale=FALSE)

# scale to determine size of eventual object (2 = half of default size)  
scalar <- 2

# create stl file
r2stl.mod(x=c(1:dim(MLO_persp)[1])/scalar,y=c(1:dim(MLO_persp)[2])/scalar,z=MLO_persp/scalar,filename="MaunaLoa_CO2.stl",show.persp=TRUE,z.expand=TRUE)
