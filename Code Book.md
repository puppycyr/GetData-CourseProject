#Code Book

The data set named "newdata.txt" has 180 observations and 81 variables. These 180 observations represent the average of variables for each activity and each subject.

The type of activities were interpreted (from numbers to words) from the activity_label data set. Activities include: 
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

And the subjects include both test and train subjects, a total of 30.

The 81 variables are extracted from the original data set and only those measurements on the mean and standard deviation for each measurement. The names of these variables are different combinations of the following keywords:

- time/fourier: indicating whether it's a time domain signal or Fast Fourier Transformed frequency domain signal
- body/gravity: indicating whether it's a body or gravity signal
- acceleration/gyroscope: indicating whether the signal are collected by accelerometer or gyroscope
- jerk: presenting the body linear acceleration and angular velocity
- magnitude:  presenting the magnitude of signals calculated by using the Euclidean norm 
- mean/std: indicating whether it's a mean or standard deviation measurement
- frequency: indicating it's a measurement of frequency
- X/Y/Z: indicating the direction of these 3-dimensional signals

Note:
- Features are normalized and bounded within [-1,1].
