# Introduct of Project

This purpose of this project is to demonstrate the user's ability to collect, work with, and clean a data set for donwstream analysis.

The data set used in this project was collected from the accelerometers from the Samsung Galaxy S smartphone.

The data can be found in the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
A full description of the data can be found in the following link:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Variables:
x_test, y_test, x_train, y_train, subject_test, and subject_train are txt files contain in the data se available for download.
x_data, y_data, and subject_data are txt files combined by user.
feature and activity_labels are txt files containing the desired column names for the tidy data set.
feature2 is the file created by user where the desired column name is extracted.
tidy_data is the txt file created after the user performed cleaning on the raw data.

# Procedure

1. All the raw data sets were loaded into Rstudio.
2. Test and train data were merged using rbind command.
3. The desired column names were extracted from feature and activity_labels.
4. Renaming the column names.
5. Combine all the data sets using cbind to create a tidy data set.
6. Create a txt file of the tidy data set using write.table.
