#!/bin/bash


d=${1}

yyyy=$(date -d ${d} +'%Y')
mm=$(date -d ${d} +'%m')
yyyymmdd=$(date -d ${d} +'%Y%m%d')

wget --load-cookies ~/.urs_cookies --save-cookies ~/.urs_cookies --keep-session-cookies -r -c -nH -nd -np -A nc4 --content-disposition "https://goldsmr5.gesdisc.eosdis.nasa.gov/data/MERRA2/M2I3NVAER.5.12.4/${yyyy}/${mm}/MERRA2_200.inst3_3d_aer_Nv.${yyyymmdd}.nc4"

wget --load-cookies ~/.urs_cookies --save-cookies ~/.urs_cookies --keep-session-cookies -r -c -nH -nd -np -A nc4 --content-disposition "https://goldsmr5.gesdisc.eosdis.nasa.gov/data/MERRA2/M2I3NVAER.5.12.4/${yyyy}/${mm}/MERRA2_400.inst3_3d_aer_Nv.${yyyymmdd}.nc4"

wget --load-cookies ~/.urs_cookies --save-cookies ~/.urs_cookies --keep-session-cookies -r -c -nH -nd -np -A nc4 --content-disposition "https://goldsmr5.gesdisc.eosdis.nasa.gov/data/MERRA2/M2I3NVAER.5.12.4/${yyyy}/${mm}/MERRA2_401.inst3_3d_aer_Nv.${yyyymmdd}.nc4"

if [ -f MERRA2_200.inst3_3d_aer_Nv.${yyyymmdd}.nc4 ]; then
    rename MERRA2_200 MERRA2_400 *
fi

if [ -f MERRA2_401.inst3_3d_aer_Nv.${yyyymmdd}.nc4 ]; then
    rename MERRA2_401 MERRA2_400 *.nc4
fi
