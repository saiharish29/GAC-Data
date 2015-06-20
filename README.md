## Getting and Cleaning Data: Course Project
 
 
## Introduction
------------
This repository contains my work for the course project for the Coursera course "Getting and Cleaning data", part of the Data Science specialization.
What follows first are my notes on the original data.

## About the raw data
 ------------------
 The raw data contains 2 sets of similar data files which correspond to training and test

 The features data are unlabeled and can be found in the x_test.txt. 
 The activity labels are in the y_test.txt file.
 The test subjects are in the subject_test.txt file.
 
 
## About the script and the tidy dataset
-------------------------------------
I have created a script called run_analysis.R which will merge the test and training sets together.
After merging, labels are added and only columns that have to do with mean and standard deviation.

## Pre-requisites for this script:
___________________________

1. The UCI HAR Dataset must be extracted
2. The UCI HAR Dataset must be available within a "data/UCI HAR DataSet" directory 
3. The run_analysis.R file should be saved in the working directory (i.e. above the data directory)
4. Set the working directory path to the run_analysis.R file
5. Package - plyr needs to be installed (Use install.packages("plyr")

After merging testing and training, labels are added and only columns that have to do with mean and standard deviation are kept.
 
Lastly, I created a tidy data set containing the means of all the columns per test subject and per activity.
This tab-delimited dataset can be found in the tidy.txt file.
Lastly, the script will create a tidy data set containing the means of all the columns per test subject and per activity.
This tidy dataset will be written to a tab-delimited file called tidy.txt, which can also be found in this repository.
 
## Approach for Getting the Tidy data
 -------------------------------------

* Step 1 -> Get repository file path of the dataset
* Step 2 -> Read data from the files into the Activity, Subject and Features variables
* Step 3 -> Look at the properties of the above variables
* Step 4 -> Merge the training and test data set to create one single datase
* Step 5 -> Set names to the variables used
* Step 6 -> Merge columns to get the data frame Data for all of the merged data
* Step 7 -> Extract only the measurements on the mean and standard deviation for each measurement
* Step 8 -> Subset the data frame Data by selected names of Features
* Step 9 -> Again verify the data by using summary or str
* Step 10 -> Use descriptive activity names to name the activities in the data set. 
* Step 11 -> Label data with descriptive variable names and verify
* Step 12 -> Create a second independent tidy data set and output the result

The final dataset is a dataframe stored in Data2 variable, which has 180 observations of 68 variables and approximately 101.9 kb in size
The Data2 variable data has been exported to a tab limited txt and saved as tidydata.txt
 
 
 
 
 
About the Code Book
-------------------
 The CodeBook.md file explains the transformations performed and the resulting data and variables.
