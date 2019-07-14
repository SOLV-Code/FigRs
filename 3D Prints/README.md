## 3D Prints

No matter how fancy the design, plots are still limited to page or screen. 
Interactive tools like [Shiny Apps](https://github.com/SOLV-Code/FigRs/tree/master/Shiny%20Apps) allow us to get closer to the data and look at it in different ways.
But some information is so important that we want to turn it into a tangible physical object, and with
the increasing accessibility of 3D printing this is actually becoming feasible on a small scale.

*And you can use R to do most of the work for you!*

The basic steps are:
* Use R to create a surface plot 
* Convert the plot into a shapefile (*.stl) using [r2stl{}](https://cran.r-project.org/web/packages/r2stl/index.html) by [Ian Walker](http://drianwalker.com/)
* Check your stl file using an stl viewer (e.g. [ViewSTL](https://www.viewstl.com/)).
* (Optional) Import the shapefile into [Blender](https://www.blender.org/) to polish up the design 
(e.g. add text and hollow out the base to reduce the cost of the 3D print).  Note that Blender is extremely powerful and 
has a very steep learning curve, but to do a little polishing of the 3D print you only need a few basic functions. 
Start with their [First Steps Tutorial](https://www.blender.org/support/tutorials/) and the guide/cheatsheet below.
* Send your object to a 3D  printing service (e.g. [Shapeways](https://www.shapeways.com/)).


<p float="left">

<img src="https://github.com/SOLV-Code/FigRs/blob/master/images/PerspScreenshot.jpg" width="160" height="160">
<img src="https://github.com/SOLV-Code/FigRs/blob/master/images/BlenderScreenshot.jpg" width="160" height="160">
<img src="https://github.com/SOLV-Code/FigRs/blob/master/images/FigRs_3dprint1.jpg" width="160" height="160">


</p>


###  Examples

#### Completed
* [Time Series on a Base](https://github.com/SOLV-Code/FigRs/tree/master/3D%20Prints/Time%20Series)
   * Mauna Loa Atmospheric CO2   
   * El Nino Events (Nino4 Series)   
   * Station ALOHA pH and Temperature   
   * Lynx Cycles - Mackenzie Region 1821 to 1934
   * Fraser Sockeye Salmon Cycles

All of these are available via our [online shop](https://www.shapeways.com/shops/solv).
To provide design suggestions or request a particular time series, leave a note on the
[issues page](https://github.com/SOLV-Code/FigRs/issues).

#### Pending
* Surface Plot


### Data Prints by Others
- [US Population by State](https://www.shapeways.com/product/VA79ZCB33/usa-by-population?optionId=61661219)
- [US Treasury Yields](https://www.shapeways.com/product/H4KTPRTET/2015-edition-u-s-treasury-yield-curve?optionId=58230053&li=marketplace)


### Getting Started with Blender

*These notes are specifically for polishing stl shapes created with r2stl() for printing via shapeways.com*


#### Blender Hotkeys Needed

Views:
- Change views with combination of Number Keys, hotkeys, and Mousepad (This is tricky at first!)
- 2,4,6,8 rotate incrementally in that direction
- 1,3,7 switch to a preset view
- Shift + c to zoom out
- Mousewheel to zoom
- Ctrl + Wheel to pan Left/Right
- Shift + Wheel to pan Up/Down

Menus / Modes:
- Tab = Toggle between Object Mode and Edit Mode (If selected text obj, press Tab to enter text, del doesn't work, only backspace)
- N opens the properties menu

In object mode:
- Shift and right click to select multiple objects

In edit mode: 
- need to set on bottom menu whether to select vertices, edges, or surfaces
- Right Mouse Button (RMB) to select
- Shift and RMB to select multiple
- A to select/deselect all
- B key: to box select
- Ctrl and LMB to Lasso select
- C to brush select with RMB
- x = Delete
- G = Grab
- S = Scale
- R = Rotate





#### Basic Steps

- Clean up edges of the standing base (select, then x, then delete vertices)
- On left menu, select Normals > recalculate (this cleans up the surface for adding thickness)
- On right menu, choose wrench tool to add a modifier, then select "solidify", and change thickness to 4.0
- Add text as needed (create text and solidify, then line up with side of the object)
- "a" to select all objects, 
- Export to stl file
- Upload stl file to shapeways
- rescale as needed (36% in most cases)






