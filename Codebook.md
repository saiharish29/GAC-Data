##CodeBook for the tidy dataset

##Data source
This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which was originally made avaiable here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Feature Selection
Refer the README and features.txt files in the original dataset to learn more about the feature selection for this dataset. 

##Description:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

The assignment explicitly states "Extracts only the measurements on the mean and standard deviation for each measurement." To be complete. 
Hence, I have included all variables having to do with mean or standard deviation.

The set of variables that were estimated (and kept for this assignment) from these signals are:

mean(): Mean value
std(): Standard deviation

##The variables used to complete the assignment are as follows:

* path_dataset -> Get repository file path of the dataset
* dataActivityTest -> Read data from the files into the Activity - Test (Test data)
* dataSubjectTest-> Read data from the files into the Subject- Test (Test data)
* dataFeaturesTest -> Read data from the files into the Features-Test (Test data)
* dataActivityTrain -> Read data from the files into the Activity - Train (Training data)
* dataSubjectTrain-> Read data from the files into the Subject- Train  (Training data)
* dataFeaturesTrain-> Read data from the files into the Features-Train  (Training data)
* dataActivity -> will  rbind dataActivityTrain and dataActivityTest
* dataSubject <- will rbind dataSubjectTrain and dataSubjectTest
* dataFeatures <- will rbind dataFeaturesTrain and dataFeaturesTest
* dataFeaturesNames  -> will retrieve the feature names
* dataCombined  -> will cbind dataSubject and dataActivity
* Data -> will cbind dataFeatures and dataCombined
* subdataFeaturesNames -> will extract only the measurements on the mean and standard deviation
* selectedNames -> is a character variable containing the data that needs to be selected
* Data -> is a dataframe containing the resultant data
* activityLabels -> Read file to get the activityLabels
* currentActivity -> is a numeric and is used only for initialization
* Data2  -> is a dataframe which contains the extracted data on the mean and standard deviation for each measurement







 


