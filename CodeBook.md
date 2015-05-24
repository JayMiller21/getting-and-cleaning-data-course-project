# Getting and Cleaning Data Course Project
#### May 24, 2015
#### Prepared by Jennifer Miller 

### Summary

The data set contains 180 records and 2 independent and 46 dependent variables.

For each subject and activityName, average measurement statistics are provided.


### Data Source

The original data used to create this data set can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The data's original source is here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


### Dependent Variables

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean


### Data Transformations

The following transformations were made in R to the original data set:

* Apply Headers to Data Frames
* Filter All Measurements Other Than Mean and Std from X_test.txt and X_train.txt
* Add Index Column to Data Frames
* Apply Descriptive Activity Names to y_test.txt and y_train.txt based on activity_labels.txt
* Assemble Full Test Data Frame from subject_test.txt, y_test.txt, and X_test.txt
* Assemble Full Train Data Frame from subject_train.txt, y_train.txt, and X_train.txt
* Assemble Full Data Frame from Test and Train Data Frames
* Assemble Independent Data Frame with the average of each variable for each activity and each subject
* Export "Averages" Data Frame to space separated Text File, course-project-tidy-data-set.txt

For full execution, see run_analysis.R, which was used to perform all transformations.

