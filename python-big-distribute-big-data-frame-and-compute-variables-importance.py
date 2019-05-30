from scipy import stats
import pandas as pd
import numpy as np
import os


df = pd.read_csv("data.csv")
drop_columns = [i for i in df.columns if i.startswith("Unnamed:")]
if drop_columns:
	df = df.drop(drop_columns, axis=1)



import pickle
c = 0
list_of_vars = []
for i in range(len(df.columns)//10 + 1):
    if c < len(df):
        list_of_vars.append(df.columns[c:c+10].to_list())
        c += 10
# with open("columns.pkl", "wb") as file:
#     pickle.dump(list_of_vars, file)

code = """
from scipy import stats
import pandas as pd
import numpy as np
import os
import pickle

# with open("columns.pkl", "rb") as file:
#     list_of_vars = pickle.load(file)

df = pd.read_csv("data.csv", usecols={})
drop_columns = [i for i in df.columns if i.startswith("Unnamed:")]
if drop_columns:
	df = df.drop(drop_columns, axis=1)


Point_Biserial_Correlation = []
chi_square_probability = []
from scipy.stats import chisquare
unique_types = [i.name for i in df.dtypes.unique()]
for i in unique_types:
    cols = df.dtypes[df.dtypes == i].index.to_list()
    
    # remove target variable from list if exist
    if 'DPD30' in cols:
        del cols[cols.index("DPD30")]
        
    if i.startswith("float") or i.startswith("int"):
        for column in cols:
            Point_Biserial_Correlation.append((column, stats.pointbiserialr(df.DPD30, df[column]).pvalue))   
    elif i.startswith("O") or i == ("object"):
        for column in cols:
            chi_square_probability.append((column, stats.chi2_contingency(pd.crosstab(df.DPD30, df[column]))[1]))


pdd = pd.DataFrame(Point_Biserial_Correlation)
pdd = pdd.append(chi_square_probability)
pdd.columns = ['Column_name', 'P-value']
a = pd.DataFrame(df.dtypes).reset_index()
a.columns = ['Column_name', 'dtype']
f_df = pdd.merge(a, on='Column_name')
f_df['significatn'] = f_df['P-value'] < 0.05
f_df = f_df.sort_values("significatn", ascending=False)
f_df.to_csv("_{}_significant_vars.csv")
"""
cc = 1
for i in list_of_vars:
    with open("_{}.py".format(cc), "w") as file:
        file.write(code.format(i + ['DPD30'], cc))
    cc = cc + 1