## Code Book

This code book lists the number of different files used in order to result a tidy dataset from smartphone movementdata.

## Overview

30 volunteers asked to carry a smartphone in their daily movements. The smartphone carries an accelorometer that records a number of variables and results in a classification of volunteers activities in 6 types of movements (activities) whilst carrying it. The dataset was originally split in training and test set. The aim of this Course project is to merge these two dataset and extract variables that contain average and standard deviation  values. Furthermore the aim is to summarize them per volunteer and activity taking the mean of these values.

## Explanation of the contents of every file used.

** The labels
* `features.txt`: Descriptive labels of the 561 features.
* `activity_labels.txt`: Descriptive labels for each of the 6 activities.

** The sets
* `X_train.txt`: 7352 observations of the 561 features, for 21 of the 30 volunteers in the training set.
* `subject_train.txt`: A vector of 7352 integers, illustrating the ID of the volunteer related to each of the observations in `X_train.txt`.
* `y_train.txt`: A vector of 7352 integers, denoting the ID of the activity related to each of the observations in `X_train.txt`.

* `X_test.txt`: 2947 observations of the 561 variables, for 9 of the 30 volunteers in the test set.
* `subject_test.txt`: A vector of 2947 integers, illustrating the ID of the volunteer related to each of the observations in `X_test.txt`.
* `y_test.txt`: A vector of 2947 integers, denoting the ID of the activity related to each of the observations in `X_test.txt`.

More information about the files is available in `README.txt` from the [zipfile](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). More information about the features is available in `features_info.txt`.

### Data files that were not used

This tidy dataset was constructed using only the files above, and did not use the raw signal data. The data files in the "Inertial Signals" folders, which are included in the raw data were excluded from the construction of this project's tidy dataset.

### Processing steps

1. Data files are read into data frames, appropriate column headers are added, and the training and test sets are combined into a single data set.
2. Only feature columns that contain the exact string "mean()" or "std()" are kept for this analysis. This produces a 68 feature columns, with the subjectID and activity columns.
3. The activity column is converted from a integer to a factor, using labels describing the activities.
4. A tidy data set is created containing the mean of each feature of interest for each subject and each activity. Thus, subject 1 has 6 rows in the tidy data set (one row for each activity), and each row contains the mean value for each of the 66 features for that subject/activity combination. Since there are 30 subjects, there are in total 180 rows.
5. The tidy data set was output to a TXT file.