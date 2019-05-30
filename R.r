
# load file using <readr> package [which is part of the core tidyverse.]
library(tidyverse)
read_csv()  # reads comma-delimited files
read_csv2() # reads semicolon-separated files (common in countries where , is used as the decimal place)
read_tsv() # reads tab-delimited files
read_delim() #reads in files with any delimiter.


# -----------------------------------
# You can also supply an inline CSV file. This is useful for experi‐ menting with readr and for creating reproducible examples to share with others:
df <- read_csv("a,b,c
1,2,3
4,5,6")
# now <df> is dataframe, contain 3 columns
# -----------------------------------
# skip n rows from begining of csv file
read_csv(file_name, skip = n)
# -----------------------------------
# skip comments lines from csv file
read_csv(file_name, comment = "#")
# -----------------------------------
# if the file don't contain column names then you have to tell read_csv not to treat first row as a heading.
read_csv(file_name, col_names = FALSE)
# if you want to specify column names:
read_csv(file_name, col_names = c("x", "y", "z"))
# -----------------------------------
# specify how treat missing values
read_csv(file_name, na = ".") # all missing values fills with <.>
# -----------------------------------
# Parsing a Vector
str(parse_logical(c("TRUE", "FALSE", "NA")))
#> logi [1:3] TRUE FALSE NA
str(parse_integer(c("1", "2", "3")))
#> int [1:3] 1 2 3
str(parse_date(c("2010-01-01", "1979-10-14")))
#> Date[1:2], format: "2010-01-01" "1979-10-14"

# <na> argument specifies which strings should be treated as missing:
parse_integer(c("1", "231", ".", "456"), na = ".")
#> [1] 1 231 NA 456

# if parsing fails, you’ll get a warning:
x <- parse_integer(c("123", "345", "abc", "123.45"))
#> Warning: 2 parsing failures.
#> row col expected actual
#> 3 -- an integer abc
#> 4 -- no trailing characters .45
# And the failures will be missing in the output:
x
#> [1] 123 345 NA NA
#> attr(,"problems")
#> # A tibble: 2 × 4
#> row col expected actual
#> <int> <int> <chr> <chr>
#> 1 3 NA an integer abc
#> 2 4 NA no trailing characters .45
# If there are many parsing failures, you’ll need to use problems() to get the complete set. This returns a tibble, which you can then manipulate with dplyr:
problems(x)
#> # A tibble: 2 × 4
#> row col expected actual
#> <int> <int> <chr> <chr>
#> 1 3 NA an integer abc
#> 2 4 NA no trailing characters .45

# There are eight particularly important parsers:
parse_logical() 
parse_integer() 
parse_double() # is a strict numeric parser
parse_number() # is a flexible numeric parser. These are more complicated thanyou might expect because different parts of the world write numbers in different ways.
parse_character() # seems so simple that it shouldn’t be neces sary. But one complication makes it quite important: character encodings.
parse_factor() # creates factors, the data structure that R uses to represent categorical variables with fixed and known values.
parse_datetime(), parse_date(), parse_time() #allow you to parse various date and time specifications. These are the most complicated because there are so many different ways of writing dates.
# -----------------------------------
# plot
# ggplot arguments:
x # x
y # y
color # color 
size #> Warning: Using size for a discrete variable is not advised.
alpha # con trols the transparency of the points, or the shape of the points

ggplot(mpg, aes(x= displ, y=hwy)) + geom_point()

# another way to do the same:
ggplot(data = mpg) +
	geom_point(mapping = aes(x = displ, y = hwy))
# The mapping argument is always paired with aes()
# The color argument for diffrent colors

# size argument
ggplot(data = mpg) +
geom_point(mapping = aes(x = displ, y = hwy, size = class))


# -----------------------------------
# get function arguments list
args(function_name)
# -----------------------------------
# Note:
# One common problem when creating ggplot2 graphics is to put the + in the wrong place: it has to come at the end of the line, not the start. In other words, make sure you haven’t accidentally written code like this:
ggplot(data = mpg)
+ geom_point(mapping = aes(x = displ, y = hwy))
# -----------------------------------
# get help
# If you’re still stuck, try the help. You can get help about any R function by running ?function_name in the console
# -----------------------------------
# Facets
ggplot(data = mpg) +
geom_point(mapping = aes(x = displ, y = hwy)) +
	facet_wrap(~ class, nrow = 2)

# To facet your plot on the combination of two variables, add facet_grid() to your plot call. The first argument of  acet_grid() is also a formula. This time the formula should contain two variable names separated by a ~:
ggplot(data = mpg) +
	geom_point(mapping = aes(x = displ, y = hwy)) +
	facet_grid(drv ~ cyl)
# -----------------------------------
# seq <range>
# The function seq() can be used to create a sequence of numbers. For instance, seq(a,b) makes a vector of integers between a and b. There are many other options: for instance, seq(0,1,length=10) makes a sequence of 10 numbers that are equally spaced between 0 and 1. Typing 3:11 is a shorthand for seq(3,11) for integer arguments.

seq(1:10)
# [1]  1  2  3  4  5  6  7  8  9 10
seq(1, 10, length.out = 5)
# [1]  1.00  3.25  5.50  7.75 10.00
# -----------------------------------
# assign and print in one line
(x <- 'amir')
# [1] "amir"
# -----------------------------------
# data types in R
int # stands for integers.
dbl # stands for doubles, or real numbers.
chr # stands for character vectors, or strings.
dttm # stands for date-times (a date + a time)
lgl # stands for logical, vectors that contain only TRUE or FALSE.
fctr #  stands for factors, which R uses to represent categorical variables with fixed possible values.
date # stands for dates.
# -----------------------------------
# dylyr functions
filter # Pick observations by their values.
filter(flights, month == 1, day == 1)
filter()# only includes rows where the condition is TRUE; it excludes both FALSE and NA values. If you want to preserve missing values, ask for them explicitly:
df <- tibble(x = c(1, NA, 3))
filter(df, x > 1)
#> # A tibble: 1 × 1
#> x
#> <dbl>
#> 1 3
filter(df, is.na(x) | x > 1)
#> # A tibble: 2 × 1
#> x
#> <dbl>
#> 1 NA
#> 2 3
#####################
arrange # Reorder the rows
# like df.sort()
arrange(flights, desc(arr_delay))
df <- tibble(x = c(5, 2, NA))
arrange(df, x)
#> # A tibble: 3 × 1
#> x
#> <dbl>
#> 1 2
#> 2 5
#> 3 NA
arrange(df, desc(x))
#> # A tibble: 3 × 1
#> x
#> <dbl>
#> 1 5
#> 2 2
#> 3 NA
#####################
select # Pick variables by their names
select(flights, year, month, day) # same as flights[['year', 'month', 'day']]

# Select all columns between year and day (inclusive)
select(flights, year:day)

# Select all columns except those from year to day (inclusive)
select(flights, -(year:day))

# There are a number of helper functions you can use within select():
starts_with("abc") # matches names that begin with “abc”.
ends_with("xyz") # matches names that end with “xyz”.
contains("ijk") # matches names that contain “ijk”.
matches("(.)\\1") # selects variables that match a regular expression. This one matches any variables that contain repeated characters.
num_range("x", 1:3) # smatches x1, x2, and x3.

# select() can be used to rename variables, but it’s rarely useful because it drops all of the variables not explicitly mentioned. Instead, use rename(), which is a variant of select() that keeps all the variables that aren’t explicitly mentioned: rename(flights, tail_num = tailnum)

select(flights, time_hour, air_time, everything())
# pehly <time_hour> pihr <air_time> or phir baqi sary varables hon gy, yani k variables ka order change ho jay ga.

#####################

mutate # Create new variables with functions of existing variables
# mutate() always adds new columns at the end of your dataset
flights_sml <- select(flights,
	year:day,
	ends_with("delay"),
	distance,
	air_time)
mutate(flights_sml,
	gain = arr_delay - dep_delay,
	speed = distance / air_time * 60)

# If you only want to keep the new variables, use transmute():
transmute(flights,
	gain = arr_delay - dep_delay,
	hours = air_time / 60,
	gain_per_hour = gain / hours
	)

# another example
# add a variable for whether this household owns land
farmData <- farmData %>%
    mutate(landowner = (tenure1 == 1 | tenure1 == 2)) 

##################################################

summarize # Collapse many values down to a single summarizey
# These can all be used in conjunction with group_by()
summarize(flights, delay = mean(dep_delay, na.rm = TRUE))
#> # A tibble: 1 × 1
#> delay
#> <dbl>
#> 1 12.6
# if we applied this code to a data frame grouped by date, we get the average delay per date:
by_day <- group_by(flights, year, month, day)
summarize(by_day, delay = mean(dep_delay, na.rm = TRUE))
#> Source: local data frame [365 x 4]
#> Groups: year, month [?]
#>
#> year month day delay
#> <int> <int> <int> <dbl>
#> 1 2013 1 1 11.55
#> 2 2013 1 2 13.86
#> 3 2013 1 3 10.99
#> 4 2013 1 4 8.95
#> 5 2013 1 5 5.73
#> 6 2013 1 6 7.15
#> # ... with 359 more rows
# -----------------------------------
# Comparisons
# R provides the standard suite: 
>, >=, <, <=, !=, ==
# -----------------------------------
# There’s another common problem you might encounter when using ==: floating-point numbers. These results might surprise you!
sqrt(2) ^ 2 == 2
#> [1] FALSE
1/49 * 49 == 1
#> [1] FALSE
# Computers use finite precision arithmetic (they obviously can’t store an infinite number of digits!) so remember that every number you see is an approximation. Instead of relying on ==, use near():
near(sqrt(2) ^ 2, 2)
#> [1] TRUE
near(1 / 49 * 49, 1)
#> [1] TRUE
# -----------------------------------
# OR
filter(flights, month == 11 | month == 12)
# as same as:
filter(flights, month %in% c(11, 12))
# -----------------------------------
# if you wanted to find flights that weren’t delayed (on arrival or departure) by more than two hours, you could use either of the following two filters:
filter(flights, !(arr_delay > 120 | dep_delay > 120))
filter(flights, arr_delay <= 120, dep_delay <= 120)
# -----------------------------------
# missing values Na
# If you want to determine if a value is missing, use is.na():
is.na(x)
[1] TRUE
# -----------------------------------
# Modular arithmetic (%/% and %%) %/% (integer division) and %% (remainder), where x == y * (x %/% y) + (x %% y). Modular arithmetic is a handy tool because it allows you to break integers into pieces. For example, in the flights dataset, you can compute hour and minute from dep_time with:
transmute(flights,
	dep_time,
	hour = dep_time %/% 100,
	minute = dep_time %% 100)
#> # A tibble: 336,776 × 3
#> dep_time hour minute
#> <int> <dbl> <dbl>
#> 1 517 5 17
#> 2 533 5 33
#> 3 542 5 42
#> 4 544 5 44
#> 5 554 5 54
#> 6 554 5 54
#> # ... with 3.368e+05 more rows
# -----------------------------------
# Cumulative and rolling aggregates
# R provides functions for running sums, products, mins, and maxes: cumsum(), cumprod(), cummin(), cummax(); and dplyr provides cummean() for cumulative means. If you need rolling aggregates (i.e., a sum computed over a rolling window), try the RcppRoll package:
x
#> [1] 1 2 3 4 5 6 7 8 9 10
cumsum(x)
#> [1] 1 3 6 10 15 21 28 36 45 55
cummean(x)
#> [1] 1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0 5.5
# -----------------------------------
# There are a number of ranking functions, but you should start with min_rank(). It does the most usual type of ranking (e.g.,first, second, third, fourth). The default gives the smallest values the smallest ranks; use desc(x) to give the largest values the smallest ranks:
y <- c(1, 2, 2, NA, 3, 4)
min_rank(y)
#> [1] 1 2 2 NA 4 5
min_rank(desc(y))
#> [1] 5 3 3 NA 2 1

# If min_rank() doesn’t do what you need, look at the variants row_number(), dense_rank(), percent_rank(), cume_dist(), and ntile(). See their help pages for more details
row_number(y)
#> [1] 1 2 3 NA 4 5
dense_rank(y)
#> [1] 1 2 2 NA 3 4
percent_rank(y)
#> [1] 0.00 0.25 0.25 NA 0.75 1.00
cume_dist(y)
#> [1] 0.2 0.6 0.6 NA 0.8 1.0
# -----------------------------------
# read_csv k output me 1 lamba msg columns k mutalliq print hota h, usy ignore karny k lye:
col_types = cols()
# -----------------------------------
# pipe
piped <- 3.14152 %>%
    round(1.5690)

piped == round(3.14152, 1.5690) # the same as the above pipeline
piped == round(1.5690, 3.14152) # different than the above pipelines

# another example:
# get a list of all column names in alphabetic order 
columnsAlphaOrder <- farmData %>% # take farmData and...
    names() %>% # get the column names and...
    sort() # sort alphabetically
# -----------------------------------
# select all dataframe except / minus one particuler column
farmData %>% # take the farmData data frame and...
    select(-gender1) %>% # select every column *except* gender1 and...
    head() # return just the first six lines
# -----------------------------------
# select only numeric columns
# select just the numeric columns
diseaseInfo_numeric <- diseaseInfo_humansRemoved %>%
    select(-Id) %>% # the case id shouldn't contain useful information
    select(-c(longitude, latitude)) %>% # location data is also in country data
    select_if(is.numeric) # select remaining numeric columns
# -----------------------------------
# shuffle the dataframe
df <- df[sample(1:nrow(df)), ]
# -----------------------------------
# xgboost
 # you can't just pass xgboost a dataframe. The core xgboost function requires data to be a matrix.
 # A matrix is like a dataframe that only has numbers in it. A sparse matrix is a matrix that has a lot zeros in it. XGBoost has a built-in datatype, DMatrix, that is particularly good at storing and accessing sparse matrices efficiently.
 # steps: 
    # Remove information about the target variable from the training data
    # Reduce the amount of redundant information
    # Convert categorical information (like country) to a numeric format
    # Split dataset into testing and training subsets
    # Convert the cleaned dataframe to a Dmatrix

# put our testing & training data into two seperates Dmatrixs objects
dtrain <- xgb.DMatrix(data = train_data, label= train_labels)
dtest <- xgb.DMatrix(data = test_data, label= test_labels)


# steps to follow:
# 1- jo variables nahi chayen un ko remove kar den
# 2- existing variables ki base par doosry variables banana chahen to banaen
# 3- string varibles ko one hot encode kar den
	# one hot encoding me 1 variable k kafi variables ban jaty hen
# 4- sab dataframes [oringal, one hot encodid metrixes] ko cbin kar den.
# 5- is final dataframe ka matrix bana den [dimention dono ki 1 hi hon gi]
# 6- ab is matrix sy train or test split kar len
# 7- train or test ka matrix ka dmatrix bana den.
# 8- data ko model me fit kar den.
# -----------------------------------
# switch TRUE and FALSE
magrittr::not() # switch TRUE and FALSE (using function from the magrittr package)
# -----------------------------------
# Reduce the amount of redundant information
# 1- We also want to make sure we remove columns that have redundant information in them or that we don't want to use to make predictions
# 2- I also want to remove variables that could be very informative due to chance. So, for example, each observation in this dataset has a numeric ID associated with it. It could be that ID's that end with 8 are more likely to be associated with diseases that spread to humans due to pure chance. We wouldn't want to predict that giving a new disease that is given an ID ending with 8 means its more likely to spread to humans, though!
# -----------------------------------
# Convert categorical information (like country) to a numeric format
 # One way to do this is using one-hot encoding. One-hot encoding takes each category and makes it its own column. Then, for each observation, it puts a "0" in that column if that observation doesn't belong to that column and "1" if it does. In R, we can convert a column with a categorical variable in it to a one-hot matrix like so:

# one-hot matrix for just the first few rows of the "country" column
model.matrix(~country-1,head(df))
# You may notice that this new matrix has a lot of zeros in it. This is a good example of the "sparse matrix" 

# Now let's convert the entire "country" column to a big one-hot matrix and save it as a matrix that we can add to our training data later:

# convert categorical factor into one-hot encoding
region <- model.matrix(~country-1,df)
# -----------------------------------
# dataframe all values count row_count * column*count
length(df)
# -----------------------------------
# add a boolean column to our numeric dataframe indicating whether a species is domestic

# Note: <speciesDescription> column me morethan 1 values coma sapereted hen.
head(df$speciesDescription)
#      NA 'domestic, cattle' 'domestic, cattle' 'domestic, cattle' 'domestic, unspecified bird' 'domestic, cattle' 

df$is_domestic <- str_detect(df$speciesDescription, "domestic")
# -----------------------------------
# get last word from all observations in particuler columns:
# NOTE: the output is a list
speciesList <- df$column_name %>%
    str_replace("[[:punct:]]", "") %>% # remove punctuation (some rows have parentheses)
    str_extract("[a-z]*$") # extract the least word in each row
# -----------------------------------
# convert list into a dataframe...
df <- tibble(colname = list_name)
# this <df> contain one column, which is <colname>
# -----------------------------------
# convert list to a matrix using one hot encoding
# first we convert a list to dataframe, as we saw earlier, and then:
options(na.action='na.pass') # don't drop NA values!
species <- model.matrix(~colname-1,df)
# -----------------------------------
# for all decleared variabels.. like %who in ipython
ls()
# -----------------------------------
# detail of the dataset
summary()
str()
# -----------------------------------
# remove variable from current session
rm(variable name)
# in python we can do: del variable_name
# -----------------------------------
# subsets
subset(df, column_4 == 'Pakistan')
# in python: df[df.column_4 == 'Pakistan']
# -----------------------------------
# histogram
hist(df$column_n)
# values of the column_n are shown on the x-axis, and the frequency of these valuse on the y-axis
# Note: A histrogram is useful for understand for the distribution of the variable.
hist(mpg ,col =2, breaks =15)
# -----------------------------------
# boxplot
boxplot(df$column_1 ~ df$column_n, xlab="", ylab="Y-axis", main="title")) 
# A boxplot is usefull for understanting the statical range of the variable.
# -----------------------------------
# outlier:
# any point that is > 3rd quartile + IQrange or any point that is < 1st quartile - IQrange is considered as outlier 
# -----------------------------------
table(df$Region)
# df$Reagion ki har unique value ki frequency kitni h??
# tables work well for variables that have only few catogaries.
# -----------------------------------
# you can get userull infromations for numerical variables by using <tapply>:
tapply(df$over60, df$region, mean)
# <tapply> splits the data by second argument, and the applies the third argument (which is function) to the first argument.
# so here <tapply> splits the oberservations by <region> and the computes the mean of the variable <over60>.
# -----------------------------------
# factory vector variable to date format
train$Date  <- as.Date(train$Date)  
# -----------------------------------
# creating a matrix using vector
x= matrix ( data=c(1 ,2 ,3 ,4) , nrow =2, ncol =2)
# Note that we could just as well omit typing data=, nrow=, and ncol= in the matrix() command above: that is, we could just type
x= matrix (c(1 ,2 ,3 ,4) ,2,2)

