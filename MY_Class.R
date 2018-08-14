library(RNetCDF)
library(ggplot2)
fid_DA <-open.nc("2041_vars_ts_reamped.nc")
dat_DA <-read.nc(fid_DA)

var_names <- names(dat_DA)
T_2M = dat_DA$T_2M
#https://www.rapidtables.com/web/color/RGB_Color.html
hist(T_2M[1,], col=rgb(1,0,0,.5),xlim=c(270,320),ylim=c(0,490),breaks = 20,  main="Temperature", xlab="T_2M",alpha=.5)
hist(T_2M[2,], col=rgb(0,0,1,0.5),xlim=c(270,320), breaks = 20,  add=T,alpha=.5)
hist(T_2M[3,], col=rgb(255/255,128/255,0,0.5),xlim=c(270,320), breaks = 20,  add=T,alpha=.5)
hist(T_2M[4,], col=rgb(1,0,1,0.5),xlim=c(270,320), breaks = 20,  add=T,alpha=.5)
leg <- c("Cairo","Alexandria","El_Gouna","Aswan")
legend(270, 400, legend=leg, fill=c(rgb(1,0,0,.5),rgb(0,0,1,0.5),rgb(255/255,128/255,0,0.5),rgb(1,0,1,0.5)))
box()