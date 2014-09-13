coursera_getting_and_cleaning_data
==================================


Overview

This repository contains the script used for my class project in Coursera Getting and Cleaning Data.


Raw Data

The source data can be found at 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data consists of Training and Test sets.

For the data in the Test case, the features (561 of them) are unlabeled and can be found in the filecalled x_test.txt. The activity labels are in the y_test.txt file.  The test subjects are in the subject_test.txt file.

The same holds for the data for the training set.

Script Details

I created a script called run_analysis.R which will merge the test and training sets together. The sources data from above must be extracted.  After merging testing and training data, the script adds labels and only columns that have to do with mean and standard deviation are retained for the tidy data set.

The script creates a tidy data set containing the average of all the columns per test subject and per activity. This tidy dataset will be written to a file called tidy_data.txt.

The CodeBook.md file explains the transformations performed and the resulting data and variables.
