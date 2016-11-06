Read me for Week 4 Assignment

objective:

Take a set of data from the zip file below:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

unzip this file directly into your working directory, it unpacks into a directory called "UCI HAR Dataset"

and produce a script which will take the test and train data, filter the columns to only 
contain the mean and std columns and then produce combined summary file which gives the
mean values of each mean and std measure grouped by test subject and activity

the data set consists of some "meta data" which is applicable to both datasets
1.	activity lookups in the activity_labels.txt file
2.	the column names for the datasets in the features.txt file

then we have a data file for each 
train/X_train.txt
test/X_test.txt

which subjects relate to which data rows
train/subject_train.txt
test/subject_test.txt

which activities the subjects were conducting when they produced the data
train/y_train.txt
test/y_test.txt

in our script run_analysis.R we assume that you have unzipped the data files into your working directory

Firstly we load the data into R
Then we restrict the column names to only keep those with mean or std
We tidy up the names a remove white space and make them lower case
we filter the columns on the test and train datasets so we only have the columns we want
we add column heading to our datasets
We join the activity data with the lookup using plyr::join to preserve the order
we can then prepend the subject id and the activity onto our 2 datasets
we then rbind them together
we aggregate the results using dplyr group_by and summarise_each
then change the column names to indicate that we have taken the means of these columns
finally we write out a file using write_table. if you want to load the data 
	simply use read.table with the default arguments
The data is available in a variable called summary_data in R when the script has finished as well as the file output.txt in your working directory
