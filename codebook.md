#The codebook for 'avg_sub.txt' and 'avg_act.txt'

1. activity : factor
	Activity Type
		WALKING
		WALKING_UPSTAIRS
		WALKING_DOWNSTAIRS
		SITTING
		STANDING
		LAYING

2. subject : factor
	30 volunteers who participated in the experiment are identified by integers 1-30
		1-30

3. All other variables are the average of original Samsung dataset's 'features.txt' data, and they are named according to the following rules:
	- prefix 't': time domain signals at a constant rate of 50 Hz
	- prefix 'f': Fast Fourier Transform (FFT)
	- BodyAcc: body acceleration signal
	- GravityAcc: gravity acceleration signal
	- BodyAccJerk: body linear acceleration to obtain Jerk signals
	- BodyGyroJerk: body linear angular velocity to obtain Jerk signals
	- suffix 'Mag': the magnitude of the signals calculated using the Euclidean norm 
	- '_mean': mean value
	- '_std': standard deviation
	- '_XYZ': 3-axial signals in the X, Y and Z directions.
	