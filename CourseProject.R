
#---
#  title: "CodebookCourseProject.md"
#output: documentation
#author: "Juan Pablo Mariño Ardila"
#date:"25/09/2020"
#---

#Charging the libraries
library(data.table)
#Loading the thada with the fread and read.csv functions for numeric and character elements
features <- read.csv('./features.txt', header = FALSE, sep = ' ')
features <- as.character(features[,2])

data.train.x <- fread('./train/X_train.txt')
data.train.activity <- fread('./train/y_train.txt', header = FALSE, sep = ' ')
data.train.subject <- fread('./train/subject_train.txt',header = FALSE, sep = ' ')

#merge the tables from the subjects, activities, and data for the training data set
data.train <-  data.frame(data.train.subject, data.train.activity, data.train.x)
#adding the features and names for the Training dataframe 
names(data.train) <- c(c('subject', 'activity'), features)

data.test.x <- read.table('./test/X_test.txt')
data.test.activity <- fread('./test/y_test.txt', header = FALSE, sep = ' ')
data.test.subject <- fread('./test/subject_test.txt', header = FALSE, sep = ' ')

#merge the tables from the subjects, activities, and data for the test data set
data.test <-  data.frame(data.test.subject, data.test.activity, data.test.x)
#adding the features and names for the Test dataframe 
names(data.test) <- c(c('subject', 'activity'), features)
##Merge the two data frames of Test and Training into one data frame
data.TeTr<-rbind(data.train,data.test)

##Select the mean and standard deviation of os every measurement
m_stMeasure<-grep("mean|std",features)

#adding those selections into the new data frame DSub_activites for measurements, subjects and activities;
DSub_Act<-data.TeTr[,c(1,2,m_stMeasure+2)]

##Load the names or labels for the activities 
activities<-read.csv("./activity_labels.txt",header = F)
activities<-as.character(activities[2])

#add the names of every activity to the dataframe of subject and measurement
DSub_Act$activity<-activities[DSub_Act$activity]
##Re name the abbreviations turning into descriptive variables 
newlabel <- names(DSub_Act)
newlabel <- gsub("[(][)]", "", newlabel)
newlabel <- gsub("^t", "Time_", newlabel)
newlabel <- gsub("^f", "Frequency_", newlabel)
newlabel <- gsub("Acc", "Accelerometer", newlabel)
newlabel <- gsub("Gyro", "Gyroscope", newlabel)
newlabel <- gsub("Mag", "Magnitude", newlabel)
newlabel <- gsub("-mean-", "_Mean_", newlabel)
newlabel <- gsub("-std-", "_StandardDeviation_", newlabel)
newlabel <- gsub("-", "_", newlabel)
names(DSub_Act) <- newlabel
##Merge the data into the new data frame with the average of each variable for each activity and each subject.
TidyDF <- aggregate(DSub_Act[,3:81], by = list(activity = DSub_Act$activity, subject = DSub_Act$subject),FUN = mean)
write.table(x = TidyDF, file = "TidyData.txt", row.names = FALSE)