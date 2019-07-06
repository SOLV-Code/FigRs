## 3D Print Design 1: Time Series on a Base


The challenge here is how to convert a univariate time series into a surface,
plus a base so that the final printed object can stand up. 

To build the object, we set up a grid of square cells, and specify 
heights for points on the surface based on the data series.

Use the custom functions below to create your own, 
write to FigRs(at)solv.ca and suggest a time series, 
or get one of the sample prints from our [online shop](https://www.shapeways.com/shops/solv).


### Custom Functions

[ts2persp()]( ): function that takes a time series and converts it into a matrix of surface heights
(incl. user settings for base and pedestal).

[r2stl.mod()](): function that takes 2 coordinate vectors (x,y) and a matrix of heights for each [x,y] pair 
, creates a surface plot using *persp()*, and then converts the surface plot to stl format.




### Worked Examples

Data sources are listed in each R script.

* [Mauna Loa Atmospheric CO2](https://github.com/SOLV-Code/FigRs/blob/master/3D%20Prints/Time%20Series/SCRIPT_3DTimeSeries_MaunaLoaCO2.R)   
* [El Nino Events (Nino4 Series)]()   
* [Station ALOHA pH and Temperature](https://github.com/SOLV-Code/FigRs/blob/master/3D%20Prints/Time%20Series/SCRIPT_3DTimeSeries_StationAloha.R)   
* [Lynx Cycles - Mackenzie Region 1821 to 1934](https://github.com/SOLV-Code/FigRs/blob/master/3D%20Prints/Time%20Series/SCRIPT_3DTimeSeries_LynxAbd.R)
* [Fraser Sockeye Salmon Cycles](https://github.com/SOLV-Code/FigRs/blob/master/3D%20Prints/Time%20Series/SCRIPT_3DTimeSeries_FraserSockeye.R)  


### Planned Examples

* Yukon River Ice Breakup at Dawson ([Data](http://www.yukonriverbreakup.com/statistics))

















