# Cleandata-week-4-Assignment

This repo was created to finish the assignment for week 4 of Getting and Cleaning Data Coursera course.

Data description:
The variables in the data X_selected are sensor signals measured with waist-mounted smartphone from 30 subjects. The variable in the data Y_df indicates activity type the subjects performed during recording.

Code explanation:
The code combined training dataset and test dataset, and extracted variables containing means and standard deviations to create a new dataset with the averages of each variable for each activity and subject. 

New dataset:
The new generated dataset (total_mean) contained variables calculated based on the mean and standard deviation. Each row of the dataset is an average of each activity type for all subjects. The dataset is exported and uploaded to the repo as tidydata.txt file

The code was written based on the instruction of this assignment:

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
