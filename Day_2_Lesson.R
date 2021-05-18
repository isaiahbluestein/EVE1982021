## Day 2 Lesson

########################
##### 2.1 Plotting #####
########################
library(ggplot2)
library(tidyverse)
# useful commands: plot, points, lines, abline, hist, barplot, boxplot
# useful arguments within plot(): main, xlab, ylab, col, pch, cex

## Load msleep dataset from ggplot2 package
#install.packages("ggplot2") #should have installed from yesterday
data(msleep) #this only works if the package ggplot2 is installed as above

## Scatterplots
# plot() -- to make a scatterplot
# plot sleep_total by bodywt (bodyweight)



# or plot response variable as a function "~" of the predictor variable



## Arguments within plotting functions
# "col" argument changes color
# "pch" argument changes point character
# "cex" argument changes size
# "type" argument changes type ("l" = line, "p" = points, "b" = both)
# "lty" argument changes line type
# "bty" changes the border around the plot
# Adding labels to axes and title using "xlab", "ylab", and "main" arguments

# Let's remake the total_sleep against sleep_rem plot and add-in some modifiers
# Choose a pch and make the color blue and give it a bottom+left border




# identify() to identify on specific points






# ablines() adds straight line to existing plot




# legend() to add legend to plot

#more practice plotting
#start by defining points by whether they are greater than sleep_total 16 and storing
#first make a empty column named colors within the msleep dataframe



#store the colors "red" or "black" in the color column for the rows that satisfy the following criteria.


## Histograms
#let's make a histogram of sleep_total and fill it with the color palette rainbow() which needs to know how many colors to use


#let's make a boxplot of sleep_total and order making each one a different color 
#how would you find out how many unique orders are in msleep?

#in plot()



#or boxplot




#Exercise 2.1

#########################
##### 2.2 ggplot #####
#########################

## 2.2 plotting with ggplot2 

# In ggplot the syntax is structured differently than base R plotting. 
#One thing that remains the same and is even more noticible in ggplot is the iterative process of building a plot, one aspect at a time. 

# Let's demonstrate what ggplot can do with the states data set

#load in the data
data(state)
states = as.data.frame(state.x77) # convert data to a familiar format - data frame
str(states) # let's take a look at the dataframe

#make an initial ggplot

#add some axes with the aes() function

states %>% 
  ggplot(aes(x=Population, y = Income))+
  geom_point()+
  geom_smooth(methon="lm")
#lets make a scatterplot of population and income
#we specify which axes we want to be x and y with aes()
#we'll then use geom_point to tell it to make a scatterplot using the data we specified in the first command





#There are many types of plots in ggplot that can be called with `geom_` 
#including `geom_line`, `geom_boxplot` `geom_bar` and many others!
  
#Let's add a line to our plot that of best fit for Population ~ Income. 
#Each time we add something to our plot we use the `+` sign. 
#We'll use `geom_smooth()` to draw a line with the method for `lm` which stands for linear model.





# As you can already see ggplot works with many more parameters drawn in default than plotting in base R. 
# Many of these options can easily be changed with the `theme_` functions. 

states %>% 
  ggplot(aes(x=Population, y = Income))+
  geom_point()+
  geom_smooth(methon="lm")+
  theme_minimal()

# Let's change to a minimal theme which removes the gray backgroun in the back of the plot. Play around with the other themes to see what they change.







# Let's use the `msleep` data set to explore what ggplot can do with character vectors. 
# Make a plot of total sleep against REM sleep and then group by vore.

data("msleep")

msleep %>% 
  ggplot(aes(y=sleep_total, x=sleep_rem, group_by(as.factor(vore)), color=as.factor(vore)))+
           geom_point()+
  labs(y="Sleep Total (hours)", x="Rem Sleep (hours)")
# because our vore vector is a character vector we must convert it to a factor before we can use it to group or color



# That looks fine, but we may want to add axis labels and change the legend. The code below does just that and changes the theme.



# as we add things to the plot the line can get really long, you can hit enter after the plus sign to start a new line








# Our plot at this point is getting very clunky. You can assign what we have so far to an object and continue to add parameters without having to copy and paste the whole plot. 

#assign to an object g


# One final example to share. I use ggplot often with data sets that have multiple character vectors and I want to see how they relate to my continuous variables. 
# For example in the iris dataframe we may be interested in looking at the relationship between Sepal.Length and Sepal.Width for each species. 
# You can look at all of these together with `facet_wrap` or `facet_grid`. 

