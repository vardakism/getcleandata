## Script to run an analysis that tides up acquired data from 
## Human Activity Recognition Using Smartphones" data set. Here the variables
## that contract the resulting tidy set are all the mean() and std() collected 
## variables. For every person and every activity (30 individuals, 6 activities)
## this script provides the mean of mean() and std() that were collected.


## Working Directory
# Set the right working directory here.
# Call all the files from the right directory by either storing them all
# together in the same directory or get them from their stored directory.

## Load necessary packages See step 5
library(reshape2)

##### Step 1 ####

varnames<-read.table("features.txt",header=F)
varnames$V3<-as.character(varnames$V2)

## Training set
# First load the subject ID file, then variables file and
# the extra activity variable. Then combine them all
# to a single data.frame
subtrain<-read.table("subject_train.txt")# Load the subject id of the training set
trainX<-read.table("X_train.txt")        # Data table of feature for each observation
trainY<-read.table("Y_train.txt")        # Activity ID
names(trainY)<-"activity"                # Add variable name
names(subtrain)<-"IDsubject"             # Name the variable ID for every subject
names(trainX)<-varnames$V3               # Name the variables this is step 4 
trainset<-cbind(subtrain,trainY,trainX)  # Combine them to the same data.frame

## Test set
# First load the subject ID file, then variables file and
# the extra activity variable. Then combine them all
# to a single data.frame
subtest<-read.table("subject_test.txt")# Load the subject id of the testing set
testX<-read.table("X_test.txt")        # Data table of feature for each observation
testY<-read.table("Y_test.txt")        # Activity ID
names(testY)<-"activity"               # Add variable name
names(subtest)<-"IDsubject"            # Name the variable ID for every subject
names(testX)<-varnames$V3              # Name the variables this is step 4 
testset<-cbind(subtest,testY,testX)    # Combine them to the same data.frame

## Merge both sets
fullset<-rbind(trainset,testset)

##### Step 2 ####
# Here I select all colums that contain mean() or std() variables,
# but not meanFreq variables
selcol <- grepl("mean\\(\\)|std\\(\\)", names(fullset)) #Select the mean and std
# Make also the id and activity column true in order to select it together
selcol[1:2]<-TRUE      
fsetsel<-fullset[,selcol]

##### Step 3 & 4 ####
# Variable names are given while importing and merging them to data.frame
act<-read.table("activity_labels.txt") #import activity names
actlabs<-as.character(act$V2)
# Make activity as a factor and insert the activity names as a label
fsetsel$activity<-factor(fsetsel$activity,labels=actlabs) 

##### Step 5 ####
# Creates a second, independent tidy data set with the average of each variable
# for each activity and each subject. 

molten<-melt(fsetsel,id=c("IDsubject","activity"))
tdata<-dcast(molten,IDsubject+activity~variable, mean)

# Output .txt file
write.table(tdata, "tidy.txt",row.names=FALSE)
