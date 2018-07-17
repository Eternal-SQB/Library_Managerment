"""Library_Managerment URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
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
from django.urls import path,re_path
from  app01 import views
urlpatterns = [
    path('admin/', admin.site.urls),
    path('index/',views.index),
    path('add/',views.add),
    re_path('edit/(?P<id>\d+)',views.edit),
    path('del_book/',views.del_book,name='del_book'),
    path('query/',views.query),
    path('login/',views.login),
    path('first/',views.first),
    path('logout/',views.logout),
    path('aa/',views.aa),
    path('register/',views.register),


]