#plot sepal.length against sepal.width and group by species. Use facet grid for species

ggplot(iris, aes(y=Sepal.Length, x=Sepal.Width, group=Species, color=Species))+
  geom_point()+
  facet_wrap(~Species)+
  geom_smooth(method="lm")


# Finally in ggplot we may be interested in seeing the mean values plotted with error bars for several groups. 
# You can use the function `stat_summary` to find the mean and error around that mean for the given grouping.

# Here's a plot looking at the mean chickweight by time grouped by diet.

#load the data
#data("ChickWeight")






# We'll pick up here on Thursday!

#########################
##### 2.3 apply family #####
#########################
# useful commands: function(), is.na, which, var, length, for(){ }, 
# points, print, paste, plot, unique, sample

#### for loops --------------------

# in many languages, the best way to repeat a calculation is to use a for-loop:
# e.g. square each number 1 to 10
squares = rep(NA, 10) # use rep to create a vector length 10 of NAs to store the result
for (i in 1:10) { # for loop
  squares[i] = i^2
}
squares

### a natural alternative to for-loops in R is using the 'apply' family
### while for-loops apply a function to one item at a time and then go on to the next one, 
### "apply" applies functions to every item at once

### sapply - "simplifying" apply (you want a vector back) ----------------------
?sapply 
# syntax: sapply(X = object_to_repeat_over, FUN = function_to_repeat)

# simple example of sapply over a vector
 # we can use an in-line function definition


# in R, we can also just use short-hand for simple vector calculations:
pi*(1:10)^2

# but unlike the short-hand, sapply can also iterate over elements in a list
listy = list(a = TRUE, b = c("a", "b", "c"), c = 10:100)
str(listy) # look at the structure of 'listy'
length(listy) # look at the length of 'listy'

# use sapply to return a vector for length of each object within the list


# you can also use sapply to create plots!
# e.g. use sapply to plot these 4 dataframes at once:
df1 = data.frame(x1 = 1:10, y1 = 1:10)
df2 = data.frame(x2 = 1:10, y2 = -1:-10)
df3 = data.frame(x3 = 1:10, y3 = 10:1)
df4 = data.frame(x4 = 1:10, y4 = 1:10)

my_list = list(df1, df2, df3, df4) # put 4 data frames together in a list

par(mfrow = c(2,2)) # set up frame for 4 plots
sapply(my_list, plot) # plot my_list with sapply


### Exercise 2.3 apply family


### apply family - applies a function in a repetitive way ----------------------

# build some example data
m = data.frame(x = rnorm(50), y = rnorm(50), z = rnorm(50)) # rnorm generates random #s from the normal distribution

str(m)


### apply ----------------------------------------------------------------------

?apply
# example syntax
# apply(X = over this object, 
# MARGIN 1 for rows or 2 for columns, 
# FUN = apply this function)

apply(m, MARGIN = 2, mean) # apply: 2 (in second argument) indicates columns 

colMeans(m) # built-in function colMeans does the same thing

# we can do the same things across all rows
apply(m, MARGIN = 1, sum) == rowSums(m) # the argument MARGIN = 1 refers to rows 

# we can also pass specific in-line defined functions to apply

# how many elements in each column are negative numbers?
apply(m, 2, function(x)  length(x[x < 0]))

# find the mean of the non-negative numbers in each column
apply(m, 2, function(x)  mean(x[x >= 0]))


### lapply -- "list" apply -----------------------------------------------------
# returns a list while sapply -- "simple" apply -- returns a vector
lapply(1:10, function(x)  x^2) # lapply returns list
sapply(1:10, function(x)  x^2, simplify = FALSE) # same as an lapply
sapply(1:10, function(x)  x^2) # default is simplify = TRUE which retuns a vector


### tapply - "per Type" apply --------------------------------------------------

# load state data
?state
data(state)

states = as.data.frame(state.x77) # convert data to a familiar format - data frame
str(states) # let's take a look at the dataframe

# example syntax --- tapply(variable of interest, grouping variable, function)

# for each US region in our dataset, finds the mean of Frost for states in that region
tapply(states$Frost, state.region, mean) # state.region contains the region information for each state

# you can nest apply statements! Let's find the region average for all the variables in the states dataset
apply(states,
      2, # apply over columns of my_states
      function(x) tapply(x, state.region, mean)) # each column = variable of interest for tapply

### Exercise 3.2 apply and tapply

