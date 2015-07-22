#setwd("D:/Yanran CHEN/study/Data Science Specialization/2_Getting and Cleaning Data/Course project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")

# 1. Merge dataset
train <- read.table("./train/X_train.txt")
test <- read.table("./test/X_test.txt")

data <- rbind(train, test)

# 2. Extract measures
features <- read.table("features.txt", stringsAsFactors = F)[,2]
a <- grep("mean|std",features)
data <- data[,a]
 
label <- rbind(read.table("./train/y_train.txt"), read.table("./test/y_test.txt"))
subject <- rbind(read.table("./train/subject_train.txt"), read.table("./test/subject_test.txt"))
data <- data.frame(subject,label,data)

# 3. Replace the activity labels
actlabel <- read.table("activity_labels.txt", stringsAsFactors = F)
data[,2] <- actlabel[data[,2],2]

# 4. Descriptive variable names
m <- c("^t","Body|BodyBody","Acc","\\-mean\\(\\)\\-*","\\-std\\(\\)\\-*","Gravity","Jerk","Gyro","Mag","^f","\\-meanFreq\\(\\)\\-*")
n <- c("time.","body.","acceleration.","mean.","std.","gravity.","jerk.","gyroscope.","magnitude.","fourier.","meanfrequency.")
names <- features[a]
for (i in 1:length(names)){
    for (j in 1:length(m)){
        names[i] <- gsub(m[j],n[j],names[i])
    }
    names[i] <- gsub("\\.$","",names[i])
}
names <- c("subject","activity",names)
colnames(data) <- names

# 5. New dataset with the average of each variable for each activity and each subject.
newdata <- aggregate(. ~ subject + activity, data = data, mean)
write.table(newdata,"New Data.txt", row.names = F)
