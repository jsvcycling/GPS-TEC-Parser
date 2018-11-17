# GPS-TEC HDF5 Parser (MATLAB)

This repository contains a very simple function for reading GPS Total Electron
Content (TEC) data from HDF5 files provided by the
[Madrigal project](http://millstonehill.haystack.mit.edu/).

The `get_tec()` function allows the user to input any timestamp and coordinate
pair and it will return the value of the nearest TEC data point. No
interpolation is done. A brief example of it's usage is provided in the `test.m`
script file.