# Project Assignment Getting and Cleaning Data

## Introduction
The **run_analysis.R** script has been created as an assignment for the [Getting and Cleaning Data](https://class.coursera.org/getdata-013) on Coursera.

The script downloads data from an expirement where persons did a number of activities while wearing a smartphone.
The result of the script is a tidy data set with the mean of a selection of measurements per combination of person (subject) and activity,

Please note:
The script will create a "data" folder in your working directory if it doesn't already exist and download the necessary data from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones . 
If you already have the data or want to put it in a different folder, please change the script accordingly.
Also, the script needs the **dplyr** package to be installed. 

More background info on the data can be found in the CodeBook.md file.

## Some assumption on the assignment
The assignment states that only the measurements on the mean and standard deviation for each measurement should be extracted. However the files also inlude measurements like the "Mean Frequence" (MeanFreq). My assumption is that i should only extract the columns containing "mean()" and "std()" as mentioned in the "features_info.txt" which is included with the original data files.

## Steps in the run_analysis.R script
* Initialise script: Add data folder to working directory (if not already present) and load dplyr package
* Downloading data and extracting it in the data folder
* Importing features.txt (contains the column names of the measurements) and activity_labels.txt files.
* Adding a column to features containing cleaned up column names:
  * replacing abbreviations for descriptions
  * using capitals for the first letter of a word to increase readability
  * replacing brackets, etc.
* Importing the test data files (using the tidy column names from features)
* Idem for the training data files
* Replacing ActivityID's with descriptive labels of the activities.
* Determine which columns are required for the assignment (see introduction above)
* Combining all the test files into one tidy test data set
* Idem for the training data files
* Merging test and training data set
* Aggregate by taking mean over all measurements, grouped by SubjectID and Activity
* Exporting the aggregated data set (MeanValuesBySubjectActivity.txt) to the data folder in your working directory

If you want to see the old column names from the source and the new (tidy!) column names used in the aggregated data file , you can do so with the code below (after running run_analysis.R): 

```
subset(features,features$FeatureTidy %in% colnames(DataSet))
```
