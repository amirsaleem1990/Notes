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

# -----------------------------------

# -----------------------------------

# -----------------------------------

# -----------------------------------

# -----------------------------------

# -----------------------------------

# -----------------------------------

# -----------------------------------

# -----------------------------------

# -----------------------------------

# -----------------------------------

# -----------------------------------

# -----------------------------------

# -----------------------------------

# -----------------------------------

# -----------------------------------

# -----------------------------------

# -----------------------------------

# -----------------------------------

# -----------------------------------

# -----------------------------------

v