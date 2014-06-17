## Course Project for "Getting and Cleaning Data"

Here is a repo for [Getting and Cleaning Data](https://www.coursera.org/course/getdata) project that tides up and summarizes a part of  ["Human Activity Recognition Using Smartphones"](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) data set.

**Steps performed to result the same tidy data set
. Please follow the same to reproduce this analysis**

1. Download the data zip file to your home directory from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2. Unzip the file.
3.Either move them to the same directory or explicit state the path in the `read.table()` commands.
4. ALL the used file for this analysis are:
	* `features.txt`
	* `subject_train.txt`
	* `X_train.txt`
	* `X_test.txt`
	* `subject_test.txt`
	* `y_train.txt`
	* `y_test.txt`
5. Install/Load the R package [reshape2](http://cran.r-project.org/web/packages/reshape2/index.html) from CRAN.
6. Run the R script ([run_analysis.R](run_analysis.R)).
7. Outputs the .txt file [tidy.txt](tidy.txt).


! Please read the [CodeBook](CodeBook.md) for further information about the data used and the procedure.
 