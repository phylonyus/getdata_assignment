## downloads and unzips data into current working directory

GetDataDir <- function() {
     url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
     download.file(url, "activitydata.zip")
     unzip("activitydata.zip") 
}