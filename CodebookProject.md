---
title: "CodebookCourseProject.md"
output: documentation
author: "Juan Pablo Mariño Ardila"
date:"25/09/2020"
---

## Libraries Required


```
data.table
```

## Description of the Document

This document is a codebook that provides descriptions of the variables, the process of getting data, cleaning an tidying of the dataset provide by Samsung in the UCI website, and all the transformations the script does to complete the task.

##The Data Source

The Data is provided by the  UCI  Machine Learning Repository, on the section of Human activity Recognition
Using Smart Phones:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
where the data can be downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 and is work of 
 ```
 Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy.
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws
```
##Data Set Description and Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

##The Files 

The dataset includes the following files [which are not on this repo, because they are too heavy, even so these are downloaded from the link provided]:

'README.txt'

'features_info.txt': Shows information about the variables used on the feature vector.

'features.txt': List of all features.

'subject_test':List of the subjects for Test

'subject_train':List of the subjects for Training

'activity_labels.txt': Links the class labels with their activity name.

'train/X_train.txt': Training set.

'train/y_train.txt': Training activity labels.

'test/X_test.txt': Test set.

'test/y_test.txt': Test activity  labels.

##The following files are available for the train and test data. Their descriptions are equivalent.

'train/subject_train.txt': Each row identifies the subject who performed the activity for each sample, there are 30 subjects.

'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

##Process of Cleaning and  tidyng the data by "CourseProject.R"

1.First of all the "CourseProject.R" directory has to be on the same carpet as the Result file of 
the extracted data. 
2. Merges the training and the test sets to create one data set.
Source code "CourseProject.R" loads both test and train data, processes them as tables with the 
function fread, for fast reading of the numeric elements, and the Read.csv for the character elements, and merges the results into one dataset called "Data.TeTr" on the enviroment, and it couldbe finished as "DSub_Act" dataframe as the merge of the trained and test data sets.

2. Extracts only the measurements on the mean and standard deviation for each measurement.
Source code "CourseProject.R" extracts the mean and standard deviation features data into one dataset with appropriate column names, with the function grep() to match the correct features.

4. Uses descriptive activity names to name the activities in the data set.
Source code "CourseProject.R" loads the descriptive feature and activity labels, as new labels of every
measurement with abbreviations, turning "Acc"-> in to "Accelerometer", as new label for descriptive analysis.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for the combination of each activity and subject sampled.
Source code "CourseProject.R" calculates the average for all measurement columns grouped by variables Activity and Subject and then writes the output to a local text file named "TidyDF.txt" that could be found on this repository


