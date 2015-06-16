##abd9344@gmail.com

complete <- function(directory, id = 1:332){
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
	files <- list.files(path = directory, full.names = TRUE)
	dat <- data.frame()
	cases <- data.frame()
	nobs <- data.frame();
 	for (i in id){ 
		dat <- (read.csv(files[i],header=TRUE))
		nobs <- sum(complete.cases(dat))
		cases <- rbind(cases, data.frame(i,nobs))
	}
	cases
}
