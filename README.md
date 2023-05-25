![Build Status](https://gitlab.com/shirazlug/shirazlug.gitlab.io/badges/master/build.svg)

# داستان ما

اعضای جامعه ی کاربری شیرازلاگ تصمیم گرفتند تا توسعه سایت را به فراماگیت و سرویس صفحات آن منتقل کنند.

برخی از این نیاز ها عبارت اند از:

- آسانی در مشارکت همگانی
- انعطاف پذیری و کنترل بالا در توسعه
- مزایای استفاده از یک سیستم مدیریت نسخه مانند گیت(git)


---
## توسعه دهندگان سایت

 این پروژه به لطف همهٔ کسانی توسعه داده شده است که به صورت داوطلبانه و بدون دریافت هیچگونه هزینه ای، به اشتراک دانش و خلاقیت خود پرداخته اند. شما هم می توانید به توسعه این سایت کمک کنید و در فهرست توسعه دهندگان قرار بگیرید.

[![مریم بهزادی](https://shirazlug.ir/img/team/behzadi.svg)](https://shirazlug.ir/members/behzadi/)
[![امین خزاعی](https://shirazlug.ir/img/team/khozaei.svg)](https://shirazlug.ir/members/khozaei/)
![محمد میرشائی](https://shirazlug.ir/img/team/mirshaei.svg)
![محسن نظام‌الملکی](https://shirazlug.ir/img/team/nezam.svg)
![وجیهه نیکخواه](https://shirazlug.ir/img/team/nikkhah.svg)
![پویا برزگر](https://shirazlug.ir/img/team/barzegar.svg)
![زهره بیضاوی](https://shirazlug.ir/img/team/beyzavi.svg)
[![بابک رزمجو](https://shirazlug.ir/img/team/razmjoo.svg)](https://shirazlug.ir/members/razmjoo/)
[![شهرام شایگانی](https://shirazlug.ir/img/team/shaygani.svg)](https://shirazlug.ir/members/shaygani/)

---

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**فهرست مطالب** 

1. [چگونه میتوانید کمک کنید؟](#%DA%86%DA%AF%D9%88%D9%86%D9%87-%D9%85%DB%8C%D8%AA%D9%88%D8%A7%D9%86%DB%8C%D8%AF-%DA%A9%D9%85%DA%A9-%DA%A9%D9%86%DB%8C%D8%AF%D8%9F)
2. [سرویس گیت لب سی آی](#%D8%B3%D8%B1%D9%88%DB%8C%D8%B3-%DA%AF%DB%8C%D8%AA-%D9%84%D8%A8-%D8%B3%DB%8C-%D8%A2%DB%8C)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## ۱- چگونه می‌توانید کمک کنید؟

### نحوه کار با پروژه بر روی کامپیوتر شخصی
برای کار کردن بر روی این پروژه از طریق کامپیوتر شخصی، کافی است مراحل زیر را دنبال کنید:

  1. وارد حساب کاربری خود در framagit.org شوید، یا ثبت نام کنید.
  2. از این پروژه با عمل [`Fork`](https://framagit.org/shirazlug/shirazlug.frama.io/-/forks/new) یک نسخه در حساب کاربری خودتان ایجاد کنید.
  3. با استفاده از دستور زیر یک نسخه از پروژه را به همراه ساب ماژول‌های به کار رفته در آن، در کامپیوتر شخصی خود ذخیره کنید. دقت داشته باشید که در دستور زیر به جای عبارت `USERNAME`، نام‌کاربری خودتان که در فراماگیت ساختید را قرار دهید.
 
```
   git clone --recursive git@framagit.org:USERNAME/shirazlug.frama.io.git
```

  4. آخرین نسخه از هیوگو (hugo) را از طریق [این آموزش](https://gohugo.io/installation/) نصب کنید. برای اطمینان از اینکه hugo را نصب کردید و دسترسی در ترمینال دارید، در خط فرمان وارد کنید:

```
hugo version
```

باید در خروجی شبیه به این به شما نشان دهد:

```
hugo v0.111.3+extended linux/amd64 BuildDate=unknown
```
### پیش‌نمایش وب‌سایت

  5. برای اجرا کردن به صورت محلی دستور زیر را وارد کنید:

  ```
hugo server -D
```

بعد از اجرای دستور بالا، برای باز کردن وب‌سایت به صورت محلی در مرورگر خود آدرس http://localhost:1313 را باز کنید.

در صورتی که در حین اجرا خطای ساب‌ماژول یا پوسته را داد در دایرکتوری `themes` برید و این را اجرا کنید که پوسته مد نظر را دریافت کند و بعد دوباره مرحله ۵ را تکرار کنید:

```
git submodule add https://framagit.org/shirazlug/hugo-refresh-rtl.git
```

  6. هر گونه تغییرات که مد نظرتان هست به سایت اضافه یا تغییر دهید. «در صورتی که با هیوگو آشنای کمتری دارید از طریق [این مستندات](https://gohugo.io/documentation/) می‌توانید، با هیوگو کار کنید.»
  7. تغییرات خود را با دستور [`git add`](https://git-scm.com/docs/git-add) و [`git commit`](https://git-scm.com/docs/git-commit) به مخزن محلی خود اضافه کنید. سپس با ‍‍[`git push`](https://git-scm.com/docs/git-push) به مخزن شخصی خودتان در framagit.org ارسال کنید.
  8. از Fork خودتان یک درخواست ادغام یا merge request به پروژهٔ اصلی شیرازلاگ بفرستید. اگر راهبران شیرازلاگ تغییرات شما را بپذیرند، در مخزن اصلی اعمال خواهند کرد.

# ۲- سرویس گیت‌لب سی‌آی

صفحات ایستای این پروژه با استفاده از 
**گیت لب سی آی**
تولید شده اند. مراحل اجرایی تعریف شده در فایل 
[`.gitlab-ci.yml`](.gitlab-ci.yml)
را در ادامه مشاهده می کنید.

```
    
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

```
