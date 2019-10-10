
![Build Status](https://gitlab.com/shirazlug/shirazlug.gitlab.io/badges/master/build.svg)

---
## داستان ما

 اعضای جامعه ی کاربری شیرازلاگ تصمیم گرفتند تا توسعه سایت را
 به گیت لب و سرویس صفحات آن منتقل کنند.

برخی از این نیاز ها عبارت اند از:

- آسانی در مشارکت همگانی
- انعطاف پذیری و کنترل بالا در توسعه
- مزایای استفاده از یک سیستم مدیریت نسخه مانند گیت(git)


---
## توسعه دهندگان سایت

 این پروژه به لطف همه کسانی توسعه داده شده است که به صورت داوطلبانه و بدون دریافت هیچگونه هزینه ای، به اشتراک دانش و خلاقیت خود پرداخته اند. شما هم می توانید به توسعه این سایت کمک کنید و در لیست توسعه دهندگان قرار بگیرید.

<a href="https://shirazlug.ir/members/behzadi/" target="_blank"><img src="https://shirazlug.ir/img/team/behzadi.svg"></a>
<a href="https://shirazlug.ir/members/khozaei/" target="_blank"><img src="https://shirazlug.ir/img/team/khozaei.svg"></a>
<a href="https://shirazlug.ir/members/mirshaei/" target="_blank"><img src="https://shirazlug.ir/img/team/mirshaei.svg"></a>
<a href="https://shirazlug.ir/members/nezam/" target="_blank"><img src="https://shirazlug.ir/img/team/nezam.svg"></a>
<a href="https://shirazlug.ir/members/nikkhah/" target="_blank"><img src="https://shirazlug.ir/img/team/nikkhah.svg"></a>
<a href="https://shirazlug.ir/members/barzegar/" target="_blank"><img src="https://shirazlug.ir/img/team/barzegar.svg"></a>
<a href="https://shirazlug.ir/members/beyzavi/" target="_blank"><img src="https://shirazlug.ir/img/team/beyzavi.svg"></a>
<a href="https://shirazlug.ir/members/razmjoo/" target="_blank"><img src="https://shirazlug.ir/img/team/razmjoo.svg" alt="بابک رزمجو"/></a>

---

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**فهرست مطالب** 

1. [چگونه میتوانید کمک کنید؟](#%DA%86%DA%AF%D9%88%D9%86%D9%87-%D9%85%DB%8C%D8%AA%D9%88%D8%A7%D9%86%DB%8C%D8%AF-%DA%A9%D9%85%DA%A9-%DA%A9%D9%86%DB%8C%D8%AF%D8%9F)
2. [سرویس گیت لب سی آی](#%D8%B3%D8%B1%D9%88%DB%8C%D8%B3-%DA%AF%DB%8C%D8%AA-%D9%84%D8%A8-%D8%B3%DB%8C-%D8%A2%DB%8C)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


# ۱- چگونه میتوانید کمک کنید؟

## نحوه ی کار با پروژه بر روی کامپیوتر شخصی
برای کار کردن بر روی این پروژه از طریق کامپیوتر شخصی، کافی است مراحل زیر را دنبال کنید:
  
1. از این پروژه یک Fork تهیه کنید.

2. با استفاده از دستور زیر یک نسخه از پروژه را به همراه ساب ماژول‌های به کار رفته در آن، در کامپیوتر شخصی خود ذخیره کنید. دقت داشته باشید که در دستور زیر به جای عبارت
 `your-name`
 ، عبارت مناسب را قرار دهید.
 ```
   git git clone --recursive git@framagit.org:{your-name}/shirazlug.frama.io.git
```
3. آخرین نسخه از **هیوگو** را نصب کنید.
4. به مسیر پروژه رفته و با استفاده از دستور
`hugo server`
سایت را مشاهده کنید.
5. محتوای لازم را به سایت اضافه کنید یا تغییر دهید.
6. تغییرات نهایی را بر روی 
`Fork`
 خود 
`push`
کنید.
7. بعد از اینکه از صحت عملکرد کد مطمئن شدید، درخواست
`merge request`
خود را بر روی ریپوزیتوری اصلی
`شیرازلاگ`
ارسال کنید.


برای مطالعه ی بیشتر برای کار با **هیوگو** به وبسایت آن مراجعه کنید. 

### پیش نمایش وبسایت

در صورتی که این پروژه را بر روی کامپیوتر شخصی خود ذخیره کنید و در مسیر پروژه، دستور
`hugo server`
را بزنید، سایت شما در آدرس
`localhost:1313/`
قابل مشاهده خواهد بود.

# ۲- سرویس گیت‌لب سی‌آی

صفحات ایستای این پروژه با استفاده از 
**گیت لب سی آی**
تولید شده اند. مراحل اجرایی تعریف شده در فایل 
[`.gitlab-ci.yml`](.gitlab-ci.yml)
را در ادامه مشاهده می کنید.

<div dir="ltr">
    
    image: monachus/hugo

    variables:
      GIT_SUBMODULE_STRATEGY: recursive

    test:
      script:
      - hugo
      except:
      - master

    pages:
      script:
      - hugo
      artifacts:
        paths:
        - public
      only:
      - master
