Peer-graded Assignment: Getting and Cleaning Data Course Project
README file for the GitHub Repository
Updated by Bruce Webster on 10/5/2021
----------------------------------------------------------------

This repository contains three files:

1) This README file (named readme.MD)

2) A codebook (named codebook.MD) describing variables and their values from the
   subject_activity_means dataset uploaded to Coursera

3) The R script (named run_analysis.R) that takes data from the Human Activity 
   Recognition Using Smartphones Data Set, reads in multiple data sets, then
   merges the training and the test sets to create combined data sets and sets
   of labels. Then the script extracts only the measurements on the mean and 
   standard deviation for each measurement, renames the activities in the data
   set with descriptive names, and appropriately labels the data set with 
   descriptive variable names. Next it creates a second, independent tidy data
   set with the average of each variable for each activity and each subject.
   Finally, the script outputs the tidy set as a text file for upload to the
   Coursera website, and another text dataset that includes the variable names
   after subsetting to only include means and standard deviations - this file
   was used to create the codebook.

-----------------------------------------------------------------
   
This code can be used to read the tidy set:
   address <- "https://coursera-assessments.s3.amazonaws.com/assessments/
               1633456099962/b8ae5b84-835d-4f25-8e30-60143d3656c8/
               subject_activity_means.txt"
   address <- sub("^https", "http", address)
   data <- read.table(url(address), header = TRUE)
   View(data)
   
-----------------------------------------------------------------

The original data and documentation related to that data can be found at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

These links were also helpful in creating these files:
https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/
https://www.jstatsoft.org/article/view/v059i10/#:~:text=%20%20%20Authors%3A%20%20%20Hadley%20Wickham,%28Downloads%3A%2018918%20...%20%202%20more%20rows%20