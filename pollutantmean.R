pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  #############################################################
  ##Author: Kunal Shankar
  ##Version: 0.1
  ##History Initial version
  #############################################################
  
  # Set initial dataset to null
  data_pollutant <- NULL

  #Get the list of files from specified directory
  files_full <- list.files(directory, full.names = TRUE)
  
  #Loop through the file list passed as parameter and store it in the dataset
  for (i in id) {
    data_pollutant <- rbind(data_pollutant, read.csv(files_full[i], header=TRUE))
  }
  
  #Calculate mean after removing NA values
  mean_pollutant <- mean(data_pollutant[[pollutant]], na.rm=TRUE)
  
  #Return Mean
  mean_pollutant

}
