# wearable data set
The run_analysis script first read the test data set, include the test subject id and extract the mean and std columns.
it'll do the same for training set and then merge the two into one data frame.
Later it calculats the average of each variable for each activity and each subject and dumps to the output frame.
Inthe end it wrote to output.txt as attached to the submission page.
