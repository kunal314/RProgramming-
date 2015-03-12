corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  #############################################################
  ##Author: Kunal Shankar
  ##Version: 0.1
  ##History Initial version
  #############################################################
  
  # Create a list of id with files having threshold greater than specified value
  tot_pollutant <- complete(directory)
  usable_rows <- subset(tot_pollutant, nobs>threshold)$id
 
  #initialize the correlation vector
  cor_pollutant <- numeric()
 
  #create a data frame with values in usable ids
  for (i in usable_rows){
    subset_pollutant <- read.csv(paste(directory, "/",
                        formatC(i, width = 3, flag = "0"),  ".csv", sep = ""))
    cc_pollutant <- subset_pollutant[complete.cases(subset_pollutant),]
   
    #calcualte correlation
    cor_pollutant <- c(cor_pollutant, 
                      cor(cc_pollutant$sulfate,cc_pollutant$nitrate))
 }
 cor_pollutant
 
}