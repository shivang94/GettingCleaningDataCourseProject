X_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
sub_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
sub_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
names(sub_test)<-"Subject"
names(sub_train)<-"Subject"
names(y_train)<-"Activity"
names(y_test)<-"Activity"
names(X_test)<-c(1:561)
names(X_train)<-c(1:561)
Test<-cbind(sub_test,y_test,X_test) # Combined the test data
Train<-cbind(sub_train,y_train,X_train) # Combined the training data
FinalData<-rbind(Train,Test) # Combined the test and training data
features<-read.table("./UCI HAR Dataset/features.txt")
actlabels<-read.table("./UCI HAR Dataset/activity_labels.txt")
names(FinalData)[3:563]<-as.character(features[,2]) # Giving appropriate variable names
FinalData$Activity<-actlabels[FinalData$Activity,2] # Replacing activity labels with the respective names
a<-grep("mean",names(FinalData),fixed=TRUE)
b<-grep("std",names(FinalData),fixed=TRUE)
mf<-grep("meanFreq",names(FinalData),fixed=TRUE)
col<-c(1,2,a,b)
col<-sort(col)
FinalData<-FinalData[,col]
FinalData<-FinalData[,-mf] # Extracting those columns with measurements for mean and standard deviation only
names(FinalData)<-make.names(names(FinalData))
ColMeans <- function(data) { colMeans(data[,-c(1,2)]) }
tidyData<-ddply(FinalData,.(Subject,Activity),ColMeans)
write.table(tidyData,"tidyData.txt",row.names=FALSE)