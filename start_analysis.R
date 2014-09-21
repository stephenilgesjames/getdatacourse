
## Get the files into the R environment */




x_train<-read.table(file='./train/X_train.txt')
y_train<-read.table(file='./train/y_train.txt')
x_test<-read.table(file='./test/X_test.txt')
y_test<-read.table(file='./test/y_test.txt')
features<-read.table(file='features.txt')
subject_train<-read.table(file='./train/subject_train.txt')
subject_test<-read.table(file='./test/subject_test.txt')

## get the col names on the data for test //
colnames(x_test)<-features$V2
colnames(subject_test)<-"subjects"
colnames(y_test)<-"activity"

##combine the columns

test<-cbind(subject_test,y_test,x_test)

## get the col names for the data for train 

colnames(x_train)<-features$V2
colnames(subject_train)<-"subjects"
colnames(y_train)<-"activity"

##combine the columns
train<-cbind(subject_train,y_train,x_train)

## combine the rows of test and train
tt<-rbind(train,test)
tt_mean <- tt[,select_vars(names(tt),contains("Mean"))]
tt_std<- tt[,select_vars(names(tt),contains("Std"))]

subject<- rbind(subject_train,subject_test)
colnames(subject)<-"subjects"
activity<-rbind(y_train,y_test)

colnames(activity)<-"activities"

act1 <- mutate(subset(activity,activities==1),activities_name='WALKING')
act2 <- mutate(subset(activity,activities==2),activities_name='WALKING_UPSTAIRS')
act3 <- mutate(subset(activity,activities==3),activities_name='WALKING_DOWNSTAIRS')
act4 <- mutate(subset(activity,activities==4),activities_name='SITTING')
act5 <- mutate(subset(activity,activities==5),activities_name='STANDING')
act6 <- mutate(subset(activity,activities==6),activities_name='LAYING')
act <- rbind(act1,act2,act3,act4,act5,act6)



tta<- cbind(subject,act,tt_mean, tt_std)

tta_act<-ddply(tta,.(activities_name),avgs=avg(select_vars()))
tta_subject<-ddply(tta,.(subjects),avgs=avg(select_vars()))
newtt <-rbind(tta_act, tta_subject)

write.table(newtt,file="newtt.txt",row.name=FALSE)






