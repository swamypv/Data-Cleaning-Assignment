This file describes the variables, the data, and any transformations or work that performed to clean up the data

  Variables used to perform cleaning data and store data
  
	subject_test 		: Used to load data from subject_test.txt file
	y_test				: Used to load data from x_test.txt file
	x_test  			: Used to load data from y_test.txt file
	test_data 			: Used store appended test data using cbind
	subject_train 		: Used to load data from subject_train.txt file
	y_train 			: Used to load data from y_train.txt file
	x_train 			: Used to load data from x_rain.txt file
	
	train_data 			: Used store appended train data using cbind
	merged_test_train 	: Merged both test and train data
	features 			: Used to load features data from features.txt
	mean_column			: Stores subset of column means
	sd_column			: Stores subset of column standard deviation 
	tidy_data			: Used to store tidy data before creating means for all feature columns
	split_tidy_data		: Used to store final tidy data after creating means for all columns group by subject and activity
	
  Transformations used to perform cleaning data
  
	Created data frames
	Transposed matrix
	
  