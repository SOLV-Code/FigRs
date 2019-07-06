## 3D Prints

No matter how fancy the design, plots are still limited to page or screen. 
Interactive tools like *Shiny Apps* allow us to get closer to the data and look at it in different ways.
But some information is so important that we want to turn it into a tangible physical object, and with
the increasing accessibility of 3D printing this is actually becoming feasible on a small scale.
*And you can use R to do most of the work for you!*.

The basic steps are:




Convert a data series into a surface which 
can then be further processed into a 3D object for printing.


Solution: Set up a grid of square cells, and specify 
heights to describe spikes based on the data series, 
plus a base so that the final printed object can stand up. 
Feed the resulting surface coordinates into a slightly 
modified version of the r2stl.r function by Ian Walker. 
This creates a basic *.stl shapefile 
that can be directly used by 3D printers, 
or imported into Blender to polish up the design 
(e.g. add text and hollow out the base to reduce the cost of the 3D print). 

Use the custom function below to create your own, write to FigRs(at)solv.ca and suggest a time series, or get one of the examples from our online store.

###  Examples

#### Completed
* [Time Series on a Base](https://github.com/SOLV-Code/FigRs/tree/master/3d%20Prints/Time%20Series)

#### Pending
* Surface Plot
*



### Data Prints by Others
- [US Population by State](https://www.shapeways.com/product/VA79ZCB33/usa-by-population?optionId=61661219)
- [US Treasury Yields](https://www.shapeways.com/product/H4KTPRTET/2015-edition-u-s-treasury-yield-curve?optionId=58230053&li=marketplace)

