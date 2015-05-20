##First read the Samsung data in the working directory
##subject_test are the subject ids, activity the activity ids, 
##features are the actual datapoints for subjects and activities

subject_test<-read.table("test/subject_test.txt")
activity_test<-read.table("test/y_test.txt")
features_test<-read.table("test/x_test.txt")
subject_train<-read.table("train/subject_train.txt")
activity_train<-read.table("train/y_train.txt")
features_train<-read.table("train/x_train.txt")

##combine test and train
subject<-rbind(subject_test,subject_train)
activity<-rbind(activity_test,activity_train)
features<-rbind(features_test,features_train)

##get the names of the columns read in. Read as characters since will be variable names
featureNames<- read.table("features.txt",stringsAsFactors=FALSE)
activityLabels<-read.table("activity_labels.txt",stringsAsFactors=FALSE)
names(activityLabels)<-c("ActivityCode","Activity")

##extract the name column and apply to the columns for the features
names(features)<-featureNames[[2]]
names(activity)<-"ActivityCode"
names(subject)<-"Subject"
#replace activity codes with labels. dplyr's join preserves order
library(dplyr)
activity2<-join(activity,activityLabels)

##add the subject and activity with cbind
Data<-cbind(subject,activity2[,2],features)
names(Data)[2]<-"Activity"

##Now select the columns with mean and std variables
##vector of the names containing "mean" with grep
##names(Data)[grep("mean",names(Data))]
##pull out all data columns first mean, then std, combine
select<-Data[,c(1,2,grep("mean",names(Data)))]
select2<-Data[,grep("std",names(Data))]
DataSelect<- cbind(select,select2)

##now create tidy data set of means of the variables by Subject and Activity
##aggregate is the easy way to aggregate as means by the two columns
##need to avoid aggregating first two columns which are the factors

means<-aggregate(DataSelect [,3:(ncol(DataSelect))], 
                 list(Subject =DataSelect$Subject,Activity = DataSelect$Activity), 
                 mean, na.action=na.omit)
write.table(means,"tidy.txt",row.name=FALSE)
