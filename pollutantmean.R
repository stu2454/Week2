pollutantmean <- function(directory,pollutant,id) {

## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'pollutant' is a character vector of length 1 indicating
## the name of  the pollutant for which we will calcultate the
## mean; either "sulfate" or "nitrate"

## 'id' is an integer vector indicating the monitor ID numbers
## to be used e.g 1:10

## note filenames will be in the form 001.csv through to 332.csv

## Return the mean of the pollutant across all monitors list
## in the 'id' vector (ignoring NA values)
## NOTE: Do not round the result

#first get the working directory and set the data directory. Assume that data directory is within working directory
workdir<-getwd()
datadir <-paste(workdir,"/","specdata",sep ="")

# get the list of all filenames

filelist <-list.files(datadir)

#get subset of all files that you will work on

tobeanalysed <- filelist[id]

# initialise alldata

alldata <- c()

#now loop through files

for(eachfile in tobeanalysed) {
  file2read <- paste(datadir,"/",eachfile,sep="")
  datafile <- read.csv(file2read)
  #extract the column of data that you want analysed
  data2add<-datafile[pollutant]
  #add all non.NA values to a larger data set
  alldata <- c(alldata,data2add[!is.na(data2add)])
}

mean(alldata,na.rm=TRUE)

}