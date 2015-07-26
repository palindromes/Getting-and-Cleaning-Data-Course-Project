# Code Book

## Intro

The run_analysis.R script downloads, elaborates and summarizes the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) published by UCI. The script creates a tidy data file `tody_data.txt`.


##Study design

[from the readme.txt attached to the data]

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 


##Code book
The raw data provided, for each record:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

In the tidy data the 561-feature vector has been reduced to a 66-feature vector: only the mean and standard deviation variables have been included. The tidy data has thus 68 total columns: a column for the subject (i.e. the number associated with each volunteer), a column for the activity performed and 66 measurements.
The resultant tidyData.txt calculated the average measurements for the 30 subjects and 6 activities involved in the experiment. The total rows are 180 + one header.
