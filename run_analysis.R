## You should create one R script called run_analysis.R that does the following. 
##
## 1) Merges the training and the test sets to create one data set.
## 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3) Uses descriptive activity names to name the activities in the data set
## 4) Appropriately labels the data set with descriptive variable names. 
## 5) From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.

## install required packages, if necessary
installPackages <- function() {
    if (!require("data.table")) {
        message("Installing data.table package...")
        install.packages("data.table") 
        require("data.table")
    }
    if (!require("reshape2")) {
        message("Installing reshape2 package...")
        install.packages("reshape2") 
        require("reshape2")
    }
}

## run the process
run <- function() {
    installPackages()
    
    # Combine subjects and set "subject" as the column name.
    subject <- rbind(read.table("./train/subject_train.txt"), read.table("./test/subject_test.txt"))
    colnames(subject) <- "subject"
    
    # Combine x values and set features.txt as column names.
    x <- rbind(read.table("./train/X_train.txt"), read.table("./test/X_test.txt"))
    colnames(x) <- read.table("./features.txt")[, 2]
    
    # Combine y values and set activity_labels.txt
    y <- rbind(read.table("./train/y_train.txt"), read.table("./test/y_test.txt"))
    activity <- merge(y, read.table("./activity_labels.txt"), by=1)[, 2]

    # Combine x, y, and subject values
    set <- cbind(activity, subject, x)
    
    # Extract just the mean() and std() columns
    subsetted <- set[, c(1, 2, grep("mean\\(\\)|std\\(\\)", colnames(set)))]
    
    # Reshape data by activity and subject
    melted = melt(subsetted, id.var = c("activity", "subject"))
    
    # Caluclate the mean by activity and subject 
    dcasted = dcast(melted, activity + subject ~ variable, mean)
    
    write.table(dcasted, file="./tidaydata.txt", sep=",", row.names=FALSE)
}
