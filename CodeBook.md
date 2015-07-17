# This file discusses some variables in the Code_for_course_project.R 
 This program does following things.
* Taking in raw data and merge them into one.
* Labeling variables.
* Taking out some variables as the assignment requires.
* Changing variable names so that they can be understood easier.
 
 Labels of the data (can be seen by using names() function )
* The column "subject" indicates who takes this experiment
* The column "activity" indicates the experiment undergoing
* Variable names like tBodyAcc-mean-X are the names of experiment variables.

 Variables inside the code
* The variable tempdata1 or tempdata2 is just a temporary file to stock the data took in
* The variable x,y,subject are variables stocking merged data
* The variable qualifiedMeasurements stocks the index of those items qualified the problem's requirement
* The variable feature stocks the data read from the features.txt
* The variable activities stocks data from activity_labels.txt 
* The variable extractx stocks those items qualified the problem's requirement
* The variable tidydata stocks the result for problem 4
* The variable s,a,r are variables used in loop in order to indicate which loop is undergoing
* The variable independentData stocks the result for problem 5
* The variable num.activity,num.subject,num.col,num.total indicate the total number of activities,subjects and so on
