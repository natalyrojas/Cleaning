run_Analisys <- function(dir_name){
  
  library(plyr)
  library(dplyr)
  
  ##Load activity labes files
  a_file <- paste("./",dir_name,"/activity_labels.txt",sep="")
  activity_labels <- read.table(a_file)
  
  ##Load test files
  x_file <- paste("./",dir_name,"/test/X_test.txt",sep="")
  x_test <- read.table(x_file)
  y_file <- paste("./",dir_name,"/test/y_test.txt",sep="")
  y_test <- read.table(y_file)
  s_file <- paste("./",dir_name,"/test/subject_test.txt",sep="")
  subject_test <- read.table(s_file)
  ## Rename variables
  y_test <- rename(y_test,activity=V1)  
  subject_test <- rename(subject_test,subject=V1)
  ## Create Test Data frame
  test.df <- cbind(subject_test,y_test,x_test)
  
  ##Load train files
  x_file <- paste("./",dir_name,"/train/X_train.txt",sep="")
  x_train <- read.table(x_file)
  y_file <- paste("./",dir_name,"/train/y_train.txt",sep="")
  y_train <- read.table(y_file)
  s_file <- paste("./",dir_name,"/train/subject_train.txt",sep="")
  subject_train <- read.table(s_file)
  ## Rename variables
  y_train <- rename(y_train,activity=V1)
  subject_train <- rename(subject_train,subject=V1)
  ## Create Train Data frame
  train.df <- cbind(subject_train,y_train,x_train)
  
  ## Create the merge data frame
  analisys.df = merge(test.df,train.df,all=TRUE)
  
  ##Obtein means and Sds
  x_mean <- select(analisys.df,V1:V561)
  rowmean <- rowMeans(x_mean)
  rowSDs <- apply(x_mean,1,sd)
  
  ## Create a new data frame with means and sd of each measurement
  analisys.df <- cbind(analisys.df,rowmean,rowSDs)
  
  ## Eliminate all the columns with the specifics variables of each measurement
  analisys.df <- select(analisys.df,-(V1:V561))
  
  ## Add a new column with the descriptive activity names
  analisys.df = merge(analisys.df,activity_labels,by.x="activity",by.y="V1",all=TRUE)
  analisys.df <- rename(analisys.df,activity_id=activity,subject_id=subject,measurements_means=rowmean,measurements_SD=rowSDs,activity_name=V2)
  
  
  ## Create the summary data frame
  summary_data <- ddply(analisys.df,~subject_id~activity_name,summarise,mean=mean(measurements_means),mean_SD=mean(measurements_SD))
  summary_data <- rename(summary_data,measurements_mean=mean, measurements_SD_means=mean_SD)
  
  ## Generate the final file
  write.table(summary_data,file="analisys_result.txt",row.name=FALSE)
  
}