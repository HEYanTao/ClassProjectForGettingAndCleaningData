# This file discusses some variables in the Code_for_course_project.R 
 This program does following things.
* Taking in raw data and merge them into one.
* Labeling variables.
* Taking out some variables as the assignment requires.
* Changing variable names so that they can be understood easier.
 
 Labels of the data
* subject indicates who takes this experiment
* activity indicates the experiment undergoing
* Variables like tBodyAcc-mean-X is the name of experiment variable.

 Variables inside the code
* tempdata1/2 is just a temp file to stock the data took in
* x,y,subject takes merged data
* qualifiedMeasurements stocks the index of those items qualified the problem's requirement
* extractx stocks those items qualified
* tidydata stocks the result for problem 4
* s,a,r are variables used in loop in order to indicate which loop is undergoing
* independentData stocks the result for problem 5
