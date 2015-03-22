## Variables
UCIdir is a directory to download the data into.
x_tr, x_test, y_tr, y_test, subject_tr and subject_test contain the data from the downloaded dataset.
x.dat, y.dat and subject.dat merge the training and test data for x,y, and subject respectively using rbind.
features contains the column names for x.dat dataset.
mean_and_std is a numeric vector used to filter for  only the names from features that contain "mean" or "std"
activities is a numeric vector containing the column numbers referring to the desired activities columns in y.dat.
all_data merges x.dat, y.dat and subject.dat using cbind.
averages.dat contains the averages for the data in the selected columns (those containing "mean" or "std" in their names), calculated using  colMeans.
