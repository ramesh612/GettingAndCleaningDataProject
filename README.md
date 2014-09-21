GettingAndCleaningDataProject
=============================

Course Project for Coursera Getting And Cleaning Data module getdata-007

Requirements
============

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Steps
=====

1. Download and unzip data. ```UCI HAR Dataset``` directory is created.
2. Put ```run_analysis.R``` in the parent directory of ```UCI HAR Dataset```
3. Set that as your working directory using ```setwd()``` function in RStudio.
4. Run ```source("run_analysis.R")```
5. This generates a new file ```tidy_data.txt```

Dependencies
============

```run_analysis.R``` requires ```plyr```
