# DataCleaning
Programming Assignment for "Getting and Cleaning Data" class

##About this script
This R script transforms the Human Activity Recognition Using Smartphones Dataset using the principles of tidy data. The data was collected from 30 subjects who each performed 6 activities(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

The resulting file represents the data for each activity by each subject in one row (6 subjects and 30 activities each) for a total of 180 rows. Each data column has the aggregated mean value for the subject's activity for the the mean and standard deviation values in the dataset.

The data columns represent means of the feature vectors described below.

##Assumptions
The script assumes that the data is present in its original form in the working directory.
The script requires the dplyr library.

##Strategy
The original data consists of separate Subject and Activity files in addition to the feature vector files. In addition, there are two sets of files for test and training. These are combined into a single file and the activity codes replaced with their descriptive names.

All data columns other than those representing mean and standard deviation of the measurement vectors are removed and the mean by Subject and Activity calculated to produce the final result. 

In order to read the final result, download the file into the working directory and read using:
read.table("tidy.txt",header=TRUE)

##Codebook
The final dataset contains means and std values for the following features in the time domain denoted by the t prefix. Using filters, acceleartion was separated into body and gravity components. Finally, Acc denotes linear acceleration and Gyro denotes angular acceleration. Jerk is a derivation combining linear and angular components. The magnitude of the signal was calcuated and denoted by Mag.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag

The following are identical but transformed in the frequency domain by FFT, denoted by the f prefix:

- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

