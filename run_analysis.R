# Step 1
subjectTrain <- read.table(file = "UCI HAR Dataset/train/subject_train.txt")
activityTrain <- read.table(file = "UCI HAR Dataset/train/y_train.txt")
dataTrain <- read.table(file = "UCI HAR Dataset/train/X_train.txt")
trainFrame <- cbind(subjectTrain, activityTrain, dataTrain)

subjectTest <- read.table(file = "UCI HAR Dataset/test/subject_test.txt")
activityTest <- read.table(file = "UCI HAR Dataset/test/y_test.txt")
dataTest <- read.table(file = "UCI HAR Dataset/test/X_test.txt")
testFrame <- cbind(subjectTest, activityTest, dataTest)
setFrame <- rbind(trainFrame, testFrame)
names(setFrame)[1] <- "subject"
names(setFrame)[2] <- "activity"

# Step 2
features <- read.table(file = "UCI HAR Dataset/features.txt")
meanCols <- grep(pattern="-mean()",x=features$V2)
stdCols <- grep(pattern="-std()", x=features$V2)
setCols <- sort(c(meanCols, stdCols)) + 2
setCols <- c(1, 2, setCols)
setFrame <- setFrame[setCols]

# Step 3
labels <- read.table(file = "UCI HAR Dataset/activity_labels.txt")
activity <- setFrame$activity
for (i in seq_along(setFrame$activity)) {
      tmp <- setFrame$activity[i]
      activity[i] <- levels(labels$V2)[tmp]
}
setFrame$activity <- activity

# Step 4
setCols <- setCols[ setCols>2] - 2
factLabs <- features$V2[setCols]
labs <- c("subject", "activity")
for (i in factLabs) {
      labs <- c(labs, i)
}
names(setFrame) <- labs

# Step 5
library(dplyr)
setFinal <- group_by(setFrame, subject, activity)
setFinal <- summarise_each(setFinal, funs(mean))
write.table(setFinal, file="dataset.txt", row.names=FALSE)
