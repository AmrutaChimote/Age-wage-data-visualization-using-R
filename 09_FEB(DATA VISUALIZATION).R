# Exploratory Data Analysis in R with ggplot2 and dplyr:
install.packages("ggplot2")
# install.packages("dplyr")
install.packages("ISLR")

library(ggplot2) #data visualization
library(dplyr) #data manipulation
library(ISLR) #for the dataset

Wage = select(Wage, age, maritl, education, jobclass, wage)
View(Wage)
head(Wage, 3)

str(Wage)

# ggplot(data, aes(variables)) + geom
# The data should always be a data.frame
# Put the variables (columns in your dataframe) inside aes.
# Use the geom that you want

ggplot(data = Wage, aes(x = age, y = wage)) 

# Ggplot just draws the axes since we haven't told it what type of plot we want.
# We can do that using geoms.

ggplot(data = Wage, mapping = aes(x = age, y = wage)) + 
  geom_point()

# Base R comparison:
plot(Wage$age, Wage$wage)

# ggplot is more verbose for simple / canned graphics 
# But less verbose for complex / custom graphics

# This syntax might take a bit to get used to but once you have it set up all 
# you have to do is change the geom and/or the variables inside aes 
# and you can create (almost) any plot that you can think of.


# Stack layers on top of each other using different geoms:


ggplot(data = Wage, mapping = aes(x = age, y = wage)) +
  geom_bin2d() +
  geom_density_2d() +
  geom_point()


ggplot(data = Wage, mapping = aes(x = age, y = wage)) +
  geom_density_2d() +
  geom_point()

ggplot(data = Wage, mapping = aes(x = age, y = wage)) +
  geom_bin2d() +
  geom_point()
# Inside the geoms you can fine tune your visualization:

ggplot(data = Wage, mapping = aes(x = age, y = wage)) +
  geom_point(alpha = 0.1, color = "blue", size = 5)+ geom_density_2d(color = "red") 

ggplot(data = Wage, mapping = aes(x = age, y = wage)) +
  geom_point(alpha = 0.5) +
  geom_smooth()

ggplot(data = Wage, mapping = aes(x = age, y = wage)) +
  geom_point(alpha = 0.5) + geom_smooth()


# A closer look at aes - or how to pick your variables:
# Say you'd like to color your points based on another categorical feature - 
# make sure to put color inside the aes function.

ggplot(data = Wage, mapping = aes(x = age, y = wage, color = maritl)) +
  geom_point()

ggplot(data = Wage, mapping = aes(x = age, y = wage, color = education)) +
  geom_point()+geom_smooth()


ggplot(data = Wage, mapping = aes(x = age, y = wage, color = education)) +
  geom_point()

# Aes can be tricky but you can always overwrite the overall aes with putting an aes in your:
ggplot(data = Wage, mapping = aes(x = age, y = wage)) +
  geom_point() +
  geom_smooth(aes(color = education)) 

# Faceting:
ggplot(data = Wage, mapping = aes(x = age, y = wage)) +
  geom_point() +
  geom_smooth(aes(color = education)) +
  facet_wrap( ~ education)



ggplot(data = Wage, mapping = aes(x = age, y = wage)) +
  geom_point() +
  geom_smooth(aes(color = maritl)) +
  facet_wrap(~ maritl)

ggplot(data = Wage, mapping = aes(x = age, y = wage)) +
  geom_point() +
  geom_smooth(aes(color = jobclass)) +
  facet_wrap(~education)
# Hist

ggplot(Wage, aes(x = age)) +
  geom_histogram(bins = 10)
