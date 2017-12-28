#Downloading data from web
url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
if (!file.exists('test.zip')) {
  download.file(url,destfile = 'test.zip')
  unzip('test.zip')
}

#Loading txt files into R
test <- read.table('./UCI HAR Dataset/test/X_test.txt')
testlabel <- read.table('./UCI HAR Dataset/test/y_test.txt')
train <- read.table('./UCI HAR Dataset/train/X_train.txt')
trainlabel <- read.table('./UCI HAR Dataset/train/y_train.txt')
testsubject <- read.table('./UCI HAR Dataset/test/subject_test.txt')
trainsubject <- read.table('./UCI HAR Dataset/train/subject_train.txt')
vnames <- read.table('./UCI HAR Dataset/features.txt')
al <- read.table('./UCI HAR Dataset/activity_labels.txt')

#Inserting variable names
vnames <- vnames$V2
colnames(test) <- vnames
colnames(train) <- vnames

#Adding variables (Activities and Subject #)
test$Activity <- testlabel$V1
train$Activity <- trainlabel$V1
test$Subject <- testsubject$V1
train$Subject <- trainsubject$V1

#merging test set and train set
project <- rbind(test,train)

#Extracts only the measurements on the mean and standard deviation for each measurement.
colnames(al) <- c('number', 'Descriptive_Activity')
project <- merge(project,al, by.x='Activity',by.y='number',all=FALSE)
meanstd <- grep('mean()|std()',vnames,value = TRUE)
allnames <- c(meanstd,'Descriptive_Activity','Subject')
project <-project[, allnames]

#Creating Second dataset
library(reshape2)
projectMelt <- melt(project,id=c('Subject','Descriptive_Activity'),measure.vars=meanstd)
meltData <- dcast(projectMelt, Subject+Descriptive_Activity~variable,mean)


#Modification of variable names
allnames <- names(meltData)
allnames <- gsub("[\\(\\)]", "", allnames)
allnames <- gsub("^f", "Frequency", allnames)
allnames <- gsub("^t", "Time", allnames)
allnames <- gsub("Acc", "Accelerometer", allnames)
allnames<- gsub("Gyro", "Gyroscope", allnames)
allnames <- gsub("Mag", "Magnitude", allnames)
allnames <- gsub("std", "StandardDeviation", allnames)
colnames(meltData) <- allnames

write.table(meltData,'SecondData.txt',row.name=FALSE)
