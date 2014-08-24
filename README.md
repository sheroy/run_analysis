#Smartphone accelerometer data analyzer

This project submission for the 'Getting and Cleaning data' course. The purpose of the project is to demonstrate the ability to collect and reshape raw data in forms useful for analytics. 

The following files are included in this submission:
* run_analysis.R
* CodeBook.md

##run_analysis.R
This is a self contained script to download the raw data files, merges data from multiple files, excludes data not pertainent to the final aggregation and finally aggregates data. The results of aggregation are written out to a file on disk. 

The script does the following:
* Downloads the raw text files into R variables. 
* Merges test and training data sets. 
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names for activities in the data set. 
* Labels the data set with descriptive variable names. 
* Generates a tidy data set with the aggregated data. 
* Writes the tidy data set as a text file on the file system.


##CodeBook.md
This file describes the variables in the output data set. 