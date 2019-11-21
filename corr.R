corr <- function(directory, threshold = 0) {
  
  #first, for each file in the directory
  #compute the number of complete cases
  
  allcomplete<-complete(directory)
  
  #extract those monitors with complete data > threshold
  
  above_threshold <-subset(allcomplete,nobs>threshold)
  
  # initialise a vector that will contain the required correlation information
  corrvec <- numeric(0)
  
  if(nrow(above_threshold) > 0){
      
      for (monitor in above_threshold$id){

        #get the filename
        
        #monitor_num <- above_threshold$id[i]
        
        datapath <- paste(getwd(),"/",directory,"/",sprintf("%03d", monitor), ".csv", sep = "")
        
        monitor_data <- read.csv(datapath)
        #get all the data values from sulfate column which are not NAs
        tmp_data <- monitor_data[(!is.na(monitor_data$sulfate)), ]
        
        #then from this data set extract rows where nitrate data is not NA
        tmp_data <- tmp_data[(!is.na(tmp_data$nitrate)), ]
        
        #extrcat sulfate and nitrate data then perform correlation
        sulfate_data <- tmp_data["sulfate"]
        nitrate_data <- tmp_data["nitrate"]
        corrvec <- c(corrvec, cor(sulfate_data, nitrate_data))
        
      }
    
      
  }
  
   
  corrvec 
}