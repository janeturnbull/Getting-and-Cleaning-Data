==================================================================
Getting and Cleaning Data - Coursera Class Project - Codebook
December 2014
==================================================================

This codebook describes in detail the run_analysis.R R script associated with the Getting and Cleaning Data course project.

==================================================================

Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
==================================================================

The run_analysis.R scripts reads in 8 files:

1) features.txt- Types of responses being measured by accelerometer.
2) activity_labels.txt- Type of activity being measured and described.
3) subject_train.txt- Each row identifies the subject who performed the activity for each window sample in the training data set. Its range is from 1 to 30.
4) x_train.txt- Each row identifies the subject who performed the activity for each window sample. 
5) y_train.txt- Training set activity ids.
6) subject_test.txt- Each row identifies the subject who performed the activity for each window sample in the test data set. Its range is from 1 to 30.
7) x_test.txt- Each row identifies the subject who performed the activity for each window sample. 
8) y_test.txt- Test set activity ids.


In detail, the rest of the steps in the script are:

1) Summaries are performed on some of files to determine what the variable distributions look like.  For other files, the first few records are printed out.
2) The training and test data sets are all concatenated. 
3) Variable names are added to the data in the concatenated x training and test data set. 
4) The activity id name is added to the data in the concatenated y training and test data set.
5) The subject name is added to the data in the concatenated subject training and test data set.
6) The row numbers of the features data set containing the mean and standard deviation variable labels are extracted and placed in the means and stddev data sets.
7) The means and stddev data sets are then concatenated.
8) A new data set, x_train_test_means_stddev, is created using the previously extracted row numbers as column indexes.
9) The activity_level data set name variables names V1 and V2 are replaced with more descriptive names.
10) The activities labels are added to the y training and test data set and a new data set called activites is created.
11) Two new variables, the subjects and activities, are added to the x_train_test_means_stddev data set.   This data set is summarized to make sure everything looks correct.
12) There are a series of steps taken to clean up the variable names to make them more clear and less 'raw'.  (I could not tell what the X, Y, and Z in the label meant, so I left them.)
13) This data set was then written out as a text file.
14) Then the data set was aggregated by calculating the mean of each mean and standard deviation based on each activity and each subject.
15) This aggregated data set was then written out as a text file. 

==================================================================
This repository is located at:  https://github.com/janeturnbull/Getting-and-Cleaning-Data.

The contents of this repository include:

1) README.md - Describes project background and how the script works.   
2) run_analysis.R - R script that transforms accelerometer data, selects means and standard deviations, creates more descriptive variable names, 
and generates another data sets that calculates means of means and standard deviations selected.
3) Codebook.md - Describes in detail steps that occurred in the run_analysis.R script.  This file.

