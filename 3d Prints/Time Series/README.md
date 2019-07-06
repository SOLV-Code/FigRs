## 3D Print Design 1: Time Series on a Base

Last Updated: August 29, 2013










Challenge: Convert a data series into a surface which can then be further processed into a 3D object for printing.

Solution: Set up a grid of square cells, and specify heights to describe spikes based on the data series, plus a base so that the final printed object can stand up. Feed the resulting surface coordinates into a slightly modified version of the r2stl.r function by Ian Walker. This creates a basic *.stl shapefile that can be directly used by 3D printers, or imported into Blender to polish up the design (e.g. add text and hollow out the base to reduce the cost of the 3D print). Use the custom function below to create your own, write to FigRs(at)solv.ca and suggest a time series, or get one of the examples from our online store.

    ts2persp.R
    r2stlMOD.R
    Illustration: Lynx Cycles - Mackenzie Region 1821 to 1934 (code, buy)
    Illustration: Fraser Sockeye Salmon Cycles (code, buy)
    Illustration: Mauna Loa Atmospheric CO2 (code, buy)






