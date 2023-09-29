#!/bin/bash

#########################################################################
# This file will retrieve archived MERRA2 data from HPSS.
# 
# use ./add_merra2_day.sh YYYYMMDD
#########################################################################
ml hpss

cdir=$PWD

yyyymmdd=${1}
yyyy=$(date -d ${yyyymmdd} +"%Y")


yyyymmddhh=${yyyymmdd}00
# just a print statement
echo ${yyyymmdd}

# enter directory
pushd ../${yyyymmdd}

# copy python file - change to your copy of merra2_to_ufs_cubesphere.py 
# cp /scratch2/NAGAPE/arl/Barry.Baker/UFS_AERO_CONFIGS/develop/utils/merra2_to_ufs_cubesphere.py .
cp ${cdir}/merra2_to_ufs_cubesphere_restarts.py .

# grab MERRA2 from HPSS
#htar -xvf /NCEPDEV/emc-naqfc/5year/Barry.Baker/MERRA2_INST_3D_AERO/MERRA2_400.inst_3d_aero_Nv.${yyyy}.nc4 MERRA2_400.inst3_3d_aer_Nv.${yyyymmdd}.nc4

# If you are using your own file for a different day than is archived please replace the path to the file here
MERRA2_PATH='../MERRA2_400.inst3_3d_aer_Nv.${yyyymmdd}.nc4'
	    
# Modify the GFS files for UFS-Aersols with MERRA2 ICs
for i in {1..6}; do 
    ./merra2_to_ufs_cubesphere_restarts.py -m ../MERRA2_400.inst3_3d_aer_Nv.${yyyymmdd}.nc4 -c fv_core.res.nc -t fv_tracer.res.tile${i}.nc -r C384 -cyc 1
#    ./merra2_to_ufs_cubesphere_restarts.py -m MERRA2_400.inst3_3d_aer_Nv.${yyyymmdd}.nc4 -c gfs_ctrl.nc -t gfs_data.tile${i}.nc -r C384 
done

rm *.old
rm *.py	    
# go back to base directory 
popd
