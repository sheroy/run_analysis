library(data.table)

url <- "https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI+HAR+Dataset.zip"
download.file(url, destfile="uciDataset.zip", method="curl")
unzip("uciDataset.zip")

#read data
test_x_file <- "/Users/Thoughtworker/coursera/datasciences/getdata/week3/UCI HAR Dataset/test/X_test.txt"
train_x_file <- "/Users/Thoughtworker/coursera/datasciences/getdata/week3/UCI HAR Dataset/train/X_train.txt"

test_y_file <- "/Users/Thoughtworker/coursera/datasciences/getdata/week3/UCI HAR Dataset/test/y_test.txt"
train_y_file <- "/Users/Thoughtworker/coursera/datasciences/getdata/week3/UCI HAR Dataset/train/y_train.txt"

test_subject_file <- '/Users/Thoughtworker/coursera/datasciences/getdata/week3/UCI HAR Dataset/test/subject_test.txt'
train_subject_file <- '/Users/Thoughtworker/coursera/datasciences/getdata/week3/UCI HAR Dataset/train/subject_train.txt'

test_x <- read.table(test_x_file)
test_y <- read.table(test_y_file)

train_x <- read.table(train_x_file)
train_y <- read.table(train_y_file)

test_subject <- read.table(test_subject_file)
train_subject <- read.table(train_subject_file)
features <- read.table('UCI HAR Dataset/features.txt')

activityLabels <- read.table('UCI HAR Dataset/activity_labels.txt')
meanOrStd <- grep('-mean\\(\\)|-std\\(\\)', features$V2)

#1. Merging the datasets
merged_x <- rbind(test_x, train_x)
merged_subject <- rbind(test_subject, train_subject)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
merged_x <- merged_x[, meanOrStd]
names(merged_x) <- features[meanOrStd, 2]

#3. Use descriptive activity names to name the activities in the data set. 
names(merged_x) <- sub('\\(\\)', '', names(merged_x))

#4. Label the data set with descriptive variable names
activityLabels$V2 <- sub('_', ' ', activityLabels$V2)
activityLabels

#replace the numeric activity values with their text values
merged_y = rbind(test_y, train_y)
merged_y[, 1] <- activityLabels[merged_y[, 1], 2]
names(merged_y) <- c('activity.names')

#5. Independant tidy data set
merged <- cbind(merged_subject, merged_y, merged_x)
setnames(merged, "V1", "subject")
names(merged)

agg <- aggregate(merged, by=list(merged$subject, merged$activity.names), FUN=mean, na.rm=TRUE)
aggregate(merged, by=list(merged$subject, merged$activity.names FUN=mean, na.rm=TRUE))
agg$subject <- NULL 
agg$activity.names <- NULL
setnames(agg, "Group.1", "subject")
setnames(agg, "Group.2", "activity")
agg[c(1:50), c(1:6)]

write.table(agg, file="activity_aggregates.txt", row.names=FALSE)
read.table("activity_aggregates.txt")
