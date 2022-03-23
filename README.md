# MERRA2_UFS_ICS
Regrids the MERRA2 Reanalysis to the UFS weather model grid for initial conditions using the ESMF bilinear regridding method via the xESMF python module.


## Requirements

This requires a python 3 environment.  You can create your own or use the merra2ics.yml file to recreate the environment.

Required Python Modules

- xarray
- scipy
- numpy 
- argparse
- xesmf
- fv3grid - https://github.com/noaa-oar-arl/fv3grid

## Required files

This does require the grid description file for UFS. It also requires the MERRA2_400.inst3_3d_aer files from the MERRA2 ReAnalysis.  These are available through this website: `https://goldsmr5.gesdisc.eosdis.nasa.gov/data/MERRA2/M2I3NVAER.5.12.4/${yyyy}/${mm}/`

## To Use

### merra2_download.sh

If the data isn't archived on HPSS you can use the `merra2_download.sh` script to download the data directly from the NASA servers

Example: 

`./merra2_download.sh 20191201`

This will download the required file for December 1st 2019

### Process Single Day

If you want to process a single day to add initial conditions to the atmosphere only ICs you can `cd` into the 

### Download Script

