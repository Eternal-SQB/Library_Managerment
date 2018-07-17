from django.shortcuts import render,redirect,HttpResponse
from app01.models import Book,Publish,Author,AuthorDetail,User
import json
from app01.form import UserForms
# Create your views here.
import datetime
def login(request):
    if request.method=='POST':
        user=request.POST.get('user')
        pwd=request.POST.get('pwd')
        l_data=User.objects.filter(user=user,pwd=pwd)
        login_data=l_data.values('login_data').first()['login_data'].strftime("%Y-%m-%d %X")
        if User.objects.filter(user=user,pwd=pwd):
            request.session["is_login"] = True
            request.session["username"] = user
            request.session["login_time"] = login_data
            ret=l_data.update(login_data=datetime.datetime.now())
            return redirect('/index/')

    return render(request,'login.html')


def index(request):
    is_login = request.session.get('is_login')
    if not is_login:
        return redirect('/login/')
    username=request.session.get('username')
    login_time=request.session.get('login_time')


    book_list=Book.objects.all()


    return render(request, 'index.html', {'book_list':book_list, 'username':username, 'login_time':login_time})

def add(request):
    is_login = request.session.get('is_login')
    if not is_login:
        return redirect('/login/')
    if request.method=='POST':
        title=request.POST.get('title')
        prices=request.POST.get('prices')
        publish=request.POST.get('publish')
        pub_date=request.POST.get('pub_date')
        au_name=request.POST.getlist('au_name')

        book=Book.objects.create(title=title,prices=prices,publish_id=publish,pub_date=pub_date)
        book.authors.add(*au_name)
        return redirect('/index/')

    else:
        pub_list = Publish.objects.all()
        au_list=Author.objects.all()
        return render(request,'add.html',{'pub_list':pub_list,'au_list':au_list})

def edit(request,id):
    is_login = request.session.get('is_login')
    if not is_login:
        return redirect('/login/')
    if request.method=='POST':
        title=request.POST.get('title')
        prices=request.POST.get('prices')
        publish=request.POST.get('publish')
        pub_date=request.POST.get('pub_date')
        au_name=request.POST.getlist('au_name')


        Book.objects.filter(id=id).update(title=title,prices=prices,publish_id=publish,pub_date=pub_date)
        book_au = Book.objects.filter(id=id).first()
        book_au.authors.set(au_name)

        return  redirect('/index/')

    #get请求
    book_list = Book.objects.get(id=id)
    pub_list = Publish.objects.all()
    au_list=Author.objects.all()

    au_name =Book.objects.filter(id=id).first().authors.all().values_list("name")
    edit_author =[]
    for i in au_name:
        edit_author.append(i[0])
        print(i[0])
    print(edit_author)

    return render(request, 'edit.html', {'book_list': book_list,'pub_id':pub_list,'au_list':au_list,'edit_author':edit_author})

def del_book(request):
    del_id=request.POST.get('del_id')
    book=Book.objects.filter(id=del_id).delete()


    return  HttpResponse(json.dumps({'status':1}))



def query(request):
    ##基于对象跨表查询（子查询）##
    # book=Book.objects.filter(title='玉女心经').first()
    # print(book.publish.name)

    # publish=Publish.objects.filter(name='北京出版社').first()
    # print(publish.book_set.all())

    # 查询玉女心经这本书籍的所有作者的姓名和年龄
    # book=Book.objects.filter(title='玉女心经').first()
    # ret=book.authors.all().values('name','age')
    # print(ret)
    # 查询alex出版过得所有书籍名称
    # au=Author.objects.filter(name='alex').first()
    # ret=au.book_set.all().values('title')
    # print(ret)
    # # 查询alex的女朋友的名字
    # au=Author.objects.filter(name='alex').first()
    # print(au.ad.gf)
    # # 手机号为110的作者的名字
    # ad=AuthorDetail.objects.filter(tel='110').first()
    # print(ad.author.name)
    #####基于__的跨表查询（join查询）######
    # 查询玉女心经这本书的出版社的名字
    # ret=Book.objects.filter(title='玉女心经').values('publish__name')
    # print(ret)

    # ret=Publish.objects.filter(book__title='玉女心经').values('name')
    # print(ret)
    # 查询玉女心经这本书籍的所有作者的姓名和年龄
    # ret=Author.objects.filter(book__title='玉女心经').values('name','age')
    # print(ret)
    #
    # r=Book.objects.filter(title='玉女心经').values('authors__name','authors__age')
    # print(r)
    # # 查询alex的女朋友的名字
    # au=Author.objects.filter(name='alex').values('ad__gf')
    # print(au)
    #
    # ad=AuthorDetail.objects.filter(author__name='alex').values('gf')
    # print(ad)
    # 查询深圳出版社出版过的所有书籍的名字与价格(一对多)
    # pu=Publish.objects.filter(name='深圳出版社').values('book__title','book__prices')
    # print(pu)
    #
    # book=Book.objects.filter(publish__name='深圳出版社').values('title','prices')
    # print(book)
    # 查询alex出过的所有书籍的名字(多对多
    # au= Author.objects.filter(name='alex').values('book__title')
    # print(au)
    #
    # b=Book.objects.filter(authors__name='alex').values('title')
    # print(b)
    # 查询alex的手机号
    # au=Author.objects.filter(name='alex').values('ad__tel')
    # print(au)
    #
    # ad=AuthorDetail.objects.filter(author__name='alex').values('tel')
    # print(ad)
