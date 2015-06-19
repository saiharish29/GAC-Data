#Step 1 -> Get repository file path of the dataset

path_dataset <- file.path("./data", "UCI HAR Dataset")
files <- list.files(path_dataset, recursive=TRUE)
files


#Step 2 -> Read data from the files into the Activity, Subject and Features variables
#2.a Activity variables -> dataActivityTest and dataActivityTrain

dataActivityTest <- read.table(file.path(path_dataset, "test", "Y_test.txt"), header=FALSE)
dataActivityTrain <- read.table(file.path(path_dataset, "train", "Y_train.txt"), header=FALSE)


#2.b Subject variables -> dataSubjectTest and dataSubjectTrain

dataSubjectTest <- read.table(file.path(path_dataset, "test", "subject_test.txt"), header=FALSE)
dataSubjectTrain <- read.table(file.path(path_dataset, "train", "subject_train.txt"), header=FALSE)

#2.c Feature variables -> dataFeaturesTest and dataFeaturesTrain

dataFeaturesTest <- read.table(file.path(path_dataset, "test", "X_test.txt"), header=FALSE)
dataFeaturesTrain <- read.table(file.path(path_dataset, "train", "X_train.txt"), header=FALSE)


#Step 3 -> Look at the properties of the above variables
#Use summary or str

str(dataActivityTest)
str(dataActivityTrain)
str(dataSubjectTest)
str(dataSubjectTrain)
str(dataFeaturesTest)
str(dataFeaturesTrain)

#Step 4 -> Merge the training and test data set to create one single dataset
#dataActivity, dataSubject and dataFeatures

dataActivity <- rbind(dataActivityTrain, dataActivityTest)
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataFeatures <- rbind(dataFeaturesTrain, dataFeaturesTest)


#Step 5 -> Set names to the variables used

names(dataActivity) <- c("activity")
names(dataSubject) <- c("subject")
dataFeaturesNames <- read.table(file.path(path_dataset, "features.txt"), head=FALSE, as.is=T, col.names=c("MeasureID", "MeasureName"))
names(dataFeatures) <- dataFeaturesNames$MeasureName



#Step 6 -> Merge columns to get the data frame Data for all of the merged data
dataCombined <- cbind(dataSubject, dataActivity)
Data <- cbind(dataFeatures, dataCombined)


#Step 7 -> Extract only the measurements on the mean and standard deviation for each measurement

subdataFeaturesNames <- dataFeaturesNames$MeasureName[grep(".*mean\\(\\)|.*std\\(\\)", dataFeaturesNames$MeasureName)]


#Step 8 -> Subset the data frame Data by selected names of Features

selectedNames <- c(as.character(subdataFeaturesNames), "subject", "activity")

Data <- subset(Data, select=selectedNames)


#Step 9 -> Again verify the data by using summary or str

str(Data)


#Step 10 -> Use descriptive activity names to name the activities in the data set. 
#Verify the activity values in the dataset

#10.a -> Read file to get the activityLabels
activityLabels <- read.table(file.path(path_dataset, "activity_labels.txt"), header=FALSE)

#10.b -> Recursively replace the Data$activity with activityLabels
#Using For Loop

currentActivity=1
for(currentActivityLabel in activityLabels$V2){
Data$activity <- gsub(currentActivity, currentActivityLabel, Data$activity)
currentActivity <- currentActivity + 1
}

#10.c -> Verify if Data$activity has the values mapped
head(Data$activity,30) 


#Step 11 -> Label data with descriptive variable names and verify

names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

names(Data)

#Step 12 -> Create a second independent tidy data set and output it 

library(plyr);
# Remove the subject and activity column, since a mean of those has no use
Data2 <- aggregate(. ~subject + activity, Data, mean)
Data2 <- Data2[order(Data2$subject, Data2$activity),]
write.table(Data2, file="tidydata.txt", row.name=FALSE, sep="\t")





