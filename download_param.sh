#!/bin/bash 
set -ex 
var2='T_2M'
var1='RELHUM_2M'
#var3='U_10M'
#var4='V_10M'
var5='ASOB_S'
var6='U'
var7='V'
year_start=2041
year_end=2090
directory='.'
#prefix='Cairo_0.125_RCP45_2005_2090_'
#prefix='Cairo_0.125_Historical_1979_2005_'
prefix='Cairo_0.125_RCP45_2005_2090_'

#dir='./temp2'
#name='Cairo_0.125_historical_1979-2005'
name='Cairo_0.125_RCP45_2005_2090'
sourcedir='/hpss/arch/bb1052/Elham/'
dir_target=${sourcedir}${name}
                                                                                                                                           
#--------------------
for ((y=$year_start; y<=$year_end; y++)) ;
do

    for i in 01 02 03 04 05 06 07 08 09 10 11 12; do
        
        echo prompt >> ftp.txt
        echo cd ${dir_target} >> ftp.txt
        echo lcd ${directory} >> ftp.txt
        echo mget ${prefix}${y}_${i}.tar >> ftp.txt
        echo bye >> ftp.txt
        pftp < ftp.txt 
        rm ftp.txt
        tar -xf ${directory}/${prefix}${y}_${i}.tar ${y}_${i}/out04
        tar -xf ${directory}/${prefix}${y}_${i}.tar ${y}_${i}/out06
        cdo mergetime ${y}_${i}/out04/lffd${y}${i}????.nc ${y}_${i}.nc
        #cdo selname,${var2},${var1},${var3},${var4},${var5}  ${y}_${i}.nc ${y}_${i}_vars.nc
        cdo selname,${var2},${var1},${var5}  ${y}_${i}.nc ${y}_${i}_vars.nc 
        cdo mergetime ${y}_${i}/out06/lffd${y}${i}????p.nc ${y}_${i}_winds.nc
        cdo selname,${var6},${var7}  ${y}_${i}_winds.nc ${y}_${i}_wind.nc
        rm ${y}_${i}.nc
        rm ${y}_${i}_winds.nc
    done 
    
    cdo mergetime ${y}_??_vars.nc   ${y}_vars_ts.nc
    cdo mergetime ${y}_??_wind.nc ${y}_winds_ts.nc
   
#    ncatted -h -a coordinates,$var,c,c,"rlat rlon" ${y}_${var2}_ts.nc
#    ncks -A -v rlat,rlon ${directory}/2084_01/out04/lffd2084010100c.nc ${y}_${var2}_ts.nc
    rm -rf ${y}_??
    rm -f *tar
    rm -f ${y}_*_vars.nc   
    rm -f ${y}_*_winds.nc
    
#    scp ${y}_vars_ts.nc fallah@calc02.met.fu-berlin.de:/daten/cady/Cairo_RCP45 
#    scp ${y}_TP_ts.nc fallah@calc02.met.fu-berlin.de:/daten/cady/Cairo_RCP45
    echo 'year'${y}'finished!'
done
