#############################################################################
# SCRIPT TO READ IN THE ts2persp() CUSTOM FUNCTION AND ILLUSTRATE ITS USE
# Created by Gottfried Pestal (Solv Consulting Ltd.)
##############################################################################

##### MAUNA LOA EXAMPLE ######

# download the custom functions and put the .R files into your working directory

# read in ts2persp() function
source("3D Prints/Time Series/FUNCTION_ts2persp.R")

# read in a slightly modified version of the r2stl() function by Ian Walker
source("3D Prints/Time Series/FUNCTION_r2stlMOD.R")


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
r2stl.mod(x=c(1:dim(MLO_persp)[1])/scalar,y=c(1:dim(MLO_persp)[2])/scalar,z=MLO_persp/scalar,filename="3D Prints/Time Series/MaunaLoa_CO2.stl",show.persp=TRUE,z.expand=TRUE)


########
# Do a shortened version for years matching the Station ALOHA Data
# 1989-2017

# filter out the matching years
MLO_AnnMeanC02.short <- MLO_AnnMeanC02[MLO_CO2[,"V1"] %in% 1989:2017]

# same steps as above
MLO_AnnMeanC02.short  <- MLO_AnnMeanC02.short  - min(0.95* MLO_AnnMeanC02.short)

#rescale to a max height of some specified units relative to the 4 grid cells/year
MLO_AnnMeanC02.short  <- MLO_AnnMeanC02.short /max(MLO_AnnMeanC02.short)*80

# convert time series to surface coordinates
MLO.short_persp <- ts2persp(MLO_AnnMeanC02.short)

# plot surface
persp(x=1:dim(MLO.short_persp)[1],y=1:dim(MLO.short_persp)[2],z=MLO.short_persp,theta=45,phi=35, zlim=c(0,max(MLO.short_persp)), scale=FALSE)

# scale to determine size of eventual object (2 = half of default size)
scalar <- 2

# create stl file
r2stl.mod(x=c(1:dim(MLO.short_persp)[1])/scalar,y=c(1:dim(MLO.short_persp)[2])/scalar,z=MLO.short_persp/scalar,
            filename="3D Prints/Time Series/MaunaLoa_CO2_Short.stl",show.persp=TRUE,z.expand=TRUE)



########
# Do a updated version of the trimmed series to match the PSEC 3D prints from
# this script https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/CODE/5_Create_3D_Prints.R
# 1980 - 2023

# filter out the matching years
MLO_AnnMeanC02.trim <- MLO_AnnMeanC02[MLO_CO2[,"V1"] %in% 1980:2023]

# same steps as above
MLO_AnnMeanC02.trim  <- MLO_AnnMeanC02.trim  - min(0.95* MLO_AnnMeanC02.trim)

#rescale to a max height of some specified units relative to the 4 grid cells/year
MLO_AnnMeanC02.trim  <- MLO_AnnMeanC02.trim /max(MLO_AnnMeanC02.trim)*80

# convert time series to surface coordinates
MLO.trim_persp <- ts2persp(MLO_AnnMeanC02.trim)

# plot surface
persp(x=1:dim(MLO.trim_persp)[1],y=1:dim(MLO.trim_persp)[2],z=MLO.trim_persp,theta=45,phi=35, zlim=c(0,max(MLO.trim_persp)), scale=FALSE)

# scale to determine size of eventual object (2 = half of default size)
scalar <- 1

# create stl file
r2stl.mod(x=c(1:dim(MLO.trim_persp)[1])/scalar,y=c(1:dim(MLO.trim_persp)[2])/scalar,z=MLO.trim_persp/scalar,
					filename="3D Prints/Time Series/MaunaLoa_CO2_1980to2023.stl",show.persp=TRUE,z.expand=TRUE)

