# Data-tidying course project

This repository contains R code and documentation for the Coursera course "Getting and Cleaning Data".

It uses the 'raw' dataset [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Files

code includes download of data

'run_analysis.R' contains code to perform the 5 required steps (see below - creates the output "tidydata.txt")

'codebook.md' describes the variables, data, and summaries statistics used.


## Task:

Create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Functioning

The code checks for the existence of a directory for the data and creates a new one if there is none.

It then downloads the data into this directory.

Next, it uses read.table to read in the data tables "x_tr","y_tr","subject_tr","x_test","y_test", and "subject_test" from txt files in the download.

The training (tr) tables and test tables are then combined for x,y, and subject using rbind into three tables: "x.dat","y.dat", and "subject.dat".

The features.txt table is read in, and a table "mean_and_std" is created by grepping to contain only columns with names including "mean" or "std". X.dat is then re-defined to contain only the columns in x.dat matching those for the filtered names from"mean_and_std".

The names from "mean_and_std" are then applied to the columns in x.dat.

Activities are then read in from "activities.txt". They are applied as the column names in y.dat

