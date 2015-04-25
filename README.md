# get_clean_data_class_project
Coursera + Johns Hopkins Get and Clean Data Class Project

# motivation
The script run_analysis.R was written as coursework for the class "Getting and Cleaning Data
by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD" on Coursera.org

# acknowledgements
The script manipulates data from the following dataset:
Human Activity Recognition Using Smartphones Dataset Version 1.0
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
The data is available here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# how the script works
- load the activity and variable labels that describe the labeled activities and each of the measurements and calculations
- load the test data into a data frame, with each measurement type as column, each observation "window" as row.
- load the test subject labels assocated w/ the test data
- load the activity labels associated with the test data
- load the training data into a data frame
- load the training subject labels assocated w/ the training data
- load the activity labels associated with the training data
- merge the test and training data into one data frame
- apply numeric activity lables as new column to merged data frame
- apply test subject identifiers as new column to merged data frame
- loop through the data frame and convert numeric activity labels to descriptive strings
- find column names that contain either "mean" or "std" in 
- subset the data frame eliminating all variable names that aren't means or standard devs using above list
- load reshape2 and sqldf libraries
- melt the data into long form so that the columns are now "subject","activity","variable" and "value"
- roll-up the data by averaging the value column for each subject,variable,activity combination
- write the final data frame to file

# Code Book
see separate file

