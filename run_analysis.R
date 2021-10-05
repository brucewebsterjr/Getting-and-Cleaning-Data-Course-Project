# This script collects, works with and cleans accelerometer data as instructed
# in the Getting and Cleaning Data Course Project. This script was written by
# Bruce Webster and was last updated on 10/5/2021

# These lines read in the data and labels for the test group and the control 
# group in the accelerometer data. These data files were collected in one folder
# in advance

test_data <- read.table("X_test.txt")
test_labelnum <- read.table("y_test.txt")
test_subjectid <- read.table("subject_test.txt")
train_data <- read.table("X_train.txt")
train_labelnum <- read.table("y_train.txt")
train_subjectid <- read.table("subject_train.txt")

# These lines row bind the data and labels from the test and control groups 
# into combined data sets

full_data <- rbind(test_data, train_data)
full_labelnum <- rbind(test_labelnum, train_labelnum)
full_subjectid <- rbind(test_subjectid, train_subjectid)

# These lines read in the text of signals and their analysis variables, and 
# then subsets that data to only include the means and standard deviations.
# This uses the [^F] characters to remove the mean frequency variables

features <- read.table("features.txt")
features_id <- grep("mean[^F]|std", features[, 2])
features_select <- features[features_id, ]
features_label <- features_select[, 2]

# These lines subset the data from the combined dataset using the previous
# set of ids, then applies the labels to the variable names for the newly
# subsetted data

select_data <- full_data[features_id]
colnames(select_data) <- features_label

# These lines read in the list of activity names provided, then takes the
# appropriate column and adds it to the combined set of (numeric) activity
# labels

activities <- read.table("activity_labels.txt")
activity_labels <- activities[, 2]
full_labelnum$activities <- factor(full_labelnum$V1, labels = activity_labels)

# These lines column bind the full subject id dataset, the full labeled activity
# dataset, and the full accelemeter dataset into one combined dataset, then
# changes the names of the subject id variable and the activity variable to 
# improve readability

select_data_id_activity <- 
    cbind(full_subjectid, full_labelnum$activities, select_data)
select_data_id_activity <- rename(select_data_id_activity, c(subject_id = V1, 
    activity = "full_labelnum$activities"))

# This line groups the data by subject id and activity, then calculates a mean
# for all of the analysis variables

subject_activity_means <- select_data_id_activity %>% 
    group_by(subject_id, activity) %>%
    summarise_all(funs(mean))

# These lines output the table of means for uploading to the Coursera website
# and the labels for the subset of features to be used in the data dictionary
# then ends by outputting the tidy data set of means

write.table(subject_activity_means, "subject_activity_means.txt", 
            row.names = FALSE)
write.table(features_select, "features_id.txt")
subject_activity_means
# This is the end of the script