# ##################连续跨表
# # 手机号以151开头的作者出版过的所有书籍名称以及出版社名称
#     au=Author.objects.filter(ad__tel='110').values('book__title','book__publish__name')
#     print(au)
#
#     book = Book.objects.filter(authors__ad__tel='110').values('title','publish__name')
#     print(book)
#     查询南京出版社出版过的所有书籍的名字以及作者的姓名
#     p=Publish.objects.filter(name='南京出版社').values('book__title','book__authors__name')
#     print(p)
#
#     b=Book.objects.filter(publish__name='南京出版社').values('title','authors__name')
#     print(b)
#     手机号为111的作者出版过的所有书籍名称以及出版社名称
#     a=Author.objects.filter(ad__tel='111').values('book__title','book__publish__name')
#     print(a)
#
#     b=Book.objects.filter(authors__ad__tel='111').values('title','publish__name')
#     print(b)
#
#     p=Publish.objects.filter(book__authors__ad__tel='111').values('book__title','name')
#     print(p)
#     查询上海出版社出版过的所有书籍的名字与价格(一对多)
#     p=Publish.objects.filter(name='上海出版社').values('book__title','book__prices')
#     print(p)
#
#     b=Book.objects.filter(publish__name='上海出版社').values('title','prices')
#     print(b)
    # #############################聚合与分组##########
    # from django.db.models import Avg,Count,Max,Min
    # # 计算所有图书的平均价格
    # b=Book.objects.aggregate(Avg('prices'))
    # print(b)
    # # 查询每一个出版社名称以及对应书籍的平均价格
    # p=Publish.objects.values('id').annotate(avg=Avg('book__prices')).values('name','avg')
    # print(p)
    # # 查询每一个作者的名字记忆对应出版过的书籍最高价格
    # a=Author.objects.values('id').annotate(max=Max('book__prices')).values('name','max')
    # print(a)
    # 查询每一本书籍的名称以及作者个数
    # ret = Book.objects.values("title").annotate(c=Count("authors__name")).values('title','c')
    # print(ret)
    # # 查询不止一个作者的书籍名称
    # b= Book.objects.values('id').annotate(c=Count('authors__name')).filter(c__gt=1).values('title','c')
    # print(b)
    # 查询每一个出版社名称以及对应书籍的平均价格
    # p=Publish.objects.values('id').annotate(avg=Avg('book__prices')).values('name','avg')
    # print(p)
    # 统计每一个出版社的最便宜的书名
    # p=Publish.objects.values('id').annotate(min=Min('book__prices')).values('book__title','name')
    # print(p)
    # b=Book.objects.values("publish__name").annotate(min=Min("prices")).values_list('title','min','publish__name')
    # print(b)

    return  render(request,'query.html')



def first(request):
    is_login=request.session.get('is_login')
    if not is_login:
        return redirect('/login/')
    username=request.session.get('username')
    login_time=request.session.get('login_time')
    return render(request, 'index.html', {'username':username, 'login_time':login_time})

def logout(request):
    request.session.flush()
    return redirect('/login/')

def aa(request):
    return render(request,'aa.html')

def register(request):
    if request.method=="POST":
        form=UserForms(request.POST) #{"title":"AAA"}
        if form.is_valid():
            print("########## success ##########")
            print(form.cleaned_data)
            print(form.errors)
            print(type(form.errors))
            user=form.cleaned_data.get('name')
            pwd=form.cleaned_data.get('pwd')
            age=form.cleaned_data.get('age')
            tel=form.cleaned_data.get('tel')
            email=form.cleaned_data.get('email')
            User.objects.create(user=user,pwd=pwd,email=email,tel=tel,age=age,)

            # user.save()
            print(user,pwd,age,tel,email)
            return redirect('/login/')
        else:
            # print("########## fail ##########")
            print(form.cleaned_data)

            g_error=form.errors.get("__all__")
            if g_error:
                g_error=g_error[0]
            return render(request, "register.html",locals())
    else:
        form=UserForms()
        return render(request, "register.html",locals())