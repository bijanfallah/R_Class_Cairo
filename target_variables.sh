#!/bin/bash
set -ex
# A program to create different statistics for the class in El Gouna
# Written by Bijan Fallah


#dir='2041_2060/'
#file='T_2M_2041_2060.nc'
dir='2041_2060/'
file='T_2M_2041_2060.nc'

# yearly mean T_2M
cdo yearmean -daymean ${dir}${file} ${dir}${file}_yearmean.nc


# daily mean T_2M

cdo daymean ${dir}${file} ${dir}${file}_daymean.nc

# daily max T_2M
cdo daymax ${dir}${file} ${dir}${file}_daymax.nc

# daily min T_2M
cdo daymin ${dir}${file} ${dir}${file}_daymin.nc

# seasonal daily mean T_2M
cdo splitseas ${dir}${file}_daymean.nc  ${dir}${file}_daymean_


# seasonal daily max T_2M

cdo splitseas ${dir}${file}_daymax.nc  ${dir}${file}_daymax_

# seasonal daily min T_2M
cdo splitseas ${dir}${file}_daymin.nc  ${dir}${file}_daymin_

# Very warm days percent w.r.t. 90th percentile of reference period eca_tx90p
cdo daypctl,90 ${dir}${file}_daymax.nc -daymin ${dir}${file} -daymax ${dir}${file} ${dir}${file}_tn90.nc
cdo eca_tx90p ${dir}${file}_daymax.nc ${dir}${file}_tn90.nc ${dir}${file}_eca_tx90p.nc

# Very cold days percent w.r.t. 10th percentile of reference period eca tx10p
cdo daypctl,10 ${dir}${file} -daymin ${dir}${file} -daymax ${dir}${file} ${dir}${file}_tn10.nc
cdo eca_tx10p ${dir}${file}_daymin.nc ${dir}${file}_tn10.nc ${dir}${file}_eca_tx10p.nc


# Tropical nights index per time period eca_tr

cdo eca_tr ${dir}${file}_daymin.nc ${dir}${file}_eca_tr.nc


# Warm nights percent w.r.t. 90th percentile of reference period eca tn90p

#cdo eca_tn90p  ${dir}${file}_daymin.nc ${dir}${file}_tn90.nc  ${dir}${file}_eca_tn90p.nc

# Cold nights percent w.r.t. 10th percentile of reference period eca tn10p

#cdo eca_tn10p ${dir}${file}_daymax.nc ${dir}${file}_tn10.nc ${dir}${file}_eca_tn10p.nc 

# Warm days percent w.r.t. 90th percentile of reference period eca tg90p

#cdo eca_tg90p ${dir}${file}_daymean.nc ${dir}${file}_tn90.nc ${dir}${file}_eca_tg90p.nc

# Cold days percent w.r.t. 10th percentile of reference period eca_tg10p

#cdo eca_tg10p ${dir}${file}_daymax.nc ${dir}${file}_tn10.nc ${dir}${file}_eca_tg10p.nc 

# Summer days index per time period eca su

cdo eca_su ${dir}${file}_daymax.nc ${dir}${file}_eca_su.nc

