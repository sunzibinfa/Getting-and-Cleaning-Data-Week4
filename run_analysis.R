library(dplyr)

#read test data
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#read train data
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#read data description and activity labels
variables <- read.table("./UCI HAR Dataset/features.txt")
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

#Merge datasets
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
sub <- rbind(sub_train, sub_test)

#Extracts only measurements on the mean and standard deviation
var <- variables[grep("mean|std",variables[,2]),]
x <- x[,var[,1]]

#Use descriptive activity names to name the activities in the data set
y <- merge(y,activities,by.x="V1")
y <- as.data.frame(y[,2])
colnames(y) <- "Activity"

#Label x dataset with descriptive variable names
colnames(x) <- variables[var[,1],2]

#Creates an independent tidy data set with the average of each variable for each activity and subject
colnames(sub) <- "Subject"
combine <- cbind(sub, y, x)
combine_mean <- combine %>% group_by(Subject, Activity) %>% summarize_all(funs(mean))
write.table(combine_mean, file = "./UCI HAR Dataset/tidydataset.txt", row.names = FALSE, col.names = TRUE)
