
library(plyr)

# Step 1 - Merge the test and training datasets
# read data into variables
x_train <- read.table("data/getdata-projectfiles-UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("data/getdata-projectfiles-UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("data/getdata-projectfiles-UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("data/getdata-projectfiles-UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("data/getdata-projectfiles-UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("data/getdata-projectfiles-UCI HAR Dataset/test/subject_test.txt")

# merge x_train and x_test
x_data <- rbind(x_train,x_test)


# merge y_train and y_test
y_data <- rbind(y_train,y_test)

# merge subject_train and subject_test
subject_data <- rbind(subject_train, subject_test)


# Step 2 - extract mean and standard deviation for each measurement

features <- read.table("data/getdata-projectfiles-UCI HAR Dataset/features.txt")

# get columns with mean and std in their names

mean_std <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns

x_data <- x_data[, mean_std]

# fix  columns names

names(x_data) <- features[mean_std, 2]

# Step 3
# Use descriptive activity names to name the activities in the data set

activities <- read.table("data/getdata-projectfiles-UCI HAR Dataset/activity_labels.txt")


# update values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]
names(y_data) <- "activity"
# correct column name

# Step 4
# Appropriately label using descriptive variable names


# change column name
names(subject_data) <- "subject"

# bind all into a single data set
combine_data <- cbind(x_data, y_data, subject_data)


# Step 5
# Create a tidy data set with the average of each variable 
# for each activity and each subject


# don't include last 2 cols  
avg_data <- ddply(combine_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(avg_data, "tidy_data.txt", row.name=FALSE)

