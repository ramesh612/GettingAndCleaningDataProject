Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip .
Data Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Please refer to the data description link above for a detailed description of the data
Please refer to ```README.md``` for instructions on running ```run_analysis.R```
```run_analysis.R``` performs cleanup of data and creates tidy data by

1. merging the training and test datasets
2. extracting only the required variables based on features.txt
3. applying activity names from activity_lables.txt
4. providing proper lable names.
