# reading the training files
train = read.csv("training/X_train.txt", sep="", header=FALSE)
# now add activity to column 562
train[,562] = read.csv("training/y_train.txt", sep="", header=FALSE)
#now subject to column 563
train[,563] = read.csv("training/subject_train.txt", sep="", header=FALSE)
#now add "train" to column 564
train[,564] <-"train"
#
# reading the test files
test = read.csv("test/X_test.txt", sep="", header=FALSE)
# now add activity to column 562
test[,562] = read.csv("test/y_test.txt", sep="", header=FALSE)
#now subject to column 563
test[,563] = read.csv("test/subject_test.txt", sep="", header=FALSE)
#now add "test" to column 564
test[,564] <-"test"

#read the column names
features = read.csv("features.txt", sep="", header=FALSE)
#
#clean up the the column names to be consistent
features[,2] = gsub('Mean', '-mean', features[,2])

#change all column names to lower case
features[,2]<-tolower(features[,2])

#add in columns names for added columns
features[562,2]<-"activity"
features[563,2]<-"subject"
features[564,2]<-"mode"

#merge data sets
alldata<-rbind(test,train)

#add in column headers
names(alldata)<-features[,2]

#read activity labels
activity = read.csv("activity_labels.txt", sep="", header=FALSE)

#add activity labels to data
for (i in 1:6){
        alldata$activity<-gsub(i,activity[i,2], alldata$activity)  
}


#Identify columns to keep 
columns2keep <- grep(".*mean.*|.*std.*", features[,2])
#add in activity & subject
columns2keep<-c(columns2keep,562,563)

#extract subset of data for tidy data set
tidy_subset<-alldata[,columns2keep]

#Convert to factor variables
tidy_subset$activity <- as.factor(tidy_subset$activity)
tidy_subset$subject <- as.factor(tidy_subset$subject)

#Find the mean of the data by activity & subject
tidy<-aggregate(tidy_subset[,1:86], by=list(activity = tidy_subset$activity, subject=tidy_subset$subject), mean)

#output the tidy data
write.table(tidy, "tidy_data.txt", row.names=FALSE)