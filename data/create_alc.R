#Bram Berntzen, 7.11.2018, student performance data. data wrangling week 3. 

#Read student_mat.csv and student_por.csv into R
student_mat <- read.csv(file = "student-mat.csv")
student_por <- read.csv(file = "student-por.csv")

#data structure
str(student_mat)
str(student_por)

#data dimensions
dim(student_mat)
dim(student_por)

#Check column names of mat and por
colnames(student_mat)
colnames(student_por)

url <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets"

# web address for math class data
url_math <- paste(url, "student-mat.csv", sep = "/")

# print out the address
url_math

# read the math class questionaire data into memory
math <- read.table(url_math, sep = ";" , header=TRUE)

# web address for portuguese class data
url_por <- paste(url, "student-por.csv", sep ="/")

# read the portuguese class questionaire data into memory
por <- read.table(url_por, sep = ";", header = TRUE)

# look at the column names of both data
colnames(math)
colnames(por)


# access the dplyr library
library(dplyr)

#Join the two data sets using the variables "school", "sex", "age", "address", "famsize", "Pstatus", "Medu", "Fedu", "Mjob", "Fjob", "reason", "nursery","internet" as (student) identifiers.
join_by <- c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet")

# join the two datasets by the selected identifiers
math_por <- inner_join(math, por, by = join_by, suffix = c(".math", ".por"))

# see the new column names
colnames(math_por)

# glimpse at the data
glimpse(math_por)


str(math_por)
dim(math_por)
glimpse(math_por)
colnames(math_por)


# dplyr, math_por, join_by are available

# print out the column names of 'math_por'
colnames(math_por)

# create a new data frame with only the joined columns
alc <- select(math_por, one_of(join_by))

# columns that were not used for joining the data
notjoined_columns <- colnames(math)[!colnames(math) %in% join_by]

# print out the columns not used for joining
notjoined_columns

# for every column name not used for joining...
for(column_name in notjoined_columns) {
  # select two columns from 'math_por' with the same original name
  two_columns <- select(math_por, starts_with(column_name))
  # select the first column vector of those two columns
  first_column <- select(two_columns, 1)[[1]]
  
  # if that first column  vector is numeric...
  if(is.numeric(first_column)) {
    # take a rounded average of each row of the two columns and
    # add the resulting vector to the alc data frame
    alc[column_name] <- round(rowMeans(two_columns))
  } else { # else if it's not numeric...
    # add the first column vector to the alc data frame
    alc[column_name] <- first_column
  }
}

# glimpse at the new combined data
glimpse(alc)

#create a new column called alc_use by taking the average of the weekday and weekend alcohol use.
library (ggplot2)
#how is this part of the joined data now?
alc <- mutate(alc, alc_use + (Dalc + Walc) / 2)
alc <- mutate(alc, high_use = alc_use > 2)

7.	Glimpse at the joined and modified data to make sure everything
is in order. The joined data should now have 382 observations of 35
variables. Save the joined and modified data set to the 'data' 
folder, using for example write.csv() or write.table() functions. 
(1 point)
#take a glimpse at the alc data
library(tidyr)

gather(alc) %>% glimpse
alc
str(alc)
dim(alc)

write.csv(modified_alc_dataset, file = "modified_alc_dataset")
