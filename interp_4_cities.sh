#!/bin/bash
set -ex 
year_start=2070
year_end=2090
for ((y=$year_start; y<=$year_end; y++)) ;
do

cdo remapdis,mygrid ${y}_vars_ts.nc ${y}_vars_ts_cities.nc
cdo remapdis,mygrid ${y}_TP_ts.nc ${y}_TP_ts_cities.nc
done
