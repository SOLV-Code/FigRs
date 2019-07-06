#############################################################################
# SCRIPT TO READ IN THE ts2persp() CUSTOM FUNCTION AND ILLUSTRATE ITS USE
# Created by Gottfried Pestal (Solv Consulting Ltd.)
##############################################################################

##### LYNX EXAMPLE ######

# download the custom functions and put the .R files into your working directory


# read in ts2persp() function
source("FUNCTION_ts2persp.R")

# read in a slightly modified version of the r2stl() function by Ian Walker
source("FUNCTION_r2stlMOD.R")


# Get classic dataset on Lynx population cycles
# Oft-cited paper: 
# The Ten-Year Cycle in Numbers of the Lynx in Canada
# Charles Elton and Mary Nicholson
# Journal of Animal Ecology, Vol. 11, No. 2 (Nov., 1942), pp. 215-244
# PDF retrieved from http://jxshix.people.wm.edu/2009-harbin-course/classic/Elton-1942-J-Anim-Ecol.pdf in August 2013
# Data below copied from their Table 4 using Alt+ Left Mouse Button to select a single column in Acrobat Reader X


# Lynx Fur Returns 1821 to 1934 - Mackenzie River Region - Hudson Bay Company Data

Lynx_Mackenzie <- c(269, 321, 585, 871, 1475, 2821, 3928, 5943, 4950, 2577, 523, 98, 184, 279, 409, 2285, 2685, 3409, 1824, 409,
	151, 45, 68, 213, 546, 1033, 2129, 2536, 957, 361, 377, 225, 360, 731, 1638, 2725, 2871, 2119, 684, 299, 236, 245, 552, 1623, 
	3311, 6721, 4245, 687, 255, 473, 358, 784, 1594, 1676, 2251, 1426, 756, 299, 201, 229, 469, 736, 2042, 2811, 4431, 2511, 389, 
	73, 39, 49, 59, 188, 377, 1292, 4031, 3495, 587, 105, 153, 387, 758, 1307, 3465, 6991, 6313, 3794, 1836, 345, 382, 808, 1388, 
	2713, 3800, 3091, 2985, 3790, 674, 81, 80, 108, 229, 399, 1132, 2432, 3574, 2935, 1537, 529, 485, 662, 1000, 1590, 2657, 3396)

Lynx_Mackenzie # check
plot(Lynx_Mackenzie,type="l") #check


#rescale to a max height of some specified units relative to the 4 grid cells/year
Lynx_Mackenzie <- Lynx_Mackenzie/max(Lynx_Mackenzie)*80  

# convert time series to surface coordinates
Lynx_Mackenzie_persp <- ts2persp(Lynx_Mackenzie)

# plot surface
persp(x=1:dim(Lynx_Mackenzie_persp)[1],y=1:dim(Lynx_Mackenzie_persp)[2],z=Lynx_Mackenzie_persp,theta=45,phi=35, zlim=c(0,max(Lynx_Mackenzie_persp)), scale=FALSE)

# scale to determine size of eventual object (2 = half of default size)  
scalar <- 2

# create stl file
r2stl.mod(x=c(1:dim(Lynx_Mackenzie_persp)[1])/scalar,y=c(1:dim(Lynx_Mackenzie_persp)[2])/scalar,z=Lynx_Mackenzie_persp/scalar,filename="Lynx_Mackenzie.stl",show.persp=TRUE,z.expand=TRUE)