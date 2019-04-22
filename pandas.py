
# perform a function on one column among all columns
def partition(x):
    if x < 3:
        return 'positive'
    return 'negative'

column = df['column']
t = column.map(partition)
df["new_column"]=t

# another way:

def func(text):
    return text.lower()
df["reviews"] = df["reviews"].apply(func)

# <reviews> ki har value is function me jay gi or return aay gi, sab complete ho jay gi to output list of these returns df['reviews'] ko assign ho jay gi
--------------------------------------------------
# remove duplicates from specific columns

df = df.drop_duplicates(subset={"column1","column2","column3","column4"})
--------------------------------------------------
# is all values in particuler column is uqique or not?
df['column'].is_unique
# True / False
--------------------------------------------------
# df slicing
# in <column> from 1905 to 1906
df.loc[1905:, 'column'].head(10)
--------------------------------------------------
# column to numeric
df['column'] = pd.to_numeric(df['column'])
-------------------------------------------------
>>> pub = df['column']
>>> london = pub.str.contains('London')
>>> london[:5]
Identifier
206    True
216    True
218    True
472    True
480    True
Name: Place of Publication, dtype: bool

>>> oxford = pub.str.contains('Oxford')
df['column'] = np.where(london, 'London',
                                      np.where(oxford, 'Oxford',
                                               pub.str.replace('-', ' ')))

>>> df['column'].head()
Identifier
206    London
216    London
218    London
472    London
480    London
Name: Place of Publication, dtype: object
---------------------------------------------------
# rename one column name among all columns
df.rename(columns = {'column_x' : 'column_y'}, inplace=True)
# rename more than one columns names amont all columns
new_names = {'1' : 'column_1', '5' : 'column_5'}
df.reanem(column = new_names, inplace = True)
--------------------------------------------------
# Dropping rows having NULL Values
df.dropna(inplace=True)
--------------------------------------------------
df = pd.read_csv("file.csv", encoding = "ISO-8859-1", error_bad_lines=False)
--------------------------------------------------
# all columns and qty of null values in each column
df.isnull().sum()
--------------------------------------------------
# variables Qty that contain null values 
df.isnull().sum().sum()
--------------------------------------------------
# unique items Qty.
df.column.nunique()
-------------------------------------------------
# get grops sizes
df.groupby('column').size().reset_index(name='Enter new name for column')
# another 
df.groupby('column').count()
-------------------------------------------------
# entire column to lower case
df['column'] = df['column'].str.lower()
-------------------------------------------------
# string me jagan bhi <https> ho to us  k baad agly space tak sab remove kar do
import re
df[column] = df[column].apply(lambda i: re.sub(r"http\S+", "", i))
-------------------------------------------------
# all null values from all variables 
df.isnull().sum()
-------------------------------------------------
# can sort by values too
df.sort_values(by='B')
-------------------------------------------------
# column slicing
df.iloc[:,1:3]
-------------------------------------------------
# all rows and partuculer columns
# column slicing
df.iloc[:,1:3]
-------------------------------------------------
# filtering
df3 = df.copy()
df3['E'] = ['one', 'one', 'two', 'three', 'four', 'three']
# srif wo rows jin k <E> column me <two> ya <four> h
df3[df3['E'].isin(['two', 'four'])]
-------------------------------------------------
# index me jahan bhi <amir> h us k <A> column me <0> kar do
df.at['amir','A'] = 0
-------------------------------------------------
# index me 'amir' or 'noman' k darmyan jo bhi rows hen un k column <E> ki value ko <1> kar do
df.loc['amir':'noman','E'] = 1
-------------------------------------------------
# drop rows with missing data
# agar ksi row ki koi value bhi <NA> ya <NaN> h to us poori row ko drop kar do
df.dropna(how='any')
-------------------------------------------------
# fill missing data
# sab missing values ko <5> me <5> fill kar do
df4.fillna(value=5)
-------------------------------------------------
# column vise mean
df.mean()
-------------------------------------------------
# pivot the mean calculation
# row vise mean # ignoring non numarical values
df.mean(1)
-------------------------------------------------
# <min> and <max> for all variables
df.apply(lambda x: (x.max(), x.min()))
-------------------------------------------------
# concatenation
pd.concat([df1, df2, df3, df4])
-------------------------------------------------
# group by
df.groupby('A').sum()
df.groupby('A').count()
-------------------------------------------------
scipy.sparse.csr_matrix to nd.array

