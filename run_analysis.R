# The data set has been downloaded and unzipped 
#    into a folder called "UCI HAR Dataset" under folder "Project"
setwd("~/R/DataVisCourse/Project")
# Read training and test files as tables and place in variables

x_train_data <- read.table("./UCI HAR Dataset/train/x_train.txt")               # Main training data
y_train_data <- read.table("./UCI HAR Dataset/train/y_train.txt")               # Training labels
subject_train_data <- read.table("./UCI HAR Dataset/train/subject_train.txt")   # Subject performing act

x_test_data <- read.table("./UCI HAR Dataset/test/x_test.txt")                  # Main test data
y_test_data <- read.table("./UCI HAR Dataset/test/y_test.txt")                  # Test labels
subject_test_data <- read.table("./UCI HAR Dataset/test/subject_test.txt")      # Subject performing act

# Read in features vector
features <- read.table("./UCI HAR Dataset/features.txt")                        # Column names of main data

# Read in activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")          # Activity labels key

# The "features" variable contains the column names for the main data vector (x), so place the "features" names as column names
# The "activity labels" variable contains the column name for the "y" vectors
colnames(x_test_data) <- features[,2]
colnames(x_train_data) <- features[,2]

colnames(y_test_data) <- colnames(y_train_data) <- "activity_ID"
colnames(subject_test_data) <- colnames(subject_train_data) <- "subject_ID"

colnames(activity_labels) <- c("activity_ID","activity_type")

# Merge data from both main tables into 1
all_train <- cbind(y_train_data, subject_train_data, x_train_data)
all_test <- cbind(y_test_data, subject_test_data, x_test_data)
all_data <- rbind(all_train, all_test)

# Extract mean and SD measurements by finding columns of all_data with "mean.." or "std.." in their name
col_names <- colnames(all_data)
mean_SD <-     (grepl("activity_ID", col_names)|
                    grepl("subject_ID", col_names)|
                    grepl("mean..", col_names)|
                    grepl("std..", col_names)
               )

all_data_subset_mean_SD <- all_data[, mean_SD==T]

# Set descriptive activity names into dataset
all_data_subset_with_names <- merge(all_data_subset_mean_SD, activity_labels, by= "activity_ID", all.x = T)

# Create a tidy dataset with average of each variable for each activity and subject
new_data_set <- aggregate(. ~subject_ID + activity_ID, all_data_subset_with_names, mean)
new_data_set <- new_data_set[order(new_data_set$subject_ID, new_data_set$activity_ID),]
