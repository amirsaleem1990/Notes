change admin password .......... python3 manage.py changepassword
create project ................. django-admin startproject telusko
start server ................... ipython3 manage.py runserver
create an app .................. ipython3 manage.py startapp calc
ipython3 manage.py createsuperuser ...... 



import pandas as pd
import sqlite3
conn = sqlite3.connect('db.sqlite3')
q = "CREATE TABLE IF NOT EXISTS users ( id integer, name text, email_address text, password text);"
conn.execute(q)
df = pd.DataFrame(
	{"id" : range(10), 
	"name" : ' '.join('abcdefghij').split(), 
	"email_address" : [f'email{i}@gmail.com' for i in range(10)], 
	"password" : [f'password_{i}' for i in range(10)]}
	)
df.to_sql("users", con=conn, if_exists='replace', index=False)


import pandas as pd
import sqlite3
conn = sqlite3.connect('db.sqlite3')
q = "CREATE TABLE IF NOT EXISTS Q_A ( id integer, Q text, A text);"
conn.execute(q)
df = pd.DataFrame(
	{"id" : range(20), 
	"Q" : [f'Q_{i}' for i in range(20)],
	"A" : [f'A_{i}' for i in range(20)],
	"dificulty_level" : [1,2,3,2,1,2,1,1,3,3,2,1,3,2,1,2,3,2,3,2]
	})
df.to_sql("Q_A", con=conn, if_exists='replace', index=False)


import sqlite3
import pandas as pd
q = "CREATE TABLE IF NOT EXISTS multiple_choices ( id integer, Q_id integer, option text);"
import random
x = list(range(20)) + list(range(20)) + list(range(20)) + list(range(20))
random.shuffle(x)

from string import ascii_lowercase
x_2 = ' '.join((ascii_lowercase*4)[:80]).split()
random.shuffle(x_2)
df = pd.DataFrame(
	{"id" : range(80), 
	"Q_id" : x,
	"option" :  x_2
	})
conn = sqlite3.connect('db.sqlite3')
conn.execute(q)
df.to_sql("multiple_choices", con=conn, if_exists='replace', index=False)



from django.http import HttpResponse
def check_credentials(request):
	try:

		# if (request.data.get("name") in DATABASE??) and (request.data.get("password") in DATABASE??):
		if (request.GET('name') in DATABASE??) and (request.GET('password') in DATABASE??):
				return HttpResponse(200??)
		else:
			return HttpResponse(400??)
	except Exception as e:
		return HttpResponse(500??)




home.html
{% extends 'base.html' %}

{% block content %}
<h1>Hello {{name}}!!!</h1>

<form action="">
    Enter 1st number : <input type="text" name="num1"><br>
    Enter 2nd number : <input type="text" name="num2"><br>
    <input type="submit">
</form>

{% endblock  %}

view.py
from django.http.response import HttpResponse
from django.shortcuts import render
from django.http import HttpResponse
# Create your views here.
def home(request):
    import sqlite3
    import pandas as pd
    conn = sqlite3.connect("/home/amir/JANGO/first_project/db.sqlite3")
    df = pd.read_sql_query("select * from RainFall;", con=conn)
    df.columns = df.columns.str.strip().to_list()
    
    return render(request, 'home.html', {'name' : df[(df.Year.eq(1901)) & (df.Month.eq('January'))].to_string()})

# def add(request):
#     return render(request, 'result.html')




urls.py
from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home')#,
    # path('add', views.add, name='add')
]


urls.py
"""first_project URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.urls.conf import include

urlpatterns = [
    path('', include('calc.urls')),
    path('admin/', admin.site.urls),
]


result.html
{% extends 'base.html' %}

{% block content %}


Result !!!!! 

{% endblock  %} 
