# *** Getting and Cleaning Data Course Project ***
# Please read README.md
# Data source URL: "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# The unzipped folder named "UCI HAR Dataset" should be in the working directory for this script
# to work properly.


# 1. Merge the training and the test sets to create one data set.
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
x <- rbind(x_test, x_train)

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
s <- rbind(subject_test, subject_train)

y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
y <- rbind(y_test, y_train)

# 2. Extract only the measurements on the mean and standard deviation for each measurement. 

features <- read.table("UCI HAR Dataset/features.txt")
features_index <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
x_mean_std <- x[, features_index]

# 3. Use descriptive activity names to name the activities in the data set.

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activity <- activity_labels[y[,1], 2]

# 4. Label the data set with descriptive variable names. 

names(s) <- "subject"
names(x_mean_std) <- features[features_index, 2]
names(x_mean_std) <- gsub("\\(|\\)", "", names(x_mean_std))
names(x_mean_std) <- gsub("-", "_", names(x_mean_std))
combined <- cbind(s, activity, x_mean_std)

# 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)
combined$subject <- as.factor(combined$subject)
subject_group <- group_by(combined, subject)
activity_group <- group_by(combined, activity)
avg_by_subject <- summarise_each(subject_group, funs(mean))
avg_by_activity <- summarise_each(activity_group, funs(mean))

write.table(avg_by_subject, file = "avg_sub.txt", row.name = FALSE)
write.table(avg_by_activity, file = "avg_act.txt", row.name = FALSE)

