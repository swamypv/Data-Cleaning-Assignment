merge_training_test <- function(){
  
  #load subject_test
  subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  #load y_test
  y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
  #load x_test
  x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
  
  #merge test data
  test_data <- cbind(subject_test, y_test, x_test)
  
  
  #load subject_train
  subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
  #load y_train
  y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
  #load x_train
  x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
  #merge train data
  train_data <- cbind(subject_train, y_train, x_train)
  
    
  #Merge both x_test and x_train
  merged_test_train <- rbind(test_data, train_data)
  
  #Load features names
  features <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
  features <- features[[2]]
  features <- append(c("subject", "activity"), features)
  
  # Assign futures names as columns to the data frame
  names(merged_test_train) <- features
  
  #Now subsetting data to get only the means and standard deviation columns along with the subject and activity
  mean_column <- merged_test_train[, grep("mean\\(\\)", names(merged_test_train))]
  sd_column <- merged_test_train[, grep("std\\(\\)", names(merged_test_train))]
  tidy_data <- cbind(merged_test_train[,1:2], mean_column, sd_column)
  
 
  # Splitting the tidy data by subject and activity
  split_tidy_data <- split(tidy_data, list(tidy_data$subject, tidy_data$activity))
  split_tidy_data <- data.frame(t(as.data.frame(lapply(split_tidy_data, colMeans))))
  
  # Now giving descriptive names to activities
  split_tidy_data$activity <- replace(split_tidy_data$activity, split_tidy_data$activity == 1,"WALKING")
  split_tidy_data$activity <- replace(split_tidy_data$activity, split_tidy_data$activity == 2,"WALKING_UPSTAIRS")
  split_tidy_data$activity <- replace(split_tidy_data$activity, split_tidy_data$activity == 3,"WALKING_DOWNSTAIRS")
  split_tidy_data$activity <- replace(split_tidy_data$activity, split_tidy_data$activity == 4,"SITTING")
  split_tidy_data$activity <- replace(split_tidy_data$activity, split_tidy_data$activity == 5,"STANDING")
  split_tidy_data$activity <- replace(split_tidy_data$activity, split_tidy_data$activity == 6,"LAYING")
  
  tidy_data$activity <- replace(tidy_data$activity, tidy_data$activity == 1,"WALKING")
  tidy_data$activity <- replace(tidy_data$activity, tidy_data$activity == 2,"WALKING_UPSTAIRS")
  tidy_data$activity <- replace(tidy_data$activity, tidy_data$activity == 3,"WALKING_DOWNSTAIRS")
  tidy_data$activity <- replace(tidy_data$activity, tidy_data$activity == 4,"SITTING")
  tidy_data$activity <- replace(tidy_data$activity, tidy_data$activity == 5,"STANDING")
  tidy_data$activity <- replace(tidy_data$activity, tidy_data$activity == 6,"LAYING")
  
  #Write data to the text file
  write.table(tidy_data, file="tidy_data.txt")
  
  write.table(split_tidy_data, file="mean_tidy_data.txt")
  
  return(split_tidy_data)
  
}