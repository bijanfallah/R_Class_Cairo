#
#Program 
#
#------------------ libraries --------------------------
library(RNetCDF)
library(ggplot2)
#-------------------------------------------------------
cities <- c("Cairo", "Alexandria", "El Gouna", "Aswan")
#------------------- Variables -------------------------
dir<-'/daten/cady/Cairo_RCP85/'
file1 <- paste0(dir,"1985_2005/T_2M_1985_2004.nc_daymax_JJA.nc")
file2 <- paste0(dir,"2041_2060/T_2M_2041_2060.nc_daymax_JJA.nc")
file3 <- paste0(dir,"2060_2089/T_2M_2070_2089.nc_daymax_JJA.nc")
        
# ------------------------------------------------------

hist_clim <- function(file1, file2, file3,filename, title_plot='Summer Day MAX',xlim=c(0,50),max_y = 330){
        pdf(file=filename,width=6.5,height=5)
        brks = 30
        op <- par(mfrow = c(2,2),
                  oma = c(4,4,0,0) + 0.1,
                  mar = c(1,1,1,1) + 0.5)
        legs <- c('1985-2004','2041-2060 ','2070-2089')
        
        fid_file1<-open.nc(file1)
        data1 <-read.nc(fid_file1)
        fid_file2<-open.nc(file2)
        data2 <-read.nc(fid_file2)
        fid_file3<-open.nc(file3)
        data3 <-read.nc(fid_file3)
        var_name <- names(data1)[5]
        vars1 <-  data1[[var_name]] -273.15
        vars2 <-  data2[[var_name]] -273.15 
        vars3 <-  data3[[var_name]] -273.15
        print(dim(vars1))
        hist(vars1[1,], col=rgb(1,0,0,.5),xlim=xlim ,ylim=c(0,max_y),breaks = brks,  main="Cairo", xlab=var_name)
        hist(vars2[1,], col=rgb(0,1,0,0.5),xlim=xlim , breaks = brks,  add=T)
        hist(vars3[1,], col=rgb(0,0,1,0.5),xlim=xlim , breaks = brks,  add=T)
        
        
        
        hist(vars1[2,], col=rgb(1,0,0,.5),xlim=xlim ,ylim=c(0,max_y),breaks = brks,  main="Alexandria", xlab=var_name)
        hist(vars2[2,], col=rgb(0,1,0,0.5),xlim=xlim , breaks = brks,  add=T)
        hist(vars3[2,], col=rgb(0,0,1,0.5),xlim=xlim , breaks = brks,  add=T)
        
        hist(vars1[3,], col=rgb(1,0,0,.5),xlim=xlim ,ylim=c(0,max_y),breaks = brks,  main="El Gouna", xlab=var_name)
        hist(vars2[3,], col=rgb(0,1,0,0.5),xlim=xlim , breaks = brks,  add=T)
        hist(vars3[3,], col=rgb(0,0,1,0.5),xlim=xlim , breaks = brks,  add=T)
        
        
        hist(vars1[4,], col=rgb(1,0,0,.5),xlim=xlim ,ylim=c(0,max_y),breaks = brks,  main="Aswan", xlab=var_name)
        hist(vars2[4,], col=rgb(0,1,0,0.5),xlim=xlim , breaks = brks,  add=T)
        hist(vars3[4,], col=rgb(0,0,1,0.5),xlim=xlim , breaks = brks,  add=T)
       
        par(op)
        par(fig = c(0, 1, 0, 1), oma = c(0, 0, 0, 0), mar = c(0, 0, 0, 0), new = TRUE)
        plot(0, 0, type = "n", bty = "n", xaxt = "n", yaxt = "n")
        
        legend("bottom", legend=legs, fill=c(rgb(1,0,0,.5),rgb(0,1,0,0.5),rgb(0,0,1,0.5)),cex=1.,box.lwd = 0,xpd = TRUE, horiz = TRUE, 
               inset = c(0,0), bty = "n", col = 1:2, title = title_plot)
        #title(title_plot, line=-0.9)
      
        dev.off()
        
        
        
}

# ---------------- Calculations -------------------------------------

dir<-'/daten/cady/Cairo_RCP85/'
file1 <- paste0(dir,"1985_2005/T_2M_1985_2004.nc_daymax_JJA.nc")
file2 <- paste0(dir,"2041_2060/T_2M_2041_2060.nc_daymax_JJA.nc")
file3 <- paste0(dir,"2060_2089/T_2M_2070_2089.nc_daymax_JJA.nc")
hist_clim(file1, file2, file3,'JJA_daymax_hist.pdf', title_plot='Summer Day T_2M MAX',xlim=c(20,55),max_y = 330)

