
# Script collects data from an expirement where persons did a number of activities while wearing a smartphone
# The result of the script is a tidy data set with the mean of a selection of measurements per combination of person (subject) and activity
# Requirements: dplyr package 

#initialise script
if(!file.exists("data")) {dir.create("data")} #both source files as the tidy data file will be stored in the data folder
library("dplyr")

#download and unpack data
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "./data/projectdataset.zip")
unzip("./data/projectdataset.zip", exdir="./data")

#read dimension tables on obtained measurements and activities
features<-read.table("./data/UCI HAR Dataset/features.txt", header=FALSE, col.name=c("FeatureID","Feature")) # measurements taken
activity_labels<-read.table("./data/UCI HAR Dataset/activity_labels.txt", header=FALSE, col.name=c("ActivityLabelID","ActivityLabel")) # the labels for the activities

# tidy up feature list 
# Uppercase for first character and after delimiters
features$FeatureTidy<-gsub("(^|[[:space:]]|[-]|[(]|[)]|[,])([[:alpha:]])","\\1\\U\\2",features$Feature, perl=TRUE)

features$FeatureTidy<-   gsub("Mag","Magnitude" #replace abbreviations with descriptions
                              ,gsub("Acc","Accelerometer"
                                    ,gsub("^F","Frequency"
                                          ,gsub("^T","Time"
                                                ,gsub("BodyBody","Body" #error in original dataset
                                                      ,gsub("[-]|[,]","_" #use underscore as separator
                                                            ,gsub("[()]","" # () are a pain
                                                                  ,features$FeatureTidy
                                                            )
                                                      )
                                                )
                                          )
                                    )
                              )
)

FeatureColumns<-as.vector(features$FeatureTidy) # tidy column names used when loading x_test and x_train


#read test data
subject_test<-read.table("./data/UCI HAR Dataset/test/subject_test.txt", header=FALSE,col.names=c("SubjectID")) #persons
y_test<-read.table("./data/UCI HAR Dataset/test/Y_test.txt", header=FALSE,col.names=c("ActivityLabelID")) #performed activity by every person
x_test<-read.table("./data/UCI HAR Dataset/test/X_test.txt", header=FALSE, col.names=FeatureColumns) #measurements

#read training data
subject_train<-read.table("./data/UCI HAR Dataset/train/subject_train.txt", header=FALSE,col.names=c("SubjectID")) #persons
y_train<-read.table("./data/UCI HAR Dataset/train/y_train.txt", header=FALSE,col.names=c("ActivityLabelID")) #performed activity by every person
x_train<-read.table("./data/UCI HAR Dataset/train/X_train.txt", header=FALSE, col.names=FeatureColumns) #measurements

#Add activity labels for y files
y_test$Activity <- activity_labels[match(y_test$ActivityLabelID,activity_labels$ActivityLabelID), 'ActivityLabel']
y_train$Activity <- activity_labels[match(y_train$ActivityLabelID,activity_labels$ActivityLabelID), 'ActivityLabel']


#Select columns needed from x_test and and x_train.

# columns with std() and mean(). In the tidy column names this comes down to columns with Std and 
# columns ending with Mean (excluding GravityMean columns) or Mean_ in combination with the letters X,Y or Z
SelectedColumns<-c(grep("Std",colnames(x_test)),grep("[^Gravity]Mean$|Mean_[X,Y,Z]",colnames(x_test)))


#creating one test data set
TestSet<-cbind(subject_test,Activity=y_test$Activity,x_test[,SelectedColumns]) #creating one set

#creating one training data set
TrainingSet<-cbind(subject_train,Activity=y_train$Activity,x_train[,SelectedColumns]) #creating one set

#put test and validation in one file
DataSet<-rbind(TestSet,TrainingSet)

#aggregate by taking mean over all measurements, grouped by SubjectID and Activity
AggregatedDataSet<- DataSet %>% group_by(SubjectID, Activity) %>% summarise_each(funs(mean))

#Export to text file
write.table(AggregatedDataSet,"./data/MeanValuesBySubjectActivity.txt", row.names=FALSE)

