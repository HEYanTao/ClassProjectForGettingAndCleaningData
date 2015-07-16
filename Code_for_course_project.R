##This is for the coursera getting and cleanning data course project.
##This program mainly focus on getting tidy and usable data from real-life raw data.


#First step
#Read in the raw data
#Merges the training and the test sets to create one data set.

tempdata1<-read.table("./UCI HAR Dataset/train/X_train.txt")
tempdata2<-read.table("./UCI HAR Dataset/test/x_test.txt")
x<-rbind(tempdata1,tempdata2)

tempdata1<-read.table("./UCI HAR Dataset/train/subject_train.txt")
tempdata2<-read.table("./UCI HAR Dataset/test/subject_test.txt")
subject<-rbind(tempdata1,tempdata2)

tempdata1<-read.table("./UCI HAR Dataset/train/y_train.txt")
tempdata2<-read.table("./UCI HAR Dataset/test/y_test.txt")
y<-rbind(tempdata1,tempdata2)

#Second step
#Extracts only the measurements on the mean and standard deviation for each measurement.
feature<-read.table("./UCI HAR Dataset/features.txt")
qualifiedMeasurements<-grep("mean|std",feature[,2])
extractx<-x[,qualifiedMeasurements]
names(extractx)<-feature[qualifiedMeasurements,2]

#Third step
#Uses descriptive activity names to name the activities in the data set.
activities<-read.table("./UCI HAR Dataset/activity_labels.txt")
y[,1]<-activities[y[,1],2]

#Fourth step
#Appropriately labels the data set with descriptive variable names.
names(subject)<-"subject"
subject<-subject[,1]
names(y)<-"activity"
tidydata<-cbind(subject,y,extractx)
names(tidydata)<-gsub("\\(\\)","-",names(tidydata))
names(tidydata)<-gsub("--","-",names(tidydata))
names(tidydata)<-gsub("-$","",names(tidydata))
write.table(tidydata,"./tidy_data.txt",row.name=FALSE)

#Fifth step
#From the data set in step 4, creates a second, independent tidy data set 
#+ with the average of each variable for each activity and each subject.
activity<-unique(activities)
num.activity<-dim(activity)[1]
subject<-unique(tidydata$subject)
num.subject<-length(subject)
num.col<-dim(tidydata)[2]
num.total<-num.activity*num.subject
independentData<-tidydata[1:num.total,]
for (s in 1:num.subject) 
{
      for (a in 1:num.activity) 
      {
            r=a+(s-1)*num.activity
            independentData[r,1]=subject[s]
            independentData[r,2]=activity[a,2]
            qualifiedData <- tidydata[tidydata$subject==s & tidydata$activity==activity[a,2], ]
            independentData[r,3:num.col]=colMeans(qualifiedData[,3:num.col])
      }
}
independentData<-independentData[order(independentData$subject,independentData$activity),]
write.table(independentData,"./independent_tidy_data.txt",row.name=FALSE)

      

              
            












