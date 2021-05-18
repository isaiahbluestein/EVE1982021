### Exercise - apply family -------------------------------------------------
#### useful commands: function(){ }, apply(), tapply(), hist(), dim(), prod(), sd()

# load state data
?state
data(state)

# this data is stored in a slightly different way than other datasets we've used so far
states = as.data.frame(state.x77) # run this line of code to avoid later confusion


### 01. what is the average population, income, and area of all 50 states? ------


### 02. what is the average area of the states from different regions of the country?
# Hint: use the object state.region in your environment --------------------------

### 03. Plot a histogram for each variable in the states data (Population, Income, Illiteracy etc.)


### 04. let's assume that we don't want to live in a state with high
# illiteracy, high murder, and many freezing days; also assume that each of
# these factors contribute equally to our opinion 
# (Illiteracy * Murder * Frost) = undesirable


### what 10 states should we avoid? ----------------------------------------------
# hint use prod(); and maybe order()

### BONUS 05. use sapply() to plot a histogram of the data below 4 times, 
# in 4 different colors. 
# For extra style, title the plot by it's color, e.g. the red plot is titled "red"
data_to_plot = c(1,3,4,5,6,3,3,4,5,1,1,1,1,1)
par(mfrow = c(2,2))# run this line to set your plot to make 4 plots in total (2rows, 2columns)


### BONUS 06. Standardize all the variables in the states dataset and 
# save your answer to a new dataframe, states_standardized
# Hint: to standardize a variable, you subtract the mean and divide by the standard deviation (sd)


### BONUS 07. Create a histogram again for each variable in the states data,
# but this time label each histogram with the variable names when you plot
# Hint: instead of using apply to iterate over the columns themselves, 
# you can often iterate over the column names with sapply

