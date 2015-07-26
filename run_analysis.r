get_data <- function(){
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", dest="raw_data.zip", method="curl")
  unzip("./raw_data.zip")
  unlink("./raw_data.zip")
}

run_analysis <- function(){
  
  ## The cleaning function: load tables from files
  CLean <- function(act_labsf, 
                    tabl, 
                    names, 
                    subsf, 
                    labsf){
    
    ## A function to move the last variable to the first column
    lastVfirst <- function(){
      item <<- item[,
               c(ncol(item),
                 1:(ncol(item)-1 ) 
               )  
               ]
    }
    
    item <- read.table(tabl)
    nms = read.table(names)
    
    ##putting col names in tables
    names(item) <- nms[,2]
    
    ##restricting data to mean() and std()
    item <- item[,
                 c(grep("mean()", names(item), fixed=TRUE),
                   grep("std()", names(item), fixed=TRUE)
                 )
                 ]
    
    ##adding cols for subjects and activity labels
    ###adding subejcts
    subs <- read.table(subsf)
    item$Subjects <- subs[,1]
    lastVfirst()
    ###adding labels (numbers)
    labs <- read.table(labsf)
    item$Labels <- labs[,1]
    ###adding activity labels (matching numbers)
    act_labs <- read.table(act_labsf)
    item <- merge(item,act_labs, by.x="Labels", by.y="V1")
    ###rename the added column
    names(item)[names(item)=="V2"] <- "Activity"
    ###delete the old Labels column
    item$Labels <- NULL
    lastVfirst()
    
    item
  }

  test <- CLean("UCI HAR Dataset/activity_labels.txt",
                "UCI HAR Dataset/test/X_test.txt",
                "UCI HAR Dataset/features.txt",
                "UCI HAR Dataset/test/subject_test.txt",
                "UCI HAR Dataset/test/y_test.txt")
  train <- CLean("UCI HAR Dataset/activity_labels.txt",
                "UCI HAR Dataset/train/X_train.txt",
                "UCI HAR Dataset/features.txt",
                "UCI HAR Dataset/train/subject_train.txt",
                "UCI HAR Dataset/train/y_train.txt")
  
  ##merge train and test
  merged <- rbind(train,test)
  
  ##use reshape2 to dcast data generating the mean of each measure
  ##for each sugbject and activity
  library(reshape2)
  new_merged <- melt(merged,
                     id=c( names (merged[,(1:2)]) ),
                     measure.vars=c( names (merged[,-(1:2)]) )
                     )
  tidy_data = dcast(new_merged,Subjects+Activity~variable,mean)
  
  ##write data to txt
  write.table(tidy_data, file = "tidy_data.txt", row.name=FALSE)
  
}
