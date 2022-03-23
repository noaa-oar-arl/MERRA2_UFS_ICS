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

## Installation

The easiest way is to create a new conda environment.  You can use the `merra2ics.yml` file included with this repository to create a new environment.

```bash
conda env create --file merra2ics.yml
conda activate merra2ics
pip install git+https://github.com/noaa-oar-arl/fv3grid
```

or create your own environment like so 

```bash 
conda create -n merra2ics xarray xesmf scipy numpy 
```


## To Use

### Retrieve MERRA2 data from HPSS

We have many dates available for P7.1 and P8b already available on HPSS.  You can retrieve them like so 

```bash
htar -xvf /NCEPDEV/emc-naqfc/5year/Barry.Baker/MERRA2_INST_3D_AERO/MERRA2_400.inst_3d_aero_Nv.${yyyy}.nc4 MERRA2_400.inst3_3d_aer_Nv.${yyyymmdd}.nc4
```


### merra2_download.sh

If the data isn't archived on HPSS you can use the `merra2_download.sh` script to download the data directly from the NASA servers

Example: 

```bash
./merra2_download.sh 20191201
```

This will download the required file for December 1st 2019

### Process Single Day

first copy merra2 data into the directory.  If it is already archived on HPSS you can just download it from there using the following command: 

```bash
htar -xvf /NCEPDEV/emc-naqfc/5year/Barry.Baker/MERRA2_INST_3D_AERO/MERRA2_400.inst_3d_aero_Nv.${yyyy}.nc4 MERRA2_400.inst3_3d_aer_Nv.${yyyymmdd}.nc4
```

Then you can execute the python file for all tiles like so:

```bash 
for i in {1..6}; do 
    ./merra2_to_fv3_cubesphere.py -m MERRA2_400.inst3_3d_aer_Nv.${yyyymmdd}.nc4 -c gfs_ctrl.nc -t gfs_data.tile${i}.nc -r C384
done
```

### Process multiple dayas 

To process all tiles for a given day in a more scripted way you can use the `add_merra2_day.sh` script. `add_merra2_day.sh` will retrieve the data from HPSS as well as copy the python file to the working directory.


