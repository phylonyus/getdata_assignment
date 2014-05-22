## Get/Clean Data Assignment

This repository has R code for doing the course project for the Getting and Cleaning Data course on Coursera.

### GetDataDir.R

This script downloads data from the UCI machine learning repository and unzips the directory into your current working directory.  

The data is from the Human Activity Recognition Using Smartphone Data Set. It contains accelerometer and gyroscope readings. These readings have been extrapolated to many more features. Details on these features can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### run_analysis.R

This script loads in the data downloaded by GetDataDir.R and tidies it up. Tidying up includes:  
- extracting means and standard deviations of different measurements provided by the dataset
- averaging these means and standard deviations for each combination of subject and activity type

These features are prefixed with 't' or 'f' for time or frequency domain measurements. Acceleration and jerk are given for movement in each of the usual Euclidean directions (denoted by suffix X,Y, or Z) and the magnitude given by the Euclidean norm. 