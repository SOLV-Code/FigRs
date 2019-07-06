## 3D Prints

No matter how fancy the design, plots are still limited to page or screen. 
Interactive tools like [Shiny Apps](https://github.com/SOLV-Code/FigRs/tree/master/Shiny%20Apps) allow us to get closer to the data and look at it in different ways.
But some information is so important that we want to turn it into a tangible physical object, and with
the increasing accessibility of 3D printing this is actually becoming feasible on a small scale.
*And you can use R to do most of the work for you!*

The basic steps are:
* Use R to create a surface plot 
* Convert the plot into a shapefile (*.stl) using [r2stl{}](https://cran.r-project.org/web/packages/r2stl/index.html) by [Ian Walker](http://drianwalker.com/)
* Check your stl file using an stl viewer (e.g. [ViewSTL](https://www.viewstl.com/),
* (Optional) Import the shapefile into [Blender](https://www.blender.org/) to polish up the design 
(e.g. add text and hollow out the base to reduce the cost of the 3D print). 
* Send your object to a 3D  printing service (e.g. [Shapeways](https://www.shapeways.com/))



###  Examples

#### Completed
* [Time Series on a Base](https://github.com/SOLV-Code/FigRs/tree/master/3D%20Prints/Time%20Series)
   * [Mauna Loa Atmospheric CO2]()   
   * [El Nino Events (Nino4 Series)]()   
   * [Station ALOHA pH and Temperature]()   
   * [Lynx Cycles - Mackenzie Region 1821 to 1934]()
   * [Fraser Sockeye Salmon Cycles]()  

All of these are available via our [online shop](https://www.shapeways.com/shops/solv).
To provide design suggestions or request a particular time series, leave a note on the
[issues page](https://github.com/SOLV-Code/FigRs/issues).

#### Pending
* Surface Plot


### Data Prints by Others
- [US Population by State](https://www.shapeways.com/product/VA79ZCB33/usa-by-population?optionId=61661219)
- [US Treasury Yields](https://www.shapeways.com/product/H4KTPRTET/2015-edition-u-s-treasury-yield-curve?optionId=58230053&li=marketplace)

