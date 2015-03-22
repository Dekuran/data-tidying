library(plyr)

## dowload dataset and put in directory

UCIdir<-if!exists("./UCI HAR Dataset")create.dir("./UCI HAR Dataset")
setwd(UCIdir)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",UCIdir)

# Step 1
# Merge the training and test sets to create one data set


x_tr <- read.table("train/X_train.txt")
y_tr <- read.table("train/y_train.txt")
subject_tr <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# create combined 'x' dataset
x.dat <- rbind(x_tr, x_test)

# create combined 'y' dataset
y.dat <- rbind(y_tr, y_test)

# create combined 'subject' data set
subject.dat <- rbind(subject_tr, subject_test)

# Step 2
# Extract only the measurements on the mean and standard deviation for each measurement


features <- read.table("features.txt")

# grep  columns with mean() or std() in their names
mean_and_std <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
x.dat <- x.dat[, mean_and_std]

# correct the column names
names(x.dat) <- features[mean_and_std, 2]

# Step 3
# Use descriptive activity names to name the activities in the data set


activities <- read.table("activity_labels.txt")

# update values with correct activity names
y.dat[, 1] <- activities[y.dat[, 1], 2]

# correct column name
names(y.dat) <- "activity"

# Step 4
# Appropriately label the data set with descriptive variable names


# correct column name
names(subject.dat) <- "subject"

# bind all the data in a single data set
all_data <- cbind(x.dat, y.dat, subject.dat)

# Step 5
# Create a second, independent tidy data set with the average of each variable for each activity and each subject


# get means for numeric columns (i.e. not last two)
averages.dat <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averages.dat, "tidydata.txt", row.name=FALSE)
