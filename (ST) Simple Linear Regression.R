#setwd("D:/Code/ML_AI_Course/Machine Learning A-Z New/Part 2 - Regression/Section 4 - Simple Linear Regression")

# Simple Linear Regression

# Imprting Data
dataset = read.csv("Salary_Data.csv")

# Spliting into Test set and Training set
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting Simple Linear Regression to the Training set
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

# Predicting the test set
y_pred = predict(regressor, newdata = test_set)

# Visualising the Training set results
# install.packages('ggplot2')
# library(ggplot2)
# step by step approach
ggplot() + 
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle("Salary Vs Experience (Training set)") +
  xlab('Years of Experience') +
  ylab('Salary')

# Visualising the Test set data
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red') +
  geom_line(aes(x = test_set$YearsExperience, y = y_pred),
            colour = 'blue') +
  ggtitle("Salary Vs Experience (Test set)") +
  xlab("Years of Experience")+
  ylab("Salary")

