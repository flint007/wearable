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
# 
library(plyr)
# average of each variable for each activity and each subject.
out <- ddply(traindf, "subject", function(x) {
  for (i in 1:(ncol(traindf)-1)) {
    assign(paste("c", i, sep = ""), mean(x[,i]))
  }
  data.frame(c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,
             c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31,c32,c33,c34,c35,c36,c37,c38,
             c39,c40,c41,c42,c43,c44,c45,c46,c47,c48,c49,c50,c51,c52,c53,c54,c55,c56,
             c57,c58,c59,c60,c61,c62,c63,c64,c65,c66)
})

# assign descriptive names back
features <- read.table(file="UCI HAR Dataset/features.txt")
i=2
for (col in cols) {
    colnames(out)[i] = as.character(features[col, 2])
    i=1+i
}

#output
write.table(out, file="output.txt", row.names=FALSE)
