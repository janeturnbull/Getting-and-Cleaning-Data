# Read in training data
x_train <- read.table("./R/Getting and Cleaning Data/UCI HAR Dataset/train/X_train.txt") 
summary(x_train)
y_train <- read.table("./R/Getting and Cleaning Data/UCI HAR Dataset/train/y_train.txt") 
summary(y_train)
subject_train <- read.table("./R/Getting and Cleaning Data/UCI HAR Dataset/train/subject_train.txt") 
summary(subject_train)

# Read in test data
x_test <- read.table("./R/Getting and Cleaning Data/UCI HAR Dataset/test/X_test.txt") 
summary(x_test)
y_test <- read.table("./R/Getting and Cleaning Data/UCI HAR Dataset/test/y_test.txt") 
summary(y_test)
subject_test <- read.table("./R/Getting and Cleaning Data/UCI HAR Dataset/test/subject_test.txt") 
summary(subject_test)

# Read in activity labels 
activity_labels <- read.table("./R/Getting and Cleaning Data/UCI HAR Dataset/activity_labels.txt") 
head(activity_labels)

# Read in features 
features <- read.table("./R/Getting and Cleaning Data/UCI HAR Dataset/features.txt") 
head(features)

# Merge data  
x_train_test <- rbind(x_train,x_test) 
y_train_test <- rbind(y_train,y_test) 
subject_train_test <- rbind(subject_train,subject_test) 

# Add labels to variables  
names(x_train_test) = features[[2]] 
names(y_train_test) = c("activityid") 
names(subject_train_test) = c("subjects") 

# Select means and standard deviation row numbers from label data set
means <- grep("mean",features[[2]]) 
means
stddev <- grep("std",features[[2]]) 
stddev

# Concatenate row numbers
means_stddev <- c(means,stddev)
means_stddev

# Select means and standard deviations from merged data based on row number  
x_train_test_means_stddev <- x_train_test[means_stddev] 
head(x_train_test_means_stddev)
 
# Clean column names 
names(activity_labels) = c("activityid","activity_type") 

# Add activity descriptions and subject ids to mean and stddev data 
activities <- merge(activity_labels,y_train_test,"activityid") 
activities
x_train_test_means_stddev$activities <- activities[[2]] 
x_train_test_means_stddev$subjects <- subject_train_test[[1]] 
summary(x_train_test_means_stddev)

#Make labels more descriptive
names(x_train_test_means_stddev)<-gsub("-","",names(x_train_test_means_stddev))
names(x_train_test_means_stddev)<-gsub("mean"," Mean ",names(x_train_test_means_stddev))
names(x_train_test_means_stddev)<-gsub("std"," Stddev ",names(x_train_test_means_stddev))
names(x_train_test_means_stddev)<-gsub("\\(\\)","",names(x_train_test_means_stddev))

#Write out dataset
write.table(x_train_test_means_stddev,"./R/Getting and Cleaning Data/UCI HAR Dataset/x_train_test_means_stddev.txt")

#Create aggregated dataset
agg_data<-aggregate(x_train_test_means_stddev,by=list(activities=x_train_test_means_stddev$activities,
          subjects=x_train_test_means_stddev$subjects),FUN=mean,na.rm=TRUE)
warnings()
#head(agg_data)
                   
#Write out dataset
write.table(agg_data,"./R/Getting and Cleaning Data/UCI HAR Dataset/agg_data.txt",row.name=FALSE)
