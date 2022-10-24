# Create a django project ........... django-admin startproject mydjangoproject
# launch django app .............. python3 manage.py runserver
# crate an app ........... python3 manage.py startapp first_app
# make migrations ............. python3 manage.py makemigrations # let us say that you have 'Myproducts' in your first_app.models.py; to list this model in migration process you should first  copy the class name defined in first_app.app.py to settings.py in INSTALLED_APPS list as "first_app.apps.THE_CLASS_NAME_GOES_HERE".
# apply migrations ............... python3 manage.py migrate





# Add/delete/modify tables from admin panel .............. go to the admin.py, type: from .models import my_table_name_goes_here; admin.site.register(my_table_name_goes_here).

# Let's say we need to see the data in "Product" model in admin panel with its column names, to do so we go to admin.py; class ProductAdmin(admin.ModelAdmin): list_display=("name", "price","stock"); then overrite the last line in the file to: admin.site.register(Product, ProductAdmin)

# say you have a 'base.html' in your project/app/templates/ and you want to move that file to outer direcotry so every app can use it, you should create project/templates folder, move project/app/templates/base.html file to project/templates/ and then go to setting.py, find 'DIRS' key in 'TEMPLATES' list and add insert <BASE_DIR, "templates"> or <os.path.join(BASE_DIR, "templates")> in its value list.

