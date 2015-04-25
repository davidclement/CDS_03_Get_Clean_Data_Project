
# setup
rootdir <- getwd()
setwd("./UCI HAR Dataset")
activity.labels <- read.table("activity_labels.txt")
variable.labels <- read.table("features.txt")

#test data
setwd("./test")
test <- read.table("X_test.txt")
test.numlabels <- read.table("y_test.txt")
test.subject <- read.table("subject_test.txt")
print(nrow(test))
#print(names(test))

# train data
setwd("../train")
train <- read.table("X_train.txt")
train.numlabels <- read.table("y_train.txt")
train.subject <- read.table("subject_train.txt")
print(nrow(train))

# merge the two
tt <- merge(test,train,all.x=T,all.y=T)
colnames(tt) <- variable.labels[,2]
print(nrow(tt))	

# initialize activity label to numeric code
tt.numlabels <- c(test.numlabels[,1],train.numlabels[,1])
tt$activity <- tt.numlabels

# add the subject codes
tt.subject <- c(test.subject[,1],train.subject[,1])
tt$subject <- tt.subject

# convert numeric code to text label
i <- 1
for (code in tt.numlabels) {
  tt[i,'activity'] <- toString(activity.labels[code,2]);
  i <- i + 1
}

# filter down to means & stddevs
columns <- grep('(mean|std)',colnames(tt),ignore.case=T)
# add the 'activity' column
columns <- append(columns,c(562,563))

# subset the df
tts <- tt[,columns]

# create tidy dataset
library(reshape2)
library(sqldf)
# melt the data into long form 
mtts <- melt(tts,id=c('subject','activity'))
# summarize w/ SQL
td <- sqldf("select subject,variable,activity,avg(value) from mtts group by subject,activity,variable order by subject,variable,activity")


setwd(rootdir)
write.table(td, file="tidydata.txt",row.name=F)


