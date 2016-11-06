#libraries
library(plyr)
library(dplyr)

#######load the data from the UCI HAR dataset
#these two apply across both dataset
#activity lookup data
activity_labels_data <- read.table("./data/UCI HAR Dataset/activity_labels.txt", header=FALSE)
#features data (column names)
features_data <- read.table("./data/UCI HAR Dataset/features.txt", header=FALSE)

#these datasets are specific to the train or test datasets
train_subject_data <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", header=FALSE)
train_feature_data <- read.table("./data/UCI HAR Dataset/train/y_train.txt", header=FALSE)
train_data <- read.table("./data/UCI HAR Dataset/train/X_train.txt", header=FALSE)

test_subject_data <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", header=FALSE)
test_feature_data <- read.table("./data/UCI HAR Dataset/test/y_test.txt", header=FALSE)
test_data <- read.table("./data/UCI HAR Dataset/test/X_test.txt", header=FALSE)
#####finished data load

#we only need data for the mean & std columns
#we can make sure we only get this by restricting the features data to only have columns
#which we need. The interpretation here is that this means mean() and std() NOT meanFreq columns
features_data <- features_data[grep("mean[(]|std[(]", features_data$V2),]

#we might also take the opportunity to tidy up the names 
#in this case we will remove brackets and - and capitals and whitespace
# we use gsub and the regexp to replace ()-
features_data$V2 <- gsub("-|[()]| ","", tolower(features_data$V2))

#now lets cut out test_data & train_data so we only have the columns we need
test_data <- test_data[,features_data$V1]
train_data <- train_data[,features_data$V1]

#lets do the lookup for the features_data as well and join it to the activity labels data 
#so we have that in one place. we do this using plyr join as this retains the order
test_feature_data <- join(test_feature_data, activity_labels_data, by="V1")
train_feature_data <- join(train_feature_data, activity_labels_data, by="V1")

#add column headings into our datasets
names(test_data) <- features_data$V2
names(train_data) <- features_data$V2

#prepend the subject data and the activity data
test_data <- cbind(activity=test_feature_data$V2, test_data)
train_data <- cbind(activity=train_feature_data$V2, train_data)

test_data <- cbind(subjectid=test_subject_data$V1, test_data)
train_data <- cbind(subjectid=train_subject_data$V1, train_data)

#merge the data sets together
total_data <- rbind(test_data, train_data)

#aggregate the results as specified
summary_data <- total_data %>% group_by(subjectid, activity) %>% summarise_each(funs(mean))

#append .mean on to the summarized data columns so we know they have been aggregated
new_names <- paste(colnames(summary_data), "mean", sep=".")
new_names[1]="subjectid"
new_names[2]="activity"
colnames(summary_data) <- new_names

#output the dataset
write.table(summary_data, file="./output.txt", row.name=FALSE)



