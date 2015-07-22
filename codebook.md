#Overview

run_analysis.R performs the 5 steps described in the course project's definition:

•	Similar data is merged using the rbind() function (files having the same number of columns and referring to the same entities).

•	Columns with the mean and standard deviation measures are extracted and are given the correct names, taken from features.txt.

•	For the activity data, we take the activity names and IDs from activity_labels.txt and name those columns (values 1:6) correctly.

•	For the entire dataset, those columns with vague column names are corrected.

•	Finally, we generate a new tidy dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called tidy_data.txt, and uploaded to this repository.


# Variables


•	the data from the downloaded files is contained in x_train, y_train, x_test, y_test, subject_train and subject_test 

•	x_data is created by merging x_train and x_test.

•	y_data is created by merging y_train and y_test.

•	Subject data is created by merging  subject_train and subject_test.

•	 features contains the correct names for the x_data dataset, which are applied to the column names stored in mean_std which is a numeric vector used to extract the desired data.

•	A similar approach is taken with activity names through the activities variable.

•	all_data merges x_data, y_data and subject_data in a big dataset.

•	avg_data is created to contain relevant averages which will be later stored in a .txt file. ddply() from the plyr packag

