complete <-function(directory, ID=1:332){
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the from:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  #first get the working directory and set the data directory. Assume that data directory is within working directory
  workdir<-getwd()
  datadir <-paste(workdir,"/","specdata",sep ="")
  
  # get the list of all filenames
  
  filelist <-list.files(datadir)
  
  #get subset of all files that you will work on, in this case it will be all files
  #but in future may be a subset
  
  tobeanalysed <- filelist[ID]
  
  # initialise the dataframe
  
  df<-data.frame(id=numeric(), nobs=numeric())
  
  #now loop through files
  
  for(eachfile in tobeanalysed) {
    
    file2read <- paste(datadir,"/",eachfile,sep="")
    datafile <- read.csv(file2read)
    
    #what is the ID from the file
    
    file_id <- datafile[nrow(datafile),"ID"]
    
    #work out complete cases for each datafile
    data_complete <- datafile[complete.cases(datafile),]
    
    #derive the number of complete cases per file
    num_complete <- nrow(data_complete)
    
    #now add data to df
    
    vals2add <- c(file_id,num_complete)
    
    names(vals2add) <- names(df)
    
    df <- rbind(df, as.list(vals2add))
    
  }
  
  df_complete <- df
  
  
}