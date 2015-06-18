# GettingCleaningDataCourseProject

The run_analysis.R script outputs a file with the means for all the measurements on the mean or standard deviation of the various experimental measurements.
These means have been broken down by each subject performing each activity.

The script follows the steps as specified in the assignment directive. Though, not in the order specified. Also, the script assumes that the UCI HAR Dataset folder is in the working directory.

<h3>Data</h3>
The data was collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:<br>
<a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">Human Activity Recognition Using Smartphones</a><br>

<h3>Steps</h3>
<h5>1.Merges the training and the test sets to create one data set.</h5>
The Test and Train data frames contain the combined data from their respective folders
These are then merged to create the FinalData data frame
<h5>2.Extracts only the measurements on the mean and standard deviation for each measurement. </h5>
The appropriate measurements are extracted and the rest are dropped.
<h5>3.Uses descriptive activity names to name the activities in the data set</h5>
The activity numbers are replaced by their respective names
<h5>4.Appropriately labels the data set with descriptive variable names.</h5>
The column names are changed too with the names now changed to the 561 different measurements(66 of which contain mean and std).
<h5>5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.</h5>
A new data frame is created which follows the tidy data principles. This data frame is written into a text file called tidyData.txt.

<h3>Further Infromation</h3>
For further information, you can see the CodeBook.md file which contains the descripition of the different variables.
