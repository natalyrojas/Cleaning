#Code Book

This book that describes the variables, the data, and the transformations to clean up the data

#Variables

- a_file, x_file, y_file, s_file: used to format the complete name of the file that has to be read
- x_test, y_test, subject_test, activity_labels, x_train, y_train, subject_train: dataset contains the test experimets measurements in the input data.
- train.df, test.df: data frame with all the values for a train and test measurements
- analisys.df: the data frame result of merge train and test measurements
- x_mean, rowmean, rowSDs: used to obtain the mean and standart desviation of the rows
- summary_data: data frame with the final result

#Data
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels

#Transformations

> analisys.df = merge(test.df,train.df,all=TRUE)

**analisys.df** dataframe has all the colums of the y, x and subject datasets.

An auxiliary dataframe was created with the 561 variables of each measurement using the select method:

> x_mean <- select(analisys.df,V1:V561)

The objective of the x_mean DF is to calculate the mean and the standard deviation of each row of this dataframe, which means to calculate the mean and standard deviation of each measurement of the experiment.

The *summary_data* dataframe was created applying a ddply function (from the plyr library) to the *analisys.df* dataframe:

> summary_data <- ddply(analisys.df,~subject_id~activity_name,summarise,mean=mean(measurements_means),mean_SD=mean(measurements_SD))

The *summary_data* dataframe has the following columns:

­ **subject_id:** the subject_id of each subject in the experiment

­ **activity_name:** the descriptive name of each activity in the experiment

­ **measurements_mean:** the mean of all the measurements means for each subject and each activity

­ **measurements_SD_means:** the mean of all the measurements standard deviations for each subject and each activity

Others functions used was:

>  y_train <- rename(y_train,activity=V1)
 
 rename: To rename the head of a column
 
> rowSDs <- apply(x_mean,1,sd)

apply: to apply a function to all values in a vector
