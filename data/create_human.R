# I did not finish last week's data wrangling so I'm loading the prepared human data
human <- read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt", sep  =",", header = T)

# structure shows all variables and observations in human and includes info on human development and gender inequality
str(human)

# the human dataset contains 195 observation of 19 variables
dim(human)

# Access dplyr and stringr
library(dplyr)
library(stringr)

# mutate GNI in human with a string command to remove the commas used to indicate thousands and turning them into numeric variables
human$GNI <- str_replace(human$GNI, pattern=",", replace ="") %>% as.numeric 

# keep only the variables we're interested in: "Country", "Edu2.FM", "Labo.FM", "Edu.Exp", "Life.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F" 
keep <- c("Country", "Edu2.FM", "Labo.FM", "Life.Exp", "Edu.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F")
human <- select(human, one_of(keep))

# check for missing values (FALSE indicates this)
complete.cases(human)

# include a missing value indicator column to the dataset
data.frame(human[-1], comp = complete.cases(human))

# filter out all rows with missing values (NA) and indicated with FALSE in the last column
human_ <- filter(human, complete.cases(human))

# look at the last 10 observations of human, it seems like the last 7 variables are regions 
tail(human_, n=10)

# Define the last 7 variables, which contain regional info 
last <- nrow(human_) - 7

# choose everything until the last 7 observations
human_ <- human_[1:last, ]

dim(human_)
# add countries as rownames
rownames(human_) <- human_$Country

# remove the Country variable
human_ <- select(human_, -Country)

# confirmation that data has 155 observations of 8 variables
dim(human_)

#Figure out which working directory is used by R and change it to the IODS prohect folder through "Session", "set working directory", "choose directory" -> "IODS project folder"
getwd()

# set working directory
setwd("C:/Users/Bram/Desktop/Open data science course/GitHub/IODS-project/data")

# save dataset as 'human'
write.table(human_, file = "human_.txt", sep = " ", dec=".", row.names = FALSE, col.names = TRUE)

# read .txt file
human_ <- read.table(file = "human_.txt", header = TRUE, dec = ".")

# confirm that saving and reopening of the file went correctly
str(human_)
dim(human_)
