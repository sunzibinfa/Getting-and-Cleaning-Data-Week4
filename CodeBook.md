#Code Book for R script

This is the code book for the project.

##Reproducing the Data set

To get reproduce the tidydataset.txt file, do the following steps:

1. Download the data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzip it into working directory of R studio
3. Execute the run_analysis.R script

##Source data

The data are collected from accelerometers from the Samsung Galaxy S smartphone. 
A full description of the data set is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data for the assignment can be downloaded from: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##About R script

The run_analysis.R does the following steps:

1. Reading in the test and train files
2. Merge the train and test files
3. Extract measurements only on mean and standard deviation
4. Uses descriptive activity names to name the activities in the data set
5. Appropriately label the data set with descriptive variable names
6. Creates a second, independent tidy data set with the average of each variable for each activity and each subject

##About variables

x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files

x, y and sub merge the previous data sets for further analysis

features and activity_labels contains the activity and descriptive names for the x and y data sets variables
