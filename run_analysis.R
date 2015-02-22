# 1 Merges the training and the test sets to create one data set.
testdf <- read.table(file="UCI HAR Dataset/test/X_test.txt")
testsub <- read.table(file="UCI HAR Dataset/test/subject_test.txt")
# subsetting testset mean() and std()
cols <- c(1,2,3,41,42,43,81,82,83,121,122,123,161,162,163,201,214,227,240,253,266,267,268,345,346,347,424,425,426,503,516,529,542,4,5,6,44,45,46,84,85,86,124,125,126,164,165,166,202,215,228,241,254,269,270,271,348,349,350,427,428,429,504,517,530,543)
testdf <- testdf[, cols]
testdf$subject <- testsub[, 1]

traindf <- read.table(file="UCI HAR Dataset/train/X_train.txt")
trainsub <- read.table(file="UCI HAR Dataset/train/subject_train.txt")
# subsetting training set mean() and std()
traindf <- traindf[, cols]
traindf$subject <- trainsub[, 1]
# merge test and training set
traindf <- merge(traindf, testdf, all=TRUE)
# assign descriptive names back
features <- read.table(file="UCI HAR Dataset/features.txt")
i=1
for (col in cols) {
    colnames(traindf)[i] = as.character(features[col, 2])
    i=1+i
}
#

#output
write.table(traindf, file="output.txt", row.names=FALSE)
