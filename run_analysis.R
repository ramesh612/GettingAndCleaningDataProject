# Getting and cleaning data
# Course project

require(plyr)

xtrain.file <- "UCI HAR Dataset/train/X_train.txt"
ytrain.file <- "UCI HAR Dataset/train/Y_train.txt"
strain.file <- "UCI HAR Dataset/train/subject_train.txt"

xtest.file <- "UCI HAR Dataset/test/X_test.txt"
ytest.file <- "UCI HAR Dataset/test/Y_test.txt"
stest.file <- "UCI HAR Dataset/test/subject_test.txt"

features.file <- "UCI HAR Dataset/features.txt"
alabels.file <- "UCI HAR Dataset/activity_labels.txt"

# ----------------------------------------------------------------
# 1. Merges the training and the test sets to create one data set.
# ----------------------------------------------------------------

# Load data
xtrain <- read.table(xtrain.file)
ytrain <- read.table(ytrain.file)
strain <- read.table(strain.file)

xtest <- read.table(xtest.file)
ytest <- read.table(ytest.file)
stest <- read.table(stest.file)

features <- read.table(features.file, colClasses = c("character"))
alabels <- read.table(alabels.file)

# Merge data & label columns
train <- cbind(xtrain, strain, ytrain)
test <- cbind(xtest, stest, ytest)

data <- rbind(train, test)
features <- rbind(features, c(562, "Subject"))
features <- rbind(features, c(563, "ActivityId"))
names(data) <- features$V2

names(alabels) <- c("ActivityId", "Activity")

# ------------------------------------------------------------------------------
# 2. Extracts only the measurements on the mean and standard deviation for each
#    measurement.
# ------------------------------------------------------------------------------

# create a logical vector with T values for the columns we need.
std.mean.cols <- grepl("mean|std|Subject|ActivityId", names(data))
std.mean.data <- data[,std.mean.cols]

# --------------------------------------------------------------------------
# 3. Uses descriptive activity names to name the activities in the data set.
# --------------------------------------------------------------------------
std.mean.data <- join(std.mean.data, alabels, by = "ActivityId", match = "first")
std.mean.data <- std.mean.data[,-1]

# ------------------------------------------------------------
# 4. Appropriately labels the data set with descriptive names.
# ------------------------------------------------------------

names <- names(std.mean.data)

names <- gsub('-mean', 'Mean', names)
names <- gsub('-std', 'Std', names)
names <- gsub('[()-]', '', names)
names <- gsub('BodyBody', 'Body', names)

names(std.mean.data) <- names

# ---------------------------------------------------------------------------
# 5. From the data set in step 4, creates a second, independent tidy data set
#    with the average of each variable for each activity and each subject.
# ---------------------------------------------------------------------------
tidy.data = ddply(std.mean.data, c("Subject","Activity"), numcolwise(mean))
write.table(tidy.data, file = "tidy.txt", row.name = FALSE)
