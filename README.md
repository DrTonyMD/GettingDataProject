This describes the scripts for creating a new data set from original Samsung accelerometer data.

The source file is also self documenting.

First, data is read from the training data set and then the test data set. Each requires combining 3 files containing : (1) a vector of the subject performing each activity measurement; (2) labels describing the condition of each activity measurement; and (3) the raw data.

Additional files containing descriptions of each of 6 activities, as well as the column names collected during each run. The prescription combines these column names with the appropriate data sats.

The training and test data sets and individual tables are then combined into one large data set containing all of the data ("all_data").

In order to segment only readings that contain the words "mean" or "std", the column names are searched for these terms. Another data set is created including only columns that include "mean" or "std".

A new data set is then created that summarizes the data means by activity and subject. Finally, the status that is written to a new text file ("newTidyDataSet.txt").
