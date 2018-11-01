library(dplyr)

#read tables from unzipped folder
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# 1.merge training and test data to one data frame
X_df <- rbind(X_train,X_test)
Y_df <- rbind(Y_train,Y_test)
sub_df <- rbind(sub_train,sub_test)

# 2. extract measurements of mean and SD
selected_var <- features[grep("mean\\(\\)|std\\(\\)",features[,2]),]
X_selected <- X_df[,selected_var[,1]]

# 3. Uses descriptive activity names to name the activities in the data set
  #  3.1 use rename the V1 column of Y_df to activity 
colnames(Y_df) <- "activity"
  # 3.2 add activity label column to the data set and name the activities
Y_df$activitylabel <- factor(Y_df$activity, labels = as.character(activity_labels[,2]))
activitylabel <- Y_df[,-1]

# 4. Appropriately labels the data set with descriptive variable names.
colnames(X_selected) <- features[selected_var[,1],2]

# 5. From the data set in step 4, creates a second, independent tidy data set with the average
 # of each variable for each activity and each subject.

#5.1 name the column of sub_df to subject
colnames(sub_df) <- "subject"

#5.2 combine the data set in step 4 with subject labels 
total <- cbind(X_selected, activitylabel, sub_df)

#5.3 group the data set with activitylabel and subject, summarize the mean of each variable and subject
group <- group_by(total,activitylabel,subject)
total_mean <- summarize_all(group,funs(mean))

#5.4. export the txt file of the summarized tabel to the data folder
write.table(total_mean, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)


