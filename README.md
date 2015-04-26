#Cleaning Data Prop

Here you will find:

  1) run_analists.R, a program to load, cleaning and formatting data from a Human Activity Recognition Using Smartphones Dataset

  2) CodeBook.md

  3) README.md

#run_analisys.R script

This script has a function call run_analisys which receive a name of the directory of the dataset and has as a result a file with the average of each variable for each activity and each subject of the input data set 

To used it you have to be aware of the following instructions:

  - Run the script to install the packages plyr and dplyr:

> install.packages("plyr")

> install.packages("dplyr")

  - Download the experiments dataset from this link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

  - The .zip file must be unzipped **inside** the working directory.

  - Source the run_analysis.R script:

> source("run_analysis.R")

  - Call the function run_Analisys("the_name_of_your_dataset_directory")

> run_Analisys(dir_name) 

  - Once the script ends, a file named **analisys_result.txt** must has been created inside the working directory.
  
  - Check analisys_result.txt to have 4 columns subject_id, activity_name, measurements_mean and measurements_SD_means.

#CodeBook

The book that describes the variables, the data, and any transformations or work that was performed to clean up the data


