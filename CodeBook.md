#The Code Book

This file describes the processing steps in the run_analysis script.

* The script first reads raw data into R variables using the read.table function. 
test_x - Data frame for the Test set.
train_x - Data frame for the Training set.
test_y - Data frame for the Test labels. 
train_y - Data frame for the Training labels. 

test_subject - Data frame with test subject identifiers. 
train_subject - Data frame with the training subject identifiers. 

features - Data frame with list of features. 
activityLabels - Data frame with the activity labels.

* The test and training data are merged using the rbind function.
merged_x - Data frame containing the merged accelerometer readings. 
merged_y - Data frame containing the merged reading labels. 
merged_subject - Data frame containing merged subject identifiers. 

* Extracts only the measurements on the mean and standard deviation for each measurement. 
merged_x gets replaced the filtered data frame containing only mean and standard deviation measurements. 

The std and mean features are filtered out using the grep function. 

* Activity names are made descriptive by stripping out paranthesis from the names using the sub function. 

* The names in the activityLabels data frame are cleaned by removing underscores from the names. 

* Numeric activity values are then replaced with their text values by replacing the data in the merged_y data frame. 

* An independant tidy data set is then created. 
To do this, first the merged_subject, merged_y and merged_x data frames are merged using cbind into a new data frame called merged. 

The merged data set is then aggregated on the 'subject' and 'activity.names' columns. The redundant columns are removed and the newly added aggregate columns are renamed to 'subject' and 'activity'. 

The aggregated data frame is written out to a file called 'activity_aggregates.txt'

 