# The (byrow) option can be used to populate the matrix in order of the rows.
x= matrix ( data=c(1 ,2 ,3 ,4) , nrow =2, ncol =2, byrow =TRUE)
# -----------------------------------
# The rnorm() function generates a vector of random normal variables, with first argument n the sample size
rnorm (50, mean =50, sd =.1)
# By default, rnorm() creates standard normal random variables with a mean of 0 and a standard deviation of 1. However, the mean and standard deviation can be altered using the mean and sd arguments, as illustrated above.
# -----------------------------------
# save a plot 
# We will often want to save the output of an R plot. The command that we use to do this will depend on the file type that we would like to create. For instance, to create a pdf, we use the pdf() function, and to create a jpeg, we use the jpeg() function.
pdf (" Figure .pdf ")
plot(x,y,col =" green ")
dev . off ()
# The function dev.off() indicates to R that we are done creating the plot. Alternatively, we can simply copy the plot window and paste it into an appropriate file type, such as a Word document
# -----------------------------------
# Three-dimensional Plots
contour ()
image ()
persp ()
# -----------------------------------
contour()
# The contour() function produces a contour plot in order to represent three-dimensional data; 
# it is like a topographical map. It takes three arguments:
# 1. A vector of the x values (the first dimension),
# 2. A vector of the y values (the second dimension), and
# 3. A matrix whose elements correspond to the z value (the third dimension) for each pair of (x,y) coordinates.
# -----------------------------------
image()
# The image() function works the same way as contour(), except that it produces a color-coded plot whose colors depend on the z value. This is known as a heatmap.
# -----------------------------------
persp()
# Alternatively, persp() can be used to produce a three-dimensional plot. The arguments theta and phi control the angles at which the plot is viewed.
# -----------------------------------
# matrix slicing

