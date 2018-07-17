from django.db import models


# Create your models here.
class Book(models.Model):
    title = models.CharField(max_length=32)
    pub_date = models.DateField()
    prices = models.DecimalField(max_digits=8, decimal_places=2)

    publish = models.ForeignKey(to='Publish', to_field='id', on_delete=models.CASCADE)
    authors = models.ManyToManyField(to='Author', )

    def __str__(self):
        return self.title


class Publish(models.Model):
    name = models.CharField(max_length=32)
    city = models.CharField(max_length=32)
    email = models.EmailField()


class Author(models.Model):
    name = models.CharField(max_length=32)
    age = models.IntegerField()

    ad = models.OneToOneField(to='AuthorDetail', to_field='id', on_delete=models.CASCADE)


class AuthorDetail(models.Model):
    gf = models.CharField(max_length=32)
    tel = models.BigIntegerField()
    addr = models.CharField(max_length=64)


class User(models.Model):
    user=models.CharField(max_length=32)
    pwd=models.CharField(max_length=32)
    login_data=models.DateTimeField(null=True)
    email=models.EmailField(default=0)
    tel=models.CharField(default=0,max_length=32)
    age=models.IntegerField(default=0)