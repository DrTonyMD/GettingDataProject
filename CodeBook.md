Code Book:

Input data:
'features.txt': List of all features.
'activity_labels.txt': Links the class labels with their activity name.
X_train.txt': Training set.
y_train.txt': Training labels.
X_test.txt': Test set.
y_test.txt': Test labels.
'subject_train.txt' and  'test/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

Variables defined:

x_train_data: Main training data
y_train_data: Training labels
subject_train_data: Subject performing each activity in the training set
x_test_data: Main test data
y_test_data: Test labels
subject_test_data: Subject performing each activity in the test set
features: Column names of main data set
all_train: Table of all training data (main data, training labels, and subject information)
all_test: Table of all test data  (main data, training labels, and subject information)
all_data: Table of all training data and all tests data merged by rows
col_names: Column names of the merged data file
mean_SD: Selection of column names that contain the words "mean" or "std"
all_data_subset_mean_SD: Subset of data from all_data that contains column names that include the words "mean" or "std"
all_data_subset_with_names: The subset of data with column names attached
new_data_set: New data set that finds mean by subject and activity ID

