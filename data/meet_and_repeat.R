# read BPRS and RATS datasets
BPRS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", sep  =" ", header = T)
RATS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", sep  ="\t", header = T)

# check variables name, data content and structure
names(BPRS)
names(RATS)

str(BPRS)
str(RATS)

summary(BPRS)
summary(RATS)

# Access the packages dplyr and tidyr
library(dplyr)
library(tidyr)

# Convert categorical variables of BPRS and RATS to factors: BPRS; Factor treatment & subject. RATS; ...
BPRS$treatment <- factor(BPRS$treatment)
BPRS$subject <- factor(BPRS$subject)

RATS$ID <- factor(RATS$ID)
RATS$Group <- factor(RATS$Group)

# Convert datasets to long form and add week and time variables to BPRS and RATS respectively
BPRSL <- BPRS %>% gather(key = weeks, value = bprs, -treatment, -subject) %>% mutate(week = as.integer(substr(weeks,5,5)))
RATSL <- RATS %>% gather(key = WD, value = Weight, -ID, -Group) %>% mutate(Time = as.integer(substr(WD, 3, 4))) 

# Take a serious look at the datasets and compare wide and long files
str(BPRSL)
str(RATSL)

summary(BPRSL)
summary(RATSL)

#check wide files again for comparison: in the wide file the time frames (week and Time) are separate variables for every time point. In the long form they have been gathered into one variables. In the wide file scores are recorded under the week or day number. In the long file the scores become a separate variable and the week numbers as well. 
str(BPRS)
str(RATS)

summary(BPRS)
summary(RATS)

#Figure out which working directory is used by R and change it to the IODS project data folder
getwd()

# set working directory
setwd("C:/Users/Bram/Desktop/Open data science course/GitHub/IODS-project/data")

# save long files of the dataset as BPRSL and RATSL
write.table(BPRSL, file = "BPRSL.txt", sep = " ", dec=".", row.names = FALSE, col.names = TRUE)
write.table(RATSL, file = "RATSL.txt", sep = " ", dec=".", row.names = FALSE, col.names = TRUE)

# read .txt file
PBRSL2 <- read.table(file = "BPRSL.txt", header = TRUE, dec = ".")
RATSL2 <- read.table(file = "RATSL.txt", header = TRUE, dec = ".")

# confirm that saving and reopening of the file went correctly
str(PBRSL2)
str(RATSL2)

summary(PBRSL)
summary(RASL)

