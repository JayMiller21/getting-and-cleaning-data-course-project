library(data.table)
library(dplyr)


# Import Data

subjectTest <- read.table("test/subject_test.txt")
yTest <- read.table("test/y_test.txt")
xTest <- read.table("test/X_test.txt")

subjectTrain <- read.table("train/subject_train.txt")
yTrain <- read.table("train/y_train.txt")
xTrain <- read.table("train/X_train.txt")

activityLabels <- read.table("activity_labels.txt")
features <- read.table("features.txt")


# Apply Headers to Data Frames

colnames(subjectTest) <- c("subject")
colnames(yTest) <- c("activityNo")
colnames(xTest) <- features[,2]

colnames(subjectTrain) <- c("subject")
colnames(yTrain) <- c("activityNo")
colnames(xTrain) <- features[,2]


# Filter All Measurements Other Than Mean and Std from xTest and xTrain

xTestFiltered <- xTest[,grepl("*std()* | *mean()*", colnames(xTest))]

xTrainFiltered <- xTrain[,grepl("*std()* | *mean()*", colnames(xTrain))]


# Add Index Column to Data Frames

subjectTest$index <- 1:nrow(subjectTest)
yTest$index <- 1:nrow(yTest)
xTestFiltered$index <- 1:nrow(xTestFiltered)

subjectTrain$index <- 1:nrow(subjectTrain)
yTrain$index <- 1:nrow(yTrain)
xTrainFiltered$index <- 1:nrow(xTrainFiltered)


# Apply Descriptive Activity Names to yTest and yTrain

colnames(activityLabels) <- c("activityNo","activityName")

yTestNamed <- merge(yTest,activityLabels,all.x=TRUE)
yTestNamed <- yTestNamed[order(yTestNamed$index),]
yTestNamed$activityNo <- NULL

yTrainNamed <- merge(yTrain,activityLabels,all.x=TRUE)
yTrainNamed <- yTrainNamed[order(yTrainNamed$index),]
yTrainNamed$activityNo <- NULL


# Assemble Full Test Data Frame

mergedTest <- merge(subjectTest,merge(yTestNamed,xTestFiltered))
mergedTest$index <- NULL


# Assemble Full Train Data Frame

mergedTrain <- merge(subjectTrain,merge(yTrainNamed,xTrainFiltered))
mergedTrain$index <- NULL


# Assemble Full Data Frame

testAndTrain <- rbind(mergedTest,mergedTrain)


# Assemble Independent Data Frame with the average of each variable for each activity and each subject

averages <- testAndTrain %>% group_by(subject, activityName) %>% summarise_each(funs(mean))


# Export "Averages" Data Frame to Text File

write.table(averages,"course-project-tidy-data-set.txt",sep=" ",row.names=FALSE)