type(count_train)
# scipy.sparse.csr.csr_matrix
new = count_train.A
type(new)
# numpy.ndarray
count_train.shape == new.shape
# True
-------------------------------------------------
# check 2 dataframes are equal or not
df1.equals(df2)
# True / False
-------------------------------------------------
# length of all rows in particular column
df['column'].str.len()
-------------------------------------------------
# length of all rows in particular column (for text column)
df['column'].str.len()
-------------------------------------------------
# count tokens in all rows in particular column (for text column)
df['column'].str.split().str.len()
-------------------------------------------------
# check particular word in each row in particular column
df['column'].str.contains('sub_string')
-------------------------------------------------
# check particular word occurence in each row in particular column
df['column'].str.count('word') # count <'word'> in each row in <'column'>
df['column'].str.count(r'\d') # count how many digits in each row in <'column'>
-------------------------------------------------
# har row k column <'column'> me dijits ki list
df['column'].str.findall(r'\d')
-------------------------------------------------
# we want to pull out the hour and minutes from each string:
df['column'].str.findall(r'(\d?\d):(\d\d)')
-------------------------------------------------
# har wo word jis k aakir me  <'day'> ho us ko <'???'> sy replace kar do
df['column'].str.replace(r'\w+day\b', '???')
-------------------------------------------------
# har wo word jis k aakhir me <'day'> aa raha ho us word k starting 3 characters k ela baqi charachters remove kar do
df['column'].str.replace(r'(\w+day\b)', lambda x: x.groups()[0][:3])
# first, we use the xpression that finds the weekday for us and we can create a group by placing it in parenthesis.
# then for the replacement parameter, we can pass in a lambda expression, we use goups to get a tuple of the groups, index 0 to get the first, only group, and slice the first three letters from the group. 
-------------------------------------------------
# extract time from every string, and create 2 new columns, one for hours, and second for minutes
df['column'].str.extract(r'(\d?\d):(\d\d)')
-------------------------------------------------
# extract time from every string, and create 3 new columns, one for hours,second for minutes and 3rd for am/pm, 
df['column'].str.extractall(r'((\d?\d):(\d\d) ?([ap]m))')
# since we use <extarctall> we exctact all times, even if 1 text contains more than 1 time
-------------------------------------------------
# extract time from every string, and create 3 new columns, one for hours,second for minutes and 3rd for am/pm,
# and set the names for new created columns 
df['column'].str.extractall(r'(?P<time>(?P<hour>\d?\d):(?P<minute>\d\d) ?(?P<period>[ap]m))')
# since we use <extarctall> we exctact all times, even if 1 text contains more than 1 time
------------------------------------------------- 
# new column with condition
df['new_column'] = np.where(df['old_column'] > 3, 1, 0)
# <old_column> jahan > 3, wahan <new_column> me <1> dal do,
else <0>
-------------------------------------------------
# pehly number sy pehly pehly tak ka sara string from dataframe column
import pandas as pd
from random import shuffle
t = list('hamzaamirsaleem1990')
lst = []
df = pd.DataFrame()
for i in range(10):
	shuffle(t)
	lst.append(''.join(t))
df['text'] = lst

def func(t):
	return t[:t.find(re.search('[0-9]+', t).group())]
    
df["text1"] = df["text"].apply(func)
-------------------------------------------------
# count plot group by sepecific column
# <df> k <column> ki grouping kar k un ka count ly lo os phir us counting ka <'bar'> graph bana do
df.column.value_counts().plot(kind='bar')
-------------------------------------------------
# pandas itrate over the rows
for i in df.iterrows():
    # now i is tuple, contains 2 values, first is index of this row, 
    # and second is a pandas Series, contain a content of this row.
    print(i, len(i), type(i), leni([0]), len(i[1]), type(i[0]), type(i[1]))
-------------------------------------------------
2 equal lenth lists to dataframe in single line
df = pd.DataFrame(data=list(zip(list1, list2)), columns=['column1', 'column2'])
-------------------------------------------------
DICT TO DATAFRAME
df
  index     Cost  Item Purchased  Name  Date  Delivered   Feedback
0   Store 1   22.5  Sponge    Chris   Jan   True    None
1   Store 1   2.5   Kitty Litter  Kevyn   Feb   True    Positive
2   Store 2   5.0   Spoon     Filip   March   True    Negative

a = pd.Series({0: 'December', 2:'mid.May'})
a

0    December
2     mid.May
dtype: object

adf['Date'] = a
adf

  index     Cost  Item Purchased  Name  Date  Delivered   Feedback
0   Store 1   22.5  Sponge    Chris   December  True  None
1   Store 1   2.5   Kitty Litter  Kevyn   NaN     True  Positive
2   Store 2   5.0   Spoon     Filip   mid.May   True  Negative
-------------------------------------------------
# DATAFRAME COLUMN RENAME
df = df.rename(columns={'REGION': 'region'})
-------------------------------------------------
# read tsv file using pandas
pd.read_csv('Location.tsv',delimiter='\t',encoding='utf-8')
-------------------------------------------------
# cpecify particuler column while loading csv file
df = pd.read_csv('file.csv', usecols = [5]) # getting only 5th column from csv file
-------------------------------------------------
# get only 5th column, and convert it to list
lst = pd.read_csv('file.csv', usecols = [5], encoding = "ISO-8859-1", error_bad_lines=False).iloc[:, 0].tolist()
-------------------------------------------------
# histogram of all numerical variables from data set
import matplotlib.pyplot as plt
train[train.dtypes[(train.dtypes=="float64")|(train.dtypes=="int64")]
                        .index.values].hist(figsize=[11,11])
-------------------------------------------------

-------------------------------------------------

-------------------------------------------------
-------------------------------------------------

-------------------------------------------------

-------------------------------------------------

-------------------------------------------------

-------------------------------------------------

-------------------------------------------------

-------------------------------------------------

-------------------------------------------------

-------------------------------------------------

-------------------------------------------------

-------------------------------------------------

-------------------------------------------------

-------------------------------------------------
-------------------------------------------------

-------------------------------------------------

-------------------------------------------------

-------------------------------------------------

-------------------------------------------------

-------------------------------------------------

-------------------------------------------------

-------------------------------------------------

-------------------------------------------------

-------------------------------------------------

-------------------------------------------------

-------------------------------------------------

-------------------------------------------------
-------------------------------------------------

-------------------------------------------------

-------------------------------------------------

-------------------------------------------------

-------------------------------------------------

-------------------------------------------------

-------------------------------------------------

-------------------------------------------------

-------------------------------------------------

-------------------------------------------------

-------------------------------------------------

-------------------------------------------------

-------------------------------------------------