dir<-'/daten/cady/Cairo_RCP85/'
file1 <- paste0(dir,"1985_2005/T_2M_1985_2004.nc_daymin_JJA.nc")
file2 <- paste0(dir,"2041_2060/T_2M_2041_2060.nc_daymin_JJA.nc")
file3 <- paste0(dir,"2060_2089/T_2M_2070_2089.nc_daymin_JJA.nc")
hist_clim(file1, file2, file3,'JJA_daymin_hist.pdf', title_plot='Summer Day T_2M MIN',xlim=c(15,40),max_y = 330)

dir<-'/daten/cady/Cairo_RCP85/'
file1 <- paste0(dir,"1985_2005/T_2M_1985_2004.nc_daymax_DJF.nc")
file2 <- paste0(dir,"2041_2060/T_2M_2041_2060.nc_daymax_DJF.nc")
file3 <- paste0(dir,"2060_2089/T_2M_2070_2089.nc_daymax_DJF.nc")
hist_clim(file1, file2, file3,'DJF_daymax_hist.pdf', title_plot='Winter Day T_2M MAX',xlim=c(5,35),max_y = 330)

dir<-'/daten/cady/Cairo_RCP85/'
file1 <- paste0(dir,"1985_2005/T_2M_1985_2004.nc_daymin_DJF.nc")
file2 <- paste0(dir,"2041_2060/T_2M_2041_2060.nc_daymin_DJF.nc")
file3 <- paste0(dir,"2060_2089/T_2M_2070_2089.nc_daymin_DJF.nc")
hist_clim(file1, file2, file3,'DJF_daymin_hist.pdf', title_plot='Winter Day T_2M MIN',xlim=c(0,25),max_y = 330)

trends_clim <- function(file1, file2, file3,filename, title_plot='Cairo Trends Summer Day MAX',ylim=c(5,11), city=1){
        pdf(file=filename,width=6.5,height=5)
        op <- par(mfrow = c(3,1),
                  oma = c(4,4,0,0) + 0.1,
                  mar = c(1,1,1,1) + 0.1)
        
       # par(oma = c(4, 1, 1, 1))
        legs <- c('1985-2004','2041-2060 ','2070-2089')
        
        fid_file1<-open.nc(file1)
        data1 <-read.nc(fid_file1)
        fid_file2<-open.nc(file2)
        data2 <-read.nc(fid_file2)
        fid_file3<-open.nc(file3)
        data3 <-read.nc(fid_file3)
        var_name <- names(data1)[5]
        vars1 <-  data1[[var_name]] -273.15
        vars2 <-  data2[[var_name]] -273.15 
        vars3 <-  data3[[var_name]] -273.15
        time <- seq(from = 1, to = 20, by = 1)
        plot(vars1[city,], col=rgb(1,0,0,.5), ylab=var_name,  xaxt='n', ylim=ylim)
        abline(lm(  vars1[city,] ~ time), col=rgb(1,0,0,.5)) 
        trnd <- lm(  vars1[city,] ~ time)
        text(10,ylim[2]-1, paste0('trend = ',round(trnd$coefficients[2],digits = 2)))
        plot(vars2[city,], col=rgb(0,1,0,0.5), ylab=var_name,  xaxt='n',  add=F, ylim=ylim)
        trnd <- lm(  vars2[city,] ~ time)
        text(10,ylim[2]-1, paste0('trend = ',round(trnd$coefficients[2],digits = 2)))
        #summary(trnd)
        abline(lm(  vars2[city,] ~ time), col=rgb(0,1,0,0.5)) 
        plot(vars3[city,], col=rgb(0,0,1,0.5), ylab=var_name, xlab='',  add=F, ylim=ylim)
        abline(lm(  vars3[city,] ~ time),col = rgb(0,0,1,0.5)) 
        trnd <- lm(  vars3[city,] ~ time)
        text(10,ylim[2]-1, paste0('trend = ',round(trnd$coefficients[2],digits = 2)))
        title(xlab = "",
              ylab = var_name,
              outer = TRUE, line = 3)
        par(op)
        
        par(fig = c(0, 1, 0, 1), oma = c(0, 0, 0, 0), mar = c(0, 0, 0, 0), new = TRUE)
        
        plot(0, 0, type = "n", bty = "n", xaxt = "n", yaxt = "n")
        title(title_plot, line=-0.7)
        legend("bottom", legend=legs, fill=c(rgb(1,0,0,.5),rgb(0,1,0,0.5),rgb(0,0,1,0.5)),cex=1.1,box.lwd = 0,xpd = TRUE, horiz = TRUE, 
               inset = c(0,0), bty = "n", col = 1:2)
        
        dev.off()
  
}
dir<-'/daten/cady/Cairo_RCP85/'
file1 <- paste0(dir,"1985_2005/T_2M_1985_2004.nc_daymin_DJF_yearmean.nc")
file2 <- paste0(dir,"2041_2060/T_2M_2041_2060.nc_daymin_DJF_yearmean.nc")
file3 <- paste0(dir,"2060_2089/T_2M_2070_2089.nc_daymin_DJF_yearmean.nc")
trends_clim(file1, file2, file3,'Trends_DJF_daymin.pdf', title_plot='Trends Winter Day MIN', ylim=c(6,13))


file1 <- paste0(dir,"1985_2005/T_2M_1985_2004.nc_daymin_JJA_yearmean.nc")
file2 <- paste0(dir,"2041_2060/T_2M_2041_2060.nc_daymin_JJA_yearmean.nc")
file3 <- paste0(dir,"2060_2089/T_2M_2070_2089.nc_daymin_JJA_yearmean.nc")
trends_clim(file1, file2, file3,'Trends_JJA_daymin.pdf', title_plot='Trends Summer Day MIN', ylim=c(20,30))


file1 <- paste0(dir,"1985_2005/T_2M_1985_2004.nc_daymax_JJA_yearmean.nc")
file2 <- paste0(dir,"2041_2060/T_2M_2041_2060.nc_daymax_JJA_yearmean.nc")
file3 <- paste0(dir,"2060_2089/T_2M_2070_2089.nc_daymax_JJA_yearmean.nc")
trends_clim(file1, file2, file3,'Trends_JJA_daymax.pdf', title_plot='Trends Summer Day MAX', ylim=c(35,50))


file1 <- paste0(dir,"1985_2005/T_2M_1985_2004.nc_daymax_DJF_yearmean.nc")
file2 <- paste0(dir,"2041_2060/T_2M_2041_2060.nc_daymax_DJF_yearmean.nc")
file3 <- paste0(dir,"2060_2089/T_2M_2070_2089.nc_daymax_DJF_yearmean.nc")
trends_clim(file1, file2, file3,'Trends_DJF_daymax.pdf', title_plot='Trends Winter Day MAX', ylim=c(10,30))


file1 <- paste0(dir,"1985_2005/T_2M_1985_2004.nc_yearmean.nc")
file2 <- paste0(dir,"2041_2060/T_2M_2041_2060.nc_yearmean.nc")
file3 <- paste0(dir,"2060_2089/T_2M_2070_2089.nc_yearmean.nc")
trends_clim(file1, file2, file3,'Trends_yearmean.pdf', title_plot='Trends Day Mean', ylim=c(10,30))


file1 <- paste0(dir,"1985_2005/T_2M_1985_2004.nc_yearmean.nc")
dir2 <- '/daten/cady/Cairo_RCP45/'
file2 <- paste0(dir2,"2041_2060/T_2M_2041_2060.nc_yearmean.nc")
file3 <- paste0(dir2,"2060_2090/T_2M_2070_2089.nc_yearmean.nc")
trends_clim(file1, file2, file3,paste0(cities[1],'_Trends_yearmean_RCP45.pdf'), title_plot='Trends Day Mean', ylim=c(10,30), city=1)
trends_clim(file1, file2, file3,paste0(cities[2],'_Trends_yearmean_RCP45.pdf'), title_plot='Trends Day Mean', ylim=c(10,30), city=2)
trends_clim(file1, file2, file3,paste0(cities[3],'_Trends_yearmean_RCP45.pdf'), title_plot='Trends Day Mean', ylim=c(10,30), city=3)
trends_clim(file1, file2, file3,paste0(cities[4],'_Trends_yearmean_RCP45.pdf'), title_plot='Trends Day Mean', ylim=c(10,30), city=4)


# -------------- bar plot ---- No. Summer days ---------------------------------------


