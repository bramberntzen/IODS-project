# Read the "Human development" and "Gender inequality" datasets into R
hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

#Exploration of datasets
str(hd)
dim(hd)

str(gii)
dim(gii)

summary(hd)
summary(gii)

#check column names
colnames(hd)
colnames(gii)

#change column names of the hd and gii dataset
colnames(hd)[1] <- "hrank"
colnames(hd)[2] <- "ctry"
colnames(hd)[3] <- "hd_index"
colnames(hd)[4] <- "life_exp"
colnames(hd)[5] <- "exp_edu"
colnames(hd)[6] <- "yrs_edu"
colnames(hd)[7] <- "gni"
colnames(hd)[8] <- "gni_hdi"

colnames(gii)[1] <- "grank"
colnames(gii)[2] <- "ctry"
colnames(gii)[3] <- "gi_index"
colnames(gii)[4] <- "mat_mor"
colnames(gii)[5] <- "ado_bir"
colnames(gii)[6] <- "rep_par"
colnames(gii)[7] <- "sec_edu_m"
colnames(gii)[8] <- "sec_edu_f"
colnames(gii)[9] <- "lab_par_m"
colnames(gii)[10] <- "lab_par_f"

#check if column name change is successful
colnames(hd)
colnames(gii)

