# Regression and model validation
For some reason the Rmarkdown file works perfect, but the knitting doesnt. It gives me imediately the error that it cant find learning2014 .

#```{r}
read.csv(file = "learning2014")
str(learning2014)
dim(learning2014)
```
For question 1 I opened the earlier created dataset "learning2014", which includes variables about various measures of learning.When inspecting the data we see that we have 166 observations of 7 variables: gender, age, attitude, deep, strategic and surface learning, and the total points.

 
#```{r}
#access ggplot2 library
library(ggplot2)
pairs(learning2014)
summary(learning2014)
```
For question 2 we install ggplot2 with: install.packages("ggplot2"). Through the code "pairs" we create a correlation matrix of all variables in learning2014. In this way we get a general overview of the spread of the variables and how they are related with the other measures, without any details on the exact correlations. 

Through "summary" we find an overview of the lowest values of the variables and the interquartiles, mean and maximal values. There are 100 females and 56 males, the age ranges from 17 to 55 years old. The scores for attitude, deep, strategic, and surface learning vary between 1 and 5 approximately. You can find more details in the summary.

```{r}
#create a regression model with multiple explanatory variables
multi_reg <- lm(points ~ attitude + stra + surf, data = learning2014)

#print out a summary of the model
summary(multi_reg)

#Build the new linear model with only significant predictors
multi_reg_sign <- lm(points ~ attitude, data = learning2014)
```
For question 3 I created a multivariate regression model with the function lm under the name multi_reg. I inserted points as the dependent variable, and attitude, strategic and surface learning as the predictors.

From the summary of this model we can conclude that only attitude has a significant assoction with points (P = 0.003 --> this means it is smaller than 0.05, hence significant). One point higher in attitude is associated with 3.395 increase in points. The standard error, which is the range of expected deviation from the estimate, is 0.57. The intercept is the point where the regression line crosses the y-axis, so this is usually the starting point of investigation.

Then, i created a new model without the predictors strategic and surface learning, because these have no significant association with the outcome variable (P>=0.05).


```{r}

summary(multi_reg_sign)
```
With the summary of the new model in question 4, attitude is still strongly significantly associated with points (p = 1.95e-09), and a single point increase in attitude is associated with a 3.5255 increase in points. The multiple R-squared indicates the correlation coefficient of the model, also known as the slope of the regression line, which is 0.1906. 

```{r}
plot(multi_reg_sign, which = c(1,2,5))
```
With the "which" command we can plot 1. residuals vs fitted, 2. Normal Q-Q and 5. Residuals vs Leverage plot required for question 5.

In the residuals vs fitted plot we can see that there is a constant variance, which means that the size of the errors should not depend on the explanatory variables/predictors.
In the Normal Q-Q plot it seems that the lowest (below -2) and highest (over 2) values deviate from the mean (regression line). Hence, the errors of the model are not normally distributed.
From the residuals vs leverage plot we can see whether there are any outliers. It seems like there are no outliers of any concern . The data is not biased by the influence of single observations with an unusual impact.
