# Getting and Cleaning Data Course Project


### Files included in this repository:

* course-project-tidy-data-set.txt: Tidy data set. 
* project-data directory: Source data for this project.
* CodeBook.md: Describes the variables, the data, and any transformations or work performed to clean up the data.
* run_analysis.R: The code used to perform all transformations on the source data. 


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
