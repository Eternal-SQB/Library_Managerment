from django.core.exceptions import NON_FIELD_ERRORS, ValidationError
from django import forms
from django.forms import widgets
from app01.models import User

wid = widgets.TextInput(attrs={'class': 'form-control'})


class UserForms(forms.Form):
    name = forms.CharField(min_length=4, max_length=12, label="姓名",
                           widget=widgets.TextInput(attrs={"class": "form-control"}),
                           error_messages={"required": "该字段不能为空",
                                           "max_length":'用户名不可多余12位',
                                           'min_length':'用户名不得少于4位'
                                           }
                           )
    age = forms.IntegerField(label="年龄",
                             error_messages={"invalid": "格式错误"},
                             widget=widgets.TextInput(attrs={"class": "form-control"}))
    tel = forms.CharField(label="电话号码",
                          widget=widgets.TextInput(attrs={"class": "form-control"}))
    email = forms.EmailField(label="邮箱",
                             widget=widgets.EmailInput(attrs={"class": "form-control"}))
    pwd = forms.CharField(min_length=6, label="密码",
                          widget=widgets.PasswordInput(attrs={"class": "form-control"}))
    r_pwd = forms.CharField(label="确认密码",
                            widget=widgets.PasswordInput(attrs={"class": "form-control"})
                            )

    def clean_name(self):

        val = self.cleaned_data.get("name")
        user = User.objects.filter(user=val)
        if not val.isdigit() and not user:
            return val
        # elif len(val) < 4:
        #     raise ValidationError('用户名不能少于4位')
        # elif len(val) > 12:
        #     raise ValidationError('用户名不能多于12位')
        elif val.isdigit():
            raise ValidationError('用户名不能为纯数字')
        else:
            raise ValidationError('该用户名已经被注册')

    def clean_tel(self):
        val = self.cleaned_data.get("tel")
        if len(val) == 11:
            return val
        else:
            raise ValidationError("手机号码错了")

    def clean_age(self):
        val = self.cleaned_data.get("age")
        if int(val) > 18:
            return val
        else:
            raise ValidationError("岁数太小的")

    def clean(self):
        pwd = self.cleaned_data.get("pwd")
        r_pwd = self.cleaned_data.get("r_pwd")
        if pwd and r_pwd and pwd != r_pwd:
            raise ValidationError("两次密码不一致")
        else:
            return self.cleaned_data
