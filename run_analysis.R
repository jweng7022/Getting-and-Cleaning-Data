#Merge the training and test sets to create one 

# set working directory to the location where the data is stored
setwd("C:/Coursera/data/UCI_HAR/UCI HAR Dataset")

# load all the test and train data
x_test<-read.table("C:/Coursera/data/UCI_HAR/UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("C:/Coursera/data/UCI_HAR/UCI HAR Dataset/test/y_test.txt")
subject_test<-read.table("C:/Coursera/data/UCI_HAR/UCI HAR Dataset/test/subject_test.txt")

x_train<-read.table("C:/Coursera/data/UCI_HAR/UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("C:/Coursera/data/UCI_HAR/UCI HAR Dataset/train/y_train.txt")
subject_train<-read.table("C:/Coursera/data/UCI_HAR/UCI HAR Dataset/train/subject_train.txt")

# combine test and train data based on rows
x_data<-rbind(x_test,x_train)
y_data<-rbind(y_test,y_train)
subject_data<-rbind(subject_test,subject_train)

# load activity_labels and Features
activity_labels<-read.table("C:/Coursera/data/UCI_HAR/UCI HAR Dataset/activity_labels.txt")

features<-read.table("C:/Coursera/data/UCI_HAR/HCI HAR Dataset/features.txt")

# Extracts only the measurements on the mean and standard deviation for each measurement

# extract the column name from features.txt to load it to data sets later

features2<-grep("-(mean|std)\\(\\)",features[,2])

# added desired column to x_data and correct the column name
x_data=x_data[,features2]

names(x_data)<-features[features2,2]

# Uses descriptive activity names to name the activities in the data set

# update and correct column name
y_data[,1]<-activity_labels[y_data[,1],2]
names(y_data)<-"activity"

# Appropriately labels the data set with descriptive variable names.

# Re-name column name in subject_data
names(subject_data)<-"subject"

# creates a second, independent tidy data set with the average of each variable for each activity and each subject

combine_data<-cbind(x_data,y_data,subject_data)

library(plyr)

tidy_data <- ddply(combine_data,.(subject,activity),function(x) colMeans(x[,1:66]))

write.table(tidy_data,"tidy_data.txt", row.name=FALSE)
