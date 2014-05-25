## CodeBook
## for
## Getting and Cleaning Data Project

### General Information on the Data
From the README.txt file from UCI Har DataSet:
"Human Activity Recognition Using Smartphones Dataset Version 1.0"

The experiments have been carried out with a group of 30 volunteers within an 
age bracket of 19-48 years. Each person performed six activities 
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial 
linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 
70% of the volunteers was selected for generating the training data and 
30% the test data. 

More information can be found at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Processing Steps
First the data is loaded from the various files into data frames:
features.txt - the column labels for the data files: X_train and X_test
activity_labels.txt - relating activity text strings to the activity values in Y_train and Y_test

X_train.txt - numerical data for the Training group
Y_train.txt - activity value for each row in X_train.txt
subject_train.txt - subject for each row in X_train.txt
X_test.txt - numerical data for the Testing group
Y_test.txt - activity value for each row in X_test.txt
subject_test.txt - subject for each row in X_test.txt

The column headers from features are added to the data.frames coming from
X_train.txt and X_test.txt.

Next an activity column with the activity string from activity_labels
is added to the data.frames from Y_train.txt and Y_test.txt, and column
names are added.

The subject column inthe data.frame from subject_train.txt and subject_test.txt
are added.

Then the three training data.frames are appended together and the three testing
data.frames apended together by columns into the data.frame dfTrain and dfTest.

These two data.frames are appended together by rows into a data.frame df.

Then we find just those columns in df, which refer to means or standard
deviations and keep those columns along with the first four columns which
contain the activity and subject data.

Next, we remove replace the hyphens with underscores and remove the parentheses
from any column name.

Then we use the aggregate function to take the average over each of the data
columns corresponding to each subject and each activity, and save this in
the data.frame dfavg. We name the first two columns subject and activity and
suffix the column names of the other columns with "avg_" to show they are
averages.

Lastly, we write dfavg to a CSV file called: 
"UCIHarAvgBySubjectActivity.csv"


### Variables
In taking the labels from the columns in the UCI Har Data Set, I have tried to
retain as much of the original name as possible for a good correlation. I have
had to remove the parenthesis following either std or mean, and I have removed
all hyphens from the names.Then I have added the suffix "avg" to each name as 
a reminder to users that these are average values over each subject and activity.

From the features info page of the UCI HAR Dataset
The features selected for this database come from the accelerometer and 
gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain 
signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz.
Then they were filtered using a median filter and a 3rd order low pass 
Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity 
acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low 
pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were 
derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ)
. Also the magnitude of these three-dimensional signals were calculated using 
the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag,
 tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals 
producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, 
fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain 
signals). 
The mean in the variable name refers to the mean value, and the std in the 
variable name refers to the standard deviation.
Variable list:

activity - The activity participated in: WALKING, WALKING_UPSTAIRS,
           WALKING_DOWNSTAIRS, SITTING, STANDING, or LAYING                  
subject - The number identifying the subject from 1 to 30                   
avgtBodyAccmeanX           
avgtBodyAccmeanY          
avgtBodyAccmeanZ
avgtBodyAccstdX           
avgtBodyAccstdY            
avgtBodyAccstdZ           
avgtGravityAccmeanX        
avgtGravityAccmeanY       
avgtGravityAccmeanZ        
avgtGravityAccstdX        
avgtGravityAccstdY         
avgtGravityAccstdZ        
avgtBodyAccJerkmeanX       
avgtBodyAccJerkmeanY      
avgtBodyAccJerkmeanZ       
avgtBodyAccJerkstdX       
avgtBodyAccJerkstdY        
avgtBodyAccJerkstdZ       
avgtBodyGyromeanX          
avgtBodyGyromeanY         
avgtBodyGyromeanZ          
avgtBodyGyrostdX          
avgtBodyGyrostdY           
avgtBodyGyrostdZ          
avgtBodyGyroJerkmeanX      
avgtBodyGyroJerkmeanY     
avgtBodyGyroJerkmeanZ      
avgtBodyGyroJerkstdX      
avgtBodyGyroJerkstdY       
avgtBodyGyroJerkstdZ      
avgtBodyAccMagmean          
avgtBodyAccMagstd          
avgtGravityAccMagmean       
avgtGravityAccMagstd       
avgtBodyAccJerkMagmean      
avgtBodyAccJerkMagstd      
avgtBodyGyroMagmean         
avgtBodyGyroMagstd         
avgtBodyGyroJerkMagmean     
avgtBodyGyroJerkMagstd     
avgfBodyAccmeanX           
avgfBodyAccmeanY          
avgfBodyAccmeanZ           
avgfBodyAccstdX           
avgfBodyAccstdY            
avgfBodyAccstdZ           
avgfBodyAccJerkmeanX       
avgfBodyAccJerkmeanY      
avgfBodyAccJerkmeanZ       
avgfBodyAccJerkstdX       
avgfBodyAccJerkstdY        
avgfBodyAccJerkstdZ       
avgfBodyGyromeanX          
avgfBodyGyromeanY         
avgfBodyGyromeanZ          
avgfBodyGyrostdX          
avgfBodyGyrostdY           
avgfBodyGyrostdZ          
avgfBodyAccMagmean          
avgfBodyAccMagstd          
avgfBodyBodyAccJerkMagmean  
avgfBodyBodyAccJerkMagstd  
avgfBodyBodyGyroMagmean     
avgfBodyBodyGyroMagstd     
avgfBodyBodyGyroJerkMagmean 
avgfBodyBodyGyroJerkMagstd 