file1 <- paste0(dir,"1985_2005/T_2M_1985_2004.nc_eca_su.nc")
dir2 <- '/daten/cady/Cairo_RCP45/'
file2 <- paste0(dir2,"2041_2060/T_2M_2041_2060.nc_eca_su.nc")
file3 <- paste0(dir2,"2060_2090/T_2M_2070_2089.nc_eca_su.nc")

summer_days <- function(file1, file2, file3,filename=paste0('Summer_days_RCP45.pdf'),title_plot= 'No. Summer days (T_Max>25°)'){
        pdf(file=filename,width=6.5,height=5)
        op <- par(mfrow = c(3,1),
                  oma = c(4,4,0,0) + 0.1,
                  mar = c(1,1,1,1) + 0.1)
        fid_file1<-open.nc(file1)
        data1 <-read.nc(fid_file1)
        fid_file2<-open.nc(file2)
        data2 <-read.nc(fid_file2)
        fid_file3<-open.nc(file3)
        data3 <-read.nc(fid_file3)
        name = c('1985-2004','2041-2060 ','2070-2089')
        legs <- c('1985-2004','2041-2060 ','2070-2089')
        my_bar=barplot(100*(data1[[4]]/7300), border=F ,
                       names.arg=cities , las=1 , ylim=c(0,100) , main="" ,col = rgb(1,0,0,.5))
        text(my_bar, 100*(data1[[4]]/7300)+3 ,
             paste("n = ",round(100*(data1[[4]]/7300),2),"%",sep="") ,cex=1) 
        
        my_bar=barplot(100*(data2[[4]]/7300) , border=F ,
                       names.arg=cities , las=1 , ylim=c(0,100) , main="" ,col = rgb(0,1,0,0.5))
        text(my_bar, 100*(data2[[4]]/7300)+3,
             paste("n = ",round(100*(data2[[4]]/7300),2),"%",sep="") ,cex=1) 
        
        my_bar=barplot(100*(data3[[4]]/7300) , border=F ,
                       names.arg=cities , las=1 , ylim=c(0,100) , main="" ,col = rgb(0,0,1,0.5))
        text(my_bar, 100*(data3[[4]]/7300)+3 ,
             paste("n = ",round(100*(data3[[4]]/7300),2),"%",sep="") ,cex=1) 
        #legend("bottom", legend=name, fill=c(rgb(1,0,0,.5),rgb(0,1,0,0.5),rgb(0,0,1,0.5)),cex=1.1,box.lwd = 0,xpd = TRUE, horiz = TRUE, inset = c(0,0), bty = "n", col = 1:2)
        par(op)
        
        par(fig = c(0, 1, 0, 1), oma = c(0, 0, 0, 0), mar = c(0, 0, 0, 0), new = TRUE)
        
        plot(0, 0, type = "n", bty = "n", xaxt = "n", yaxt = "n")
        title(title_plot, line=-0.7)
        legend("bottom", legend=legs, fill=c(rgb(1,0,0,.5),rgb(0,1,0,0.5),rgb(0,0,1,0.5)),
               cex=1.1,box.lwd = 0,xpd = TRUE, horiz = TRUE, 
               inset = c(0,0), bty = "n", col = 1:2)
        
        dev.off()
}

summer_days(file1, file2, file3,filename=paste0('Summer_days_RCP45.pdf'))

file1 <- paste0(dir,"1985_2005/T_2M_1985_2004.nc_eca_tr.nc")
dir2 <- '/daten/cady/Cairo_RCP45/'
file2 <- paste0(dir2,"2041_2060/T_2M_2041_2060.nc_eca_tr.nc")
file3 <- paste0(dir2,"2060_2090/T_2M_2070_2089.nc_eca_tr.nc")


summer_days(file1, file2, file3,filename=paste0('Tropical_Nights_RCP45.pdf'),title_plot='No. Tropical Nights (T daily min >20°C)')




# RCP 8.5=====================================================================================>
file1 <- paste0(dir,"1985_2005/T_2M_1985_2004.nc_eca_tr.nc")
dir2 <- '/daten/cady/Cairo_RCP85/'
file2 <- paste0(dir2,"2041_2060/T_2M_2041_2060.nc_eca_tr.nc")
file3 <- paste0(dir2,"2060_2089/T_2M_2070_2089.nc_eca_tr.nc")


summer_days(file1, file2, file3,filename=paste0('Tropical_Nights_RCP85.pdf'),title_plot='No. Tropical Nights (T daily min >20°C)')
