##abd9344@gmail.com

corr <- function(directory, threshold = 0) {
	## 'directory' is a character vector of length 1 indicating
	## the location of the CSV files
 
	## 'threshold' is a numeric vector of length 1 indicating the
	## number of completely observed observations (on all
	## variables) required to compute the correlation between
	## nitrate and sulfate; the default is 0
  
	## Return a numeric vector of correlations

	source("complete.R")
	cases <- complete(directory)
	overThreshold <- cases[cases$nobs > threshold,1]
	totalFiles <- list.files(path = directory, full.names = TRUE)
	correlations <- rep(NA,length(overThreshold))
	
	for (i in overThreshold) {
		dat <- (read.csv(totalFiles[i]))
		cases <- complete.cases(dat)
		sulfateYes <- dat[cases, 2]
		nitrateYes <- dat[cases, 3]
		correlations[i] <- cor(x = sulfateYes, y = nitrateYes)
	}

	correlations <- correlations[complete.cases(correlations)]
	correlations
}