A[c(1 ,3) ,c(2 ,4)]
# only 1st and 3rd row, from only 2nd and 4rth column

A [1:3 ,2:4]
# only rows 1 till 3, from only 2 till 4 columns.

A [1:5 ,]
# only 1st till 5th rows and all columns

A [ ,1:5]
# all rows, only from 1st till 5th columns

A[-c(1 ,3) ,]
# all rows except 1st and 3rd and all columns

A[-c(1 ,3) ,-c(1 ,3 ,4) ]
# all rows except 1st and 3rd, and all columns except 1st, 3rd and 4rth

A[,-1]
# all rows, all columns except 1st column
# -----------------------------------
fix()
# fix() function can be used to view it in a spreadsheet like window
fix(metrix_name)
# -----------------------------------
read.table()
 # Using the option header=T (or header=TRUE) in the read.table() function tells R that the first line of the file contains the variable names, and using the option na.strings tells R that any time it sees a particular character or set of characters (such as a question mark), it should be treated as a missing element of the data matrix.
 Auto=read .table (" Auto .data", header =T,na. strings ="?")
# -----------------------------------
attach()
# Note: (Auto) name of metrix
# suppose we need a scatter plot, we cannot pass variables names directly as:
plot(cylinders , mpg)

# we have to join metrix names and column names seperated by ($), as:
plot(Auto$cylinders, Auto$mpg)

