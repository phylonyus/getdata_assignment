##uses data directory downloaded by GetDataDir to
##generate a tidy dataset

tidydata <- function() {
## load in packages
library(plyr)
#======================================================
##This block loads in data w/ feature labels
     
## get feature vector
features <- read.table("UCI HAR Dataset/features.txt", header=F)
## read in training set data
fullData <- read.table("UCI HAR Dataset/train/X_train.txt", 
                    header=F, col.names=features[,2])
## read in test set data
tempData <- read.table("UCI HAR Dataset/test/X_test.txt", 
                    header=F, col.names=features[,2])
## combine training and test data
fullData <- rbind(fullData, tempData)

## extract mean and std of time series measurements
reducedData <- fullData[,grep(".*mean|.*std",names(fullData))]


#======================================================
## This block loads in subject and activity labels
     
## read in training set subject labels
subject <- read.table("UCI HAR Dataset/train/subject_train.txt", 
                    header=F, col.names="subject")
## read in test set subject labels
tempsubject <- read.table("UCI HAR Dataset/test/subject_test.txt", 
                    header=F, col.names="subject")
## combine subject labels
subject <- rbind(subject, tempsubject)
subject <- factor(subject[,])
## read in training set activity labels
activity <- read.table("UCI HAR Dataset/train/y_train.txt", 
                    header=F, col.names="activity")
## read in test set activity labels
tempactivity <- read.table("UCI HAR Dataset/test/y_test.txt", 
                    header=F, col.names="activity")
## combine activity labels
activity <- rbind(activity, tempactivity)

activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt",
                    header=F)
activity <- factor(activity[,], labels=activityLabels[,2])

#=========================================================
## append subject and activity labels
reducedData <- cbind(reducedData, subject, activity)

## get averages of measurements for each subject/activity combination
averages <- ddply(reducedData, .(activity, subject), numcolwise(mean))

return(averages)
}