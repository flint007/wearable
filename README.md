# wearable data set
The run_analysis.R script first reads the test data set, includes the test subject id and extracts the mean and std columns.
it'll do the same for the training set and then merge the two into one data frame.
Later it calculats the average of each variable for each activity and each subject and dumps to the output data frame. It
restored the variable names from the original data set by appending "Mean" to it. 
Inthe end it wrote to output.txt as attached to the submission page.
