# Code Book MeanValuesBySubjectActivity.txt

This document describes the content of the **MeanValuesBySubjectActivity.txt** file.
The file has been created by the **run_analysis.R** script. Please see the **README.md** file for more info on this script.

## Information
This file was created as an assignment for the  [Getting and Cleaning Data](https://class.coursera.org/getdata-013) course on Coursera. 

The file is based on the measurements from an expirement where 30 subjects did several activities while wearing a smartphone which registered the subject's movements using the embedded accelerometer and gyroscope. For more information on this experiment, please see: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

File contains 180 observations and 68 variables. You can import the file using the code below:
```
read.table("./data/MeanValuesBySubjectActivity.txt", header=TRUE)
```

## Level of aggregation
The data is aggregated by taking the mean of certain measurements (see: Measurements) per subject and the activity performed (Walking, Walking upstairs, walking downstairs, sitting, standing and laying).

## Transformations on the data set
Column names have been modified as well as labels being added to the data to increase readability and comply with tidy data standards. Please see the README.md file for more information on the transformations perfermormed. Comparing the old and the new column names can be done with the code below (after running the run_analysis.R script):
```
subset(features,features$FeatureTidy %in% colnames(DataSet))
```

## Dimensions
* SubjectID: unique identifier of the participant in the experiment
* Activity: activities performed by each participant. 6 Levels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING,STANDING, LAYING.

##  Measurements
For this assignment we only had to select the Mean and Standard Deviation measurements. I have made the assumption that only the columns that had mean() and std() in their original naming have to be used (see README.md). 

All measurements have been normalized and bounded within (-1,1) and aggregated by using the mean by subject and activity

For more information about the measurements see the README.txt and features_info.txt files which are included in the original set of data.

Columns are build up out of the following components:

* Time / Frequency
  * Time: time of the linear acceleration and angular velocity
  * Frequency: frequency domain signals by applying Fast Fourier Transform
* BodyAccelerometer / GravityAccelerometer / BodyGyro
  * BodyAccelerometer: body acceleration
  * GravityAccelerometer: gravity acceleration
  * BodyGyro: body angular velocity
* Jerk / Magnitude
  * Jerk: 
  * Magnitude: magnitude of the signals calculated using the Euclidean norm
* Mean / Std
  * Mean: Mean value
  * Std: Standard Deviation.
* X / Y / Z: Direction


Columns:

* TimeBodyAccelerometer_Mean_X 
(Original column: tBodyAcc-mean()-X)

* TimeBodyAccelerometer_Mean_Y 
(Original column: tBodyAcc-mean()-Y)

* TimeBodyAccelerometer_Mean_Z 
(Original column: tBodyAcc-mean()-Z)

* TimeBodyAccelerometer_Std_X 
(Original column: tBodyAcc-std()-X)

* TimeBodyAccelerometer_Std_Y 
(Original column: tBodyAcc-std()-Y)

* TimeBodyAccelerometer_Std_Z 
(Original column: tBodyAcc-std()-Z)

* TimeGravityAccelerometer_Mean_X 
(Original column: tGravityAcc-mean()-X)

* TimeGravityAccelerometer_Mean_Y 
(Original column: tGravityAcc-mean()-Y)

* TimeGravityAccelerometer_Mean_Z 
(Original column: tGravityAcc-mean()-Z)

* TimeGravityAccelerometer_Std_X 
(Original column: tGravityAcc-std()-X)

* TimeGravityAccelerometer_Std_Y 
(Original column: tGravityAcc-std()-Y)

* TimeGravityAccelerometer_Std_Z 
(Original column: tGravityAcc-std()-Z)

* TimeBodyAccelerometerJerk_Mean_X 
(Original column: tBodyAccJerk-mean()-X)

* TimeBodyAccelerometerJerk_Mean_Y 
(Original column: tBodyAccJerk-mean()-Y)

* TimeBodyAccelerometerJerk_Mean_Z 
(Original column: tBodyAccJerk-mean()-Z)

* TimeBodyAccelerometerJerk_Std_X 
(Original column: tBodyAccJerk-std()-X)

* TimeBodyAccelerometerJerk_Std_Y 
(Original column: tBodyAccJerk-std()-Y)

* TimeBodyAccelerometerJerk_Std_Z 
(Original column: tBodyAccJerk-std()-Z)

* TimeBodyGyro_Mean_X 
(Original column: tBodyGyro-mean()-X)

* TimeBodyGyro_Mean_Y 
(Original column: tBodyGyro-mean()-Y)

* TimeBodyGyro_Mean_Z 
(Original column: tBodyGyro-mean()-Z)

* TimeBodyGyro_Std_X 
(Original column: tBodyGyro-std()-X)

* TimeBodyGyro_Std_Y 
(Original column: tBodyGyro-std()-Y)

* TimeBodyGyro_Std_Z 
(Original column: tBodyGyro-std()-Z)

* TimeBodyGyroJerk_Mean_X 
(Original column: tBodyGyroJerk-mean()-X)

* TimeBodyGyroJerk_Mean_Y 
(Original column: tBodyGyroJerk-mean()-Y)

* TimeBodyGyroJerk_Mean_Z 
(Original column: tBodyGyroJerk-mean()-Z)

* TimeBodyGyroJerk_Std_X 
(Original column: tBodyGyroJerk-std()-X)

* TimeBodyGyroJerk_Std_Y 
(Original column: tBodyGyroJerk-std()-Y)

* TimeBodyGyroJerk_Std_Z 
(Original column: tBodyGyroJerk-std()-Z)

* TimeBodyAccelerometerMagnitude_Mean 
(Original column: tBodyAccMag-mean())

* TimeBodyAccelerometerMagnitude_Std 
(Original column: tBodyAccMag-std())

* TimeGravityAccelerometerMagnitude_Mean 
(Original column: tGravityAccMag-mean())

* TimeGravityAccelerometerMagnitude_Std 
(Original column: tGravityAccMag-std())

* TimeBodyAccelerometerJerkMagnitude_Mean 
(Original column: tBodyAccJerkMag-mean())

* TimeBodyAccelerometerJerkMagnitude_Std 
(Original column: tBodyAccJerkMag-std())

* TimeBodyGyroMagnitude_Mean 
(Original column: tBodyGyroMag-mean())

* TimeBodyGyroMagnitude_Std 
(Original column: tBodyGyroMag-std())

* TimeBodyGyroJerkMagnitude_Mean 
(Original column: tBodyGyroJerkMag-mean())

* TimeBodyGyroJerkMagnitude_Std 
(Original column: tBodyGyroJerkMag-std())

* FrequencyBodyAccelerometer_Mean_X 
(Original column: fBodyAcc-mean()-X)

* FrequencyBodyAccelerometer_Mean_Y 
(Original column: fBodyAcc-mean()-Y)

* FrequencyBodyAccelerometer_Mean_Z 
(Original column: fBodyAcc-mean()-Z)

* FrequencyBodyAccelerometer_Std_X 
(Original column: fBodyAcc-std()-X)

* FrequencyBodyAccelerometer_Std_Y 
(Original column: fBodyAcc-std()-Y)

* FrequencyBodyAccelerometer_Std_Z 
(Original column: fBodyAcc-std()-Z)

* FrequencyBodyAccelerometerJerk_Mean_X 
(Original column: fBodyAccJerk-mean()-X)

* FrequencyBodyAccelerometerJerk_Mean_Y 
(Original column: fBodyAccJerk-mean()-Y)

* FrequencyBodyAccelerometerJerk_Mean_Z 
(Original column: fBodyAccJerk-mean()-Z)

* FrequencyBodyAccelerometerJerk_Std_X 
(Original column: fBodyAccJerk-std()-X)

* FrequencyBodyAccelerometerJerk_Std_Y 
(Original column: fBodyAccJerk-std()-Y)

* FrequencyBodyAccelerometerJerk_Std_Z 
(Original column: fBodyAccJerk-std()-Z)

* FrequencyBodyGyro_Mean_X 
(Original column: fBodyGyro-mean()-X)

* FrequencyBodyGyro_Mean_Y 
(Original column: fBodyGyro-mean()-Y)

* FrequencyBodyGyro_Mean_Z 
(Original column: fBodyGyro-mean()-Z)

* FrequencyBodyGyro_Std_X 
(Original column: fBodyGyro-std()-X)

* FrequencyBodyGyro_Std_Y 
(Original column: fBodyGyro-std()-Y)

* FrequencyBodyGyro_Std_Z 
(Original column: fBodyGyro-std()-Z)

* FrequencyBodyAccelerometerMagnitude_Mean 
(Original column: fBodyAccMag-mean())

* FrequencyBodyAccelerometerMagnitude_Std 
(Original column: fBodyAccMag-std())

* FrequencyBodyAccelerometerJerkMagnitude_Mean 
(Original column: fBodyBodyAccJerkMag-mean())

* FrequencyBodyAccelerometerJerkMagnitude_Std 
(Original column: fBodyBodyAccJerkMag-std())

* FrequencyBodyGyroMagnitude_Mean 
(Original column: fBodyBodyGyroMag-mean())

* FrequencyBodyGyroMagnitude_Std 
(Original column: fBodyBodyGyroMag-std())

* FrequencyBodyGyroJerkMagnitude_Mean 
(Original column: fBodyBodyGyroJerkMag-mean())

* FrequencyBodyGyroJerkMagnitude_Std 
(Original column: fBodyBodyGyroJerkMag-std())

