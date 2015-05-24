# Run-Analysis for Human Activity Recognition Using Smartphones Data Set
# Version 1.0

Run-Analysis is the R-script for obtaining data set from Human Activity Recognition Using 
Smartphones project. Wrote by Alexey Stupnev for Coursera Getting and Cleaning Data Course Project.

The script includes followed features :
* merges the training and the test data sets to create opne data set
* extract the mean and standard deviation for each measurement
* change a code number for activity to the descriptive activity names
* change labels to a descriptive variable names
* generate a tidy data set including  average of each variable for each activity and each subject

The Run-Analysis package included followed files:
* 'ReadMe.md'
* 'run_analysis.R' : code for R-language IDE
* 'CodeBook.md' : code book including description of variables

The source data set located on this URL
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

1. Download zip-file
2. Unzip the the "UCI HAR Dataset" folder
3. Copy this in the work directory. 
4. Run the script through IDE.

Result data set will be located in work directory and will be named 'dataset.txt'