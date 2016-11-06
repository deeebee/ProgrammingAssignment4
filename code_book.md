CodebookforWeek4Assignment

prefixes
	t							Time domain signals
	f							Frequency domain signals
	
[x|y|z]							used to denote 3-axial signals in X,Y,Z directions


subjectid						integer
	Identifier for the subject who carried out the experiment
	
activity						string
	Description of the activity that a test subject was doing when data was collected

tbodyaccmean[x|y|z].mean		double
	Mean of the mean estimated acceleration of the body - triaxial
tbodyaccstd[x|y|z].mean			double
	Mean of the standard deviation of the estimated acceleration of the body - triaxial
tgravityaccmean[x|y|z].mean		double
	
tgravityaccstd[x|y|z].mean		double
tbodyaccjerkmean[x|y|z].mean	double
tbodyaccjerkstd[x|y|z].mean		double
tbodygyromean[x|y|z].mean		double
tbodygyrostd[x|y|z].mean		double
tbodygyrojerkmean[x|y|z].mean	double
tbodygyrojerkstd[x|y|z].mean	double
tbodyaccmagmean.mean			double
tbodyaccmagstd.mean				double
tgravityaccmagmean.mean			double
tgravityaccmagstd.mean			double
tbodyaccjerkmagmean.mean		double
tbodyaccjerkmagstd.mean			double
tbodygyromagmean.mean			double
tbodygyromagstd.mean			double
tbodygyrojerkmagmean.mean		double
tbodygyrojerkmagstd.mean		double
fbodyaccmean[x|y|z].mean		double
fbodyaccstd[x|y|z.]mean			double
fbodyaccjerkmean[x|y|z].mean	double
fbodyaccjerkstd[x|y|z].mean		double
fbodygyromean[x|y|z].mean		double
fbodygyrostd[x|y|z].mean		double
fbodyaccmagmean.mean			double
fbodyaccmagstd.mean				double
fbodybodyaccjerkmagmean.mean	double
fbodybodyaccjerkmagstd.mean		double
fbodybodygyromagmean.mean		double
fbodybodygyromagstd.mean		double
fbodybodygyrojerkmagmean.mean	double
fbodybodygyrojerkmagstd.mean	double

The codebook for the input data is below for reference - note we are only using the mean() and std() values from this

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'
