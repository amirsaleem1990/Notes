str.center("*"*50, 70)
# Out[6]: '          **************************************************          '



{a=1, b=2}
SyntaxError: invalid syntax

OK: 
dict(a=1, b=2)
Out[11]: {'a': 1, 'b': 2}


# Murger 2 dicts (with override)
>>> x = {'a': 1, 'b': 2}
>>> y = {'b': 3, 'c': 4}
>>> z = {**x, **y}
>>> z
{'c': 4, 'a': 1, 'b': 3}


# if elif and and in one line
beta = 999 if alpha > 7 else 99 if alpha == 7 else 0
# NOTE: <99 if alpha == 7> is acutally is <elif>>


>>> row = ["1", "bob", "developer", "python"]
>>> print(*row, sep=',')
# 1,bob,developer,python


number= 88.23456445
print('{0:.2f}'.format(number))
# 88.23



# pandas dummpy date data
import pandas.util.testing as tm
import numpy as np
tm.N, tm.K = 15, 3  # Module-level default rows/columns
np.random.seed(444)
tm.makeTimeDataFrame(freq='M').head()
 					# A 			B 			C
# 2000-01-31 	0.357440 	-0.880396 	0.266873
# 2000-02-29 	0.377538 	0.152631 	-0.480331
# 2000-03-31 	1.382338 	0.250250 	0.300781
# 2000-04-30 	1.175549 	0.078508 	-0.179054
# 2000-05-31 	-0.939276 	-0.903904 	1.183669

tm.makeDataFrame().head()
#  					A 		   B 	       C
# nTLGGTiRHF 	-0.622768 	0.645943 	0.125115
# WPBRn9jtsR 	-0.318718 	-0.809053 	1.150051
# 7B3wWfvuDA 	-1.987207 	-1.079496 	0.298679
# yJ0BTjehH1 	0.880243 	0.740308 	-1.215363
# 0luaYUYvy1 	-0.931956 	1.291187 	-0.290725





addr = pd.Series([
    'Washington, D.C. 20003',
    'Brooklyn, NY 11211-1755',
    'Omaha, NE 68154',
    'Pittsburgh, PA 15211'
])
regex = (r'(?P<city>[A-Za-z ]+), '      # One or more letters
         r'(?P<state>[A-Z]{2}) '        # 2 capital letters
         r'(?P<zip>\d{5}(?:-\d{4})?)')  # Optional 4-digit extension
>>> addr.str.replace('.', '').str.extract(regex)
#          city state         zip
# 0  Washington    DC       20003
# 1    Brooklyn    NY  11211-1755
# 2       Omaha    NE       68154
# 3  Pittsburgh    PA       15211




