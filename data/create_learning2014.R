#Bram Berntzen, 5.11.2018, data wrangling

#First exercise week 2

#Read the learning2014 data into R
lrn14 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)

#data structure (variable info)
str(lrn14)

#data dimensions (nr. of rows and columns, or observations and variables)
dim(lrn14)

#Check column names of lrn14
colnames(lrn14)

#create column 'attitude' by scaling the column "Attitude" by the total number of attitude aspects, which is 10
lrn14$attitude <- lrn14$Attitude / 10

#Make vectors for deep, surface and strategic learning questions
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

#install dplyr with install.packages("dplyr")
#Access dplyr library
library(dplyr)

#select the columns related to deep learning and create column 'deep' by averaging
deep_columns <- select(lrn14, one_of(deep_questions))
lrn14$deep <- rowMeans(deep_columns)

#select the columns related to surface learning and create column 'surf' by averaging
surface_columns <- select(lrn14, one_of(surface_questions))
lrn14$surf <- rowMeans(surface_columns)

#select the columns related to strategic learning and create column 'stra' by averaging
strategic_columns <- select(lrn14, one_of(strategic_questions))
lrn14$stra <- rowMeans(strategic_columns)

#Exclude observations that have zero points, and change at the same time 'Points' to 'points'
lrn14 <- filter(lrn14, Points > 0)

# print out the column names of the data
colnames(lrn14)

#Keep the the variables gender, age, attitude, deep, stra, surf and points
keep_columns <- c("gender","Age","attitude", "deep", "stra", "surf", "Points")
learning2014 <- select(lrn14, one_of(keep_columns))

#Check if the data now has 166 observations and 7 variables
dim(learning2014)

# change 'Age' to 'age' and 'Points' to 'points'
colnames(learning2014)[2] <- "age"
colnames(learning2014)[7] <- "points"

# print out the new column names of the data
colnames(learning2014)

#Figure out which working directory is used by R and change it to the IODS prohect folder through "Session", "set working directory", "choose directory" -> "IODS project folder"
getwd()

#Save as .csv file
write.csv(learning2014, file = "learning2014")

#Read .csv file
read.csv(file = "learning2014")

#Use str and head to make sure the structure of the file is correct
str(learning2014)
head(learning2014)
