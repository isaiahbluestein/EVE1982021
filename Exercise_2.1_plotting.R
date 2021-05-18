### Exercise 2.1 - plotting
# useful commands: hist, barplot, boxplot, plot (for scatter plot)
# useful arguments within plot(): main, xlab, ylab, col, pch, cex

# Read in the data using `data(ChickWeight)`

# Note: this dataset can also be accessed directly from the ChickWeight package in R 
# (see ?ChickWeight)
library(ggplot2)
library(tidyverse)
data("ChickWeight")

# 1. First, explore the data.
#How many chicks are in the dataset? 
#How many different diets are in the experiment? 
 
  
# 2. To visualize the basics of the data, plot weight versus time


# 3. Plot a histogram of the weights of the chicks at the final day of the experiments (i.e. only the chicks who made it to the last day)

ChickWeight %>% 
  filter(Time == 21) %>% 
  

# 4. Create a boxplot where the x-axis represents the different diets and the y-axis is the weights of the chicks at the final day of the experiments

# Try using the package R Color Brewer to generate color palettes. Go to http://colorbrewer2.org/ to vizualize palettes. 
# You can choose palettes that are colorblind safe, print friendly, etc.
# Install R Color Brewer
#install.packages("RColorBrewer")
library("RColorBrewer")

# 4. Define a color pallete with 10 colors and re-plot the histogram of the weights of the chicks at the final day of the experiments in these colors
#Note: if histogram has n breaks and n is less than 10, it will just use first n colors. If n is greater than 10, it will reuse colors.


  