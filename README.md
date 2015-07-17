# ClassProjectForGettingAndCleaningData
 This is the project for the Getting and cleanning data course.
# What does this program do
* For variables definitions, please look at the CodeBook.
* This program takes in raw data from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* This program outputs files named independent_tidy_data.txt and tidy_data.txt
* independent_tidy_data.txt is the answer for the question 5.
* tidy_data.txt is the answer for question 4.
* Code_for_course_project.R is the code file.

# How does this program work
 There are five steps in this program,which include
 * 1.Read in data and merge the datasets
 * 2.Extracts the qualified dataset
 * 3.Name the activities to make the dataset easier to understand
 * 4.Label the data set properly
 * 5.Create a new dataset with the average of each variable for each activity and each subject.
 
 * First step  
 First, the program reads in two tabels from train and test data, using read.tabel()  
 Second, merge them by rbind() and apply this procedure to x,y and subject respectively   
 The code is here:  
 tempdata1<-read.table("./UCI HAR Dataset/train/X_train.txt")  
 tempdata2<-read.table("./UCI HAR Dataset/test/x_test.txt")  
 x<-rbind(tempdata1,tempdata2)  

  tempdata1<-read.table("./UCI HAR Dataset/train/subject_train.txt")  
  tempdata2<-read.table("./UCI HAR Dataset/test/subject_test.txt")  
  subject<-rbind(tempdata1,tempdata2)  

  tempdata1<-read.table("./UCI HAR Dataset/train/y_train.txt")  
  tempdata2<-read.table("./UCI HAR Dataset/test/y_test.txt")  
  y<-rbind(tempdata1,tempdata2)  

* Second step
Using grep() to find qualified features and use names() to name those features  
The code is here  
 feature<-read.table("./UCI HAR Dataset/features.txt")  
 qualifiedMeasurements<-grep("mean|std",feature[,2])  
 extractx<-x[,qualifiedMeasurements]  
 names(extractx)<-feature[qualifiedMeasurements,2]

* Third step
Name the activities properly. Notice that we are going to rename those features in order to make them easier to understand in step four.
The code is here
activities<-read.table("./UCI HAR Dataset/activity_labels.txt")
y[,1]<-activities[y[,1],2]

* Fourth step
Using gsub() to make the variable name easier to understand. Using write.table() to output the result.
The code is here:
names(subject)<-"subject"
subject<-subject[,1]
names(y)<-"activity"
tidydata<-cbind(subject,y,extractx)
names(tidydata)<-gsub("\\(\\)","-",names(tidydata))
names(tidydata)<-gsub("--","-",names(tidydata))
names(tidydata)<-gsub("-$","",names(tidydata))
write.table(tidydata,"./tidy_data.txt",row.name=FALSE)

* Fifth step
First, we take out the number of activities and columns of the new independent dataset and stock them in variables like num.activity and num.col
Second, we make a loop to create the new dataset.We take out the qualified data and calculate the mean of them.
Third, using order() function to make the dataset looks more comfortable
Finally, output the dataset using write.table() 

The code is here
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
