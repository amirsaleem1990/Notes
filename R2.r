# download a file from the web
fire_url <- "https://babla"
download.file(fire_url, destfile="./folder/file.csv", method='curl')


# list of files in current directory
list.files()

# list of files in particuler directory
list.files("./folder")

# current date
date()

local files = flat files

# create file if not exist
if (!file.exist("data")){
	dir.create("data")
}


read.table:
	main funcition in R to reading data
	flexible and robust but requires more perameters
	Reads the dta into RAM, so big data can cause problems
	default seperator is <tab>, so if you read csv file your should specify sep=","
	nrows perameter:
		how many rows to read of the file.

# in my experience<said tha instrector of course>, the biggest trouble with reading flat (locat) files are quotation marks ` or " placed in data values, setting quote="" ofter resolve these.

# reading excel file
library(xlsx)
in excel file you can read specific rows and specific columns:
	cols <- 2:3
	rows <- 1:4
	df <- read.xlsx("file.xlsx", sheetIndex=1,
		colIndex=cols, rowIndex=rows)
	# now df contain 2 columns and 3 rows.
read.xlsx2 is much faster than read.xlsx, but for reading subsets of rows may be slightly unstable.


# read XML file
library(XML)
fileurl <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileurl, useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode) # "breakfast_menu"
name(rootNode) # "food" "food" "food" "food" "food"
rootNode[[1]]
rootNode[[1]][[1]]
xmlSApply(rootNode, xmlValue)
xpathSApply(rootNode, "//name", xmlValue)
xpathSApply(rootNode, "//price", xmlValue)


fileurl <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParses(fileurl, useInternal=TRUE)
scores <- xpathSApply(dic, "//li[@class='score']", xmlValue)
teams <- xpathSApply(dic, "//li[@class='team-name']", xmlValue)
scores
teams













library(funModeling) 
library(tidyverse) 
library(Hmisc)
library(dplyr)
basic_eda <- function(data)
{
  glimpse(data)
  df_status(data)
  freq(data) 
  profiling_num(data)
  plot_num(data)
  describe(data)
}
basic_eda(data)



mystats_num = function(x){
n = length(x)
nmiss = sum(is.na(x),na.rm = T)
nmiss_pct = mean(is.na(x))
sum = sum(x, na.rm=T)
mean = mean(x, na.rm=T)
median = quantile(x, p=0.5, na.rm=T)
std = sd(x, na.rm=T)
cv = sd(x, na.rm=T)/mean(x, na.rm=T)
var = var(x, na.rm=T)
pctl = quantile(x, p=c(0, 0.01, 0.05,0.1,0.25,0.5, 0.75,0.9,0.95,0.99,1), na.rm=T)
return(c(N=n, Nmiss =nmiss, Nmiss_pct = nmiss_pct, sum=sum, avg=mean, meidan=median, std=std, cv=cv, var=var, pctl=pctl))
}
function(df$var)



# exclude all rows that contain at least one NA.
na.exclude(data_frame)

# replace missing values with 0
df$column <- ifelse(is.na(df$column), 0, df$column) 
# or 
df$column[is.na(df$column), ] <- 0


# mode
sort(table(df$column), decreasing = TRUE)[1]


