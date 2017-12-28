#Getting and Cleaning Data project codebook
Final output of the R script file is 'SecondData.txt,' which contains merged and summarized version of dataset from : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Variables
81 variables are included in the dataset

###ID variables

*Subject : There were 30 volunteers included in the experiment, each subjects were numbered, ranging from 1 to 30
*Activity : Descriptive variable, describing what action was performed, WALKING`,`WALKING_UPSTAIRS`,`WALKING_DOWNSTAIRS`,`SITTING`,`STANDING`,`LAYING`

###Measurement variables

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are (Only 3 sets since mean and std variables are extracted out): 

* mean() : Mean value
* std() : Standard deviation value
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

###Actions done

'SecondData.txt' includes the average of each variable for each activity of each subject. Thus, 180 summarized observations are created at the end.

Following actions are done by 'run_analysis.r' script:

* Downloads the dataset if it doesn't exist and read them into R
* Merges the training and test data sets as one dataset
* Replaces numeric activity label variable with descriptive variables
* Modify variable names to contain more descriptive info
* Extracts only the measurement variables on mean and standard deviations
* the final dataset 'SecondData.txt' was created with the average of each variable for each activity and each subject.