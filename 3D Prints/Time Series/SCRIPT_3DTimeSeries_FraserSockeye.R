
#############################################################################
# SCRIPT TO READ IN THE ts2persp() CUSTOM FUNCTION AND ILLUSTRATE ITS USE
# Created by Gottfried Pestal (Solv Consulting Ltd.)
##############################################################################


##### FRASER SOCKEYE EXAMPLE ###############

# download the custom functions and put the .R files into your working directory


# read in ts2persp() function
source("FUNCTION_ts2persp.R")

# read in a slightly modified version of the r2stl() function by Ian Walker
source("FUNCTION_r2stlMOD.R")



# Copy in total estimates for Fraser River Sockeye Salmon 1952-2010
# Data sourced from a file maintained by the Pacific Salmon Commission (www.psc.org)

FraserSoxRun <- c(3072270, 5128568 ,11968897,2664362,2823871,4535086,18614880,4595289,3404930,4525433,3401227,3912726,1734619,3017825,5185876,6469962,
	2863316,4685110,5908822,7571675,3588883,6549853,8401026,3565442,4265625,5636680,9355795,6350734,3097958,7547297,13948286,5208538,5888696,13674911,
	15837641,7644688,3708629,18467796,21954455,12359751,6351240,23576662,17271232,3880668,4482908,16377338,10865460,3639921,5198916,7191487,15131527,
	4889372,4184020,7024548,12978697,1508505,1739425,1575116,28365256)
	
	
FraserSoxSpn <- c(793603,1058917,2415020,361443,858398,1340150,3802098,927296,620915,1160439,1575441,1577830,387639,774253,1797994,1331836,595404,
	923071,1865340,719639,760620,1044355,1656552,920793,781098,1014014,2484176,1368230,829437,1384102,4007720,964917,922058,2077686,3657738,1905471,
	1370339,3060183,6064285,3306272,1068805,5754095,3128543,1731233,2027534,4251921,4418998,1832759,2352930,5256702,10201057,1979385,524446,3307950,
	4661459,889281,815472,1055713,13130865)





# CREATE RUN SIZE OBJECT

FraserSoxRun  # check
plot(FraserSoxRun ,type="l") #check
	

# change to difference from lowest value (plus a base of 5%) and 

#rescale to a max height of some specified units relative to the 4 grid cells/year
FraserSoxRun <- FraserSoxRun/max(FraserSoxRun)*80  

# convert time series to surface coordinates
FraserSoxRun_persp <- ts2persp(FraserSoxRun)

# plot surface
persp(x=1:dim(FraserSoxRun_persp)[1],y=1:dim(FraserSoxRun_persp)[2],z=FraserSoxRun_persp,theta=45,phi=35, zlim=c(0,max(FraserSoxRun_persp)), scale=FALSE)

# scale to determine size of eventual object (2 = half of default size)  
scalar <- 2

# create stl file
r2stl.mod(x=c(1:dim(FraserSoxRun_persp)[1])/scalar,y=c(1:dim(FraserSoxRun_persp)[2])/scalar,z=FraserSoxRun_persp/scalar,filename="FraserSoxRun.stl",show.persp=TRUE,z.expand=TRUE)






# CREATE SPAWNER ABUNDANCE OBJECT

FraserSoxSpn  # check
plot(FraserSoxSpn,type="l") #check
	

# change to difference from lowest value (plus a base of 5%) and 

#rescale to a max height of some specified units relative to the 4 grid cells/year
FraserSoxSpn <- FraserSoxSpn/max(FraserSoxSpn)*80  

# convert time series to surface coordinates
FraserSoxSpn_persp <- ts2persp(FraserSoxSpn)

# plot surface
persp(x=1:dim(FraserSoxSpn_persp)[1],y=1:dim(FraserSoxSpn_persp)[2],z=FraserSoxSpn_persp,theta=45,phi=35, zlim=c(0,max(FraserSoxSpn_persp)), scale=FALSE)

# scale to determine size of eventual object (2 = half of default size)  
scalar <- 2

# create stl file
r2stl.mod(x=c(1:dim(FraserSoxSpn_persp)[1])/scalar,y=c(1:dim(FraserSoxSpn_persp)[2])/scalar,z=FraserSoxSpn_persp/scalar,filename="FraserSoxSpn.stl",show.persp=TRUE,z.expand=TRUE)



