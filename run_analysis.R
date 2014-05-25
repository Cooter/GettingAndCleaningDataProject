## Get features - column names for x 
##     activity - activity names
fileFeatures <- "UCI HAR Dataset/features.txt"
fileActivity <- "UCI HAR Dataset/activity_labels.txt"
features <- read.table(fileFeatures, header=F, colClasses=c("numeric", "character"))
activity <- read.table(fileActivity, header=F, stringsAsFactors=F)

#### Create Training data.frame
fileTrainX <- "UCI HAR Dataset/train/X_train.txt"
fileTrainY <- "UCI HAR Dataset/train/y_train.txt"
fileTrainSub <- "UCI HAR Dataset/train/subject_train.txt"


xTrain <- read.table(fileTrainX, header=F, colClasses="numeric")
yTrain <- read.table(fileTrainY, header=F, colClasses="numeric")
subTrain <- read.table(fileTrainSub, header=F, colClasses="numeric")

## Put names on columns
names(xTrain) <- features$V2
names(yTrain) <- "actValue"
names(subTrain) <- "subject"

## Add activity name column to yTrain
yTrain$activity <- activity[yTrain$actValue,]$V2

## Create a descriptive column
dfTrain <- data.frame(type = rep("Train", nrow(yTrain)), stringsAsFactors=F)

## add yTrain
dfTrain <- cbind(dfTrain, yTrain)
## add subject
dfTrain <- cbind(dfTrain, subTrain)
## add XTrain
dfTrain <- cbind(dfTrain, xTrain)

#### Create Testing data.frame
fileTestX <- "UCI HAR Dataset/test/X_test.txt"
fileTestY <- "UCI HAR Dataset/test/y_test.txt"
fileTestSub <- "UCI HAR Dataset/test/subject_test.txt"


xTest <- read.table(fileTestX, header=F, colClasses="numeric")
yTest <- read.table(fileTestY, header=F, colClasses="numeric")
subTest <- read.table(fileTestSub, header=F, colClasses="numeric")

## Put names on columns
names(xTest) <- features$V2
names(yTest) <- "actValue"
names(subTest) <- "subject"

## Add activity name column to yTest
yTest$activity <- activity[yTest$actValue,]$V2

## Create a descriptive column
dfTest <- data.frame(type = rep("Test", nrow(yTest)), stringsAsFactors=F)

## add yTest
dfTest <- cbind(dfTest, yTest)
## add subject
dfTest <- cbind(dfTest, subTest)
## add XTest
dfTest <- cbind(dfTest, xTest)

## Combine the dataframes
df <- rbind(dfTest, dfTrain)

## Get the columns that refer to means and std
## Note: I need to use -mean( to avoid -meanFreq
cols <- grep("-std|-mean\\(", names(df))
## Add in first 4 columns of information
cols <- c(1:4, cols)
## Subset df to just means and std columns
df <- df[,cols]

## In reading csv files read.csv does not like _() in column names
## Thus I will replace "-" with "_", and remove ()
names(df) <- gsub("-", "_", names(df))
names(df) <- gsub("\\(\\)", "", names(df))

## Create a new tidy data.frame with average of each variable for each subject
## and each activity
dfavg <- aggregate(df[-1:-4], list(df$activity, df$subject), mean)

## Set the names of the first 2 columns of dftd
names(dfavg)[1:2] <- c("activity", "subject")

## Since the variables are different here, I am going to add a avg_ suffix
## to remind us these are averages
names(dfavg)[-1:-2] <- paste("avg_", names(dfavg)[-1:-2], sep="")

## Write data.frames to files
## write.csv(df, "UCIHarMeansSTDs.csv", quote=T, row.names=F)

write.csv(dfavg, "UCIHarAvgBySubjectActivity.csv", quote=T, row.names=F)

## Create a .txt file for uploading on the class site
## write.csv(dfavg, "UCIHarAvgBySubjectActivity.txt", quote=T, row.names=F)