# if we need avoid metrix name we first use (attach). so:
attach(Auto)
plot(cylinders , mpg) # ok
# -----------------------------------
as.factor()
# The as.factor() function converts quantitative variables into qualitative variables.
a <- as.factor(numeric_vector)
# now (a) is vector of factors.
# -----------------------------------
plot()
# If the variable plotted on the x-axis is categorial, then boxplots will boxplot automatically be produced by the plot() function.
plot(x_vaiable, y_variable, col = "red", varwidth = T, xlab = "cylinders", ylab ="MPG"
# -----------------------------------
pairs()
# The pairs() function creates a scatterplot matrix i.e. a scatterplot for every scatterplot pair of variables for any given data set.
pairs (df)
 # We can also produce scatterplots matrix for just a subset of the variables.
pairs(~mpg+disp+drat+wt,data=mtcars,   main="Simple Scatterplot Matrix")
# -----------------------------------
identify()
# In conjunction with the plot() function, identify() provides a useful interactive method for identifying the value for a particular variable for points on a plot. We pass in three arguments to identify(): the x-axis variable, the y-axis variable, and the variable whose values we would like to see printed for each point. Then clicking on a given point in the plot will cause R to print the value of the variable of interest
plot(df$horsepower, df$mpg); identify(df$horsepower, df$mpg)
# -----------------------------------
# save commads whet shutdown you R session:
savehistory()
loadhistory()
# Before exiting R, we may want to save a record of all of the commands that we typed in the most recent session; this can be accomplished using the savehistory() function. Next time we enter R, we can load that history using the loadhistory() function.
# -----------------------------------
# combining 3 int columns into one char column 
paste(movies$thtr_rel_day, movies$thtr_rel_month,movies$thtr_rel_year, sep="-")
# -----------------------------------
# get only num / numeric variables
nums <- unlist(lapply(df, is.numeric))
str(df[ , nums])
# -----------------------------------
# replace / fill NA's with most frequent factor(for catagorical variables) 
df[is.na(df[column_name]),]$column_name<- names(which.max(table(df[column_name])))
# -----------------------------------
# replace / fill NA's with mean 
df$column_name[is.na(df$column_name)] <- mean(df$column_name, na.rm = TRUE)
# -----------------------------------
# replace / fill NA's with particuler value 
df$column_name <- ifelse(is.na(df$column_name), "replace_with_this_value", df$column_name)
# -----------------------------------
# paralel computing in R ..................... 
system.time(
+     res1.p <- mclapply(1:40000000,FUN = function(x) {x * x * x},mc.cores = 8))
# -----------------------------------
# fast read csv file
system.time(
	df <- vroom::vroom("Original_data_converted_to_csv_from_rds_file.csv", delim = ",")
	)
# -----------------------------------
# split data into train and test
library(caret)
training.samples <- df$column_name %>%
  createDataPartition(p = 0.8, list = FALSE)
train  <- Boston[training.samples, ]
test <- Boston[-training.samples, ]
# -----------------------------------
# building regression model
# Build the model
model1 <- lm(target ~., data = train.data)
# Make predictions
predictions <- model1 %>% predict(test.data)
# Model performance
data.frame(
  RMSE = RMSE(predictions, test.data$target),
  R2 = R2(predictions, test.data$target)
)
# -----------------------------------
pi:10
# [1] 3.141593 4.141593 5.141593 6.141593 7.141593 8.141593 9.141593
# -----------------------------------
# The main difference, as you'll see, is that matrices can only contain a single class of data, while data frames can consist of many different classes of data.
# -----------------------------------
# vector to matrix by specifieng its dimension
my_vector <- 1:20             # my_vector is a vector of length 20
dim(my_vector) <- c(4, 5)	  # now my_vector is a matrix, with 4 rows and 5 columns

# same as:
matrix(1:20, byrow=F, nrow=4)
# -----------------------------------
# check if two objects are identical or not .................. identical(obj1, obj2)
# -----------------------------------
# There are two AND operators in R, `&` and `&&`. Both operators work similarly, if the right and left operands of AND are both TRUE the entire expression is TRUE, otherwise it is FALSE.
# The `&&` version of AND only evaluates the first member of a vector. In this case, the left operand is only evaluated with the first member of the right operand (the vector). The rest of the elements in the vector aren't evaluated at all in this expression.

# 5 > 8 || 6 != 8 && 4 > 3.9
# First the left and right operands of the AND operator are evaluated. 6 is not equal 8, 4 is greater than 3.9, therefore both operands are TRUE so the resulting expression `TRUE && TRUE` evaluates to TRUE. Then the left operand of the OR operator is evaluated: 5 is not greater than 8 so the entire expression is reduced to FALSE || TRUE. Since the right operand of this expression is TRUE the entire expression evaluates to TRUE.
# -----------------------------------
# The OR operator follows a similar set of rules. The `|` version of OR evaluates OR across an entire vector, while the `||` version of OR only evaluates the first member of a vector.
# -----------------------------------
# isTRUE()
# The function isTRUE() takes one argument. If that argument evaluates to TRUE, the function will return TRUE. Otherwise, the function will return FALSE.
# -----------------------------------
# The function identical() will return TRUE if the two R objects passed to it as arguments are identical.
# -----------------------------------
# xor() function, which takes two arguments. The xor() function stands for exclusive OR. If one argument evaluates to TRUE and one argument evaluates to FALSE, then this function will return TRUE, otherwise it will return FALSE.
# -----------------------------------
# The which() function takes a logical vector as an argument and returns the indices of the vector that are TRUE. For example which(c(TRUE, FALSE, TRUE)) would return the vector c(1, 3)
# -----------------------------------
# the functions any() and all() take logical vectors as their argument. The any() function will return TRUE if one or more of the elements in the logical vector is TRUE. The all() function will return TRUE if every element in the logical vector is TRUE.
# -----------------------------------
# These powerful functions(sapply, lapply), along with their close relatives (vapply() and tapply(), among others) offer a concise and convenient means of implementing the Split-Apply-Combine strategy for data analysis.	
# Each of the *apply functions will SPLIT up some data into smaller pieces, APPLY a function to each piece, then COMBINE the results.
# -----------------------------------
# The lapply() function takes a list as input, applies a function to each element of the list, then returns a list of the same length as the original one. Since a data frame is really just a list of vectors (you can see this with as.list(flags)), we can use lapply() to apply the class() function to each column of the flags dataset.
# -----------------------------------
# lists are most helpful for storing multiple classes of data.
# -----------------------------------
# The 'l' in 'lapply' stands for 'list'. so lapply() always return a list.
# -----------------------------------
# sapply() same as  lapply() behind the scenes, but then attempting to simplify (hence the 's' in 'sapply') the result for you.
# sapply() always attempts to simplify the result given by lapply().
# -----------------------------------
# In general, if the result is a list where every element is of length one, then sapply() returns a vector. If the result is a list where every element is a vector of the same length (> 1), sapply() returns a matrix. If sapply() can't figure things out, then it just returns a list, no different from what lapply() would give you.
# -----------------------------------
# The range() function returns the minimum and maximum of its first argument, which should be a numeric vector.
# -----------------------------------
# min and max for each column in dataframe ................ sapply(df, range)
# -----------------------------------

# -----------------------------------

# -----------------------------------

# -----------------------------------

# -----------------------------------

# -----------------------------------

# -----------------------------------

# -----------------------------------

# -----------------------------------
