complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  #############################################################
  ##Author: Kunal Shankar
  ##Version: 0.1
  ##History Initial version
  #############################################################

  #Get the list of files from specified directory
  files_full <- list.files(directory, full.names = TRUE)
  
  #Create a data frame to store results
  output <- data.frame()

  
  #Loop through the files storing the complete cases
  for (i in id) { 
    tmp <- read.csv(files_full[i]) # read the data
    nobs <- sum(complete.cases(tmp)) # number of complete cases
    output <- rbind(output,c(i,nobs))
  }
  
  colnames(output) <- c("id","nobs")
  output 
  
}