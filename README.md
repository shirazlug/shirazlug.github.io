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

<a href="https://shirazlug.ir/members/behzadi/" target="_blank"><img src="https://shirazlug.ir/img/team/behzadi.svg" alt="مریم بهزادی"></a>
<a href="https://shirazlug.ir/members/khozaei/" target="_blank"><img src="https://shirazlug.ir/img/team/khozaei.svg" alt="امین خزاعی"></a>
<a href="https://shirazlug.ir/members/mirshaei/" target="_blank"><img src="https://shirazlug.ir/img/team/mirshaei.svg" alt="محمد میرشایی"></a>
<a href="https://shirazlug.ir/members/nezam/" target="_blank"><img src="https://shirazlug.ir/img/team/nezam.svg" alt="محسن نظام الملکی"></a>
<a href="https://shirazlug.ir/members/nikkhah/" target="_blank"><img src="https://shirazlug.ir/img/team/nikkhah.svg" alt="وجیهه نیکخواه"></a>
<a href="https://shirazlug.ir/members/barzegar/" target="_blank"><img src="https://shirazlug.ir/img/team/barzegar.svg" alt="پویا برزگر"></a>
<a href="https://shirazlug.ir/members/beyzavi/" target="_blank"><img src="https://shirazlug.ir/img/team/beyzavi.svg" alt="زهره بیضاوی"></a>
<a href="https://shirazlug.ir/members/razmjoo/" target="_blank"><img src="https://shirazlug.ir/img/team/razmjoo.svg" alt="بابک رزمجو"/></a>

---

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**فهرست مطالب** 

1. [چگونه میتوانید کمک کنید؟](#%DA%86%DA%AF%D9%88%D9%86%D9%87-%D9%85%DB%8C%D8%AA%D9%88%D8%A7%D9%86%DB%8C%D8%AF-%DA%A9%D9%85%DA%A9-%DA%A9%D9%86%DB%8C%D8%AF%D8%9F)
2. [سرویس گیت لب سی آی](#%D8%B3%D8%B1%D9%88%DB%8C%D8%B3-%DA%AF%DB%8C%D8%AA-%D9%84%D8%A8-%D8%B3%DB%8C-%D8%A2%DB%8C)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## ۱- چگونه میتوانید کمک کنید؟

### نحوهٔ کار با پروژه بر روی کامپیوتر شخصی
برای کار کردن بر روی این پروژه از طریق کامپیوتر شخصی، کافی است مراحل زیر را دنبال کنید:

  1. وارد حساب کاربری خود در framagit.org شوید، یا ثبت نام کنید.
  2. از این پروژه با عمل `Fork` یک نسخه در حساب کاربری خودتان ایجاد کنید.
  3. با استفاده از دستور زیر یک نسخه از پروژه را به همراه ساب ماژول‌های به کار رفته در آن، در کامپیوتر شخصی خود ذخیره کنید. دقت داشته باشید که در دستور زیر به جای عبارت
 `your-name`
 ، عبارت مناسب را قرار دهید.
 
```
   git clone --recursive git@framagit.org:{your-name}/shirazlug.frama.io.git
```
  4. آخرین نسخه از **هیوگو (hugo)** را نصب کنید. ما برای تولید این وبسایت از نسخهٔ پیشرفتهٔ hugo استفاده می کنیم. برای اطمینان از اینکه شما هم این نسخه از hugo را دارید، در خط فرمان وارد کنید:
  
`hugo version`
  
  باید در نتیجهٔ چاپ شدهٔ این دستور کلمهٔ extended را ببینید. اگر اینچنین نیست به [مخزن هیوگو در گیتهاب](https://github.com/gohugoio/hugo/releases) بروید و یک نسخهٔ پیشرفته مناسب دستگاه خود دانلود کنید.
  5. اگر فایل اجرایی هیوگو را با نامی غیر از hugo نصب کرده اید، این خط از `Makefile` موجود در ریشهٔ پروژه را تغییر دهید و نام درست را بنویسید:
`HUGO = hugo`
  
  
  6. با استفاده از دستور 
`make server`
  در مسیر پروژه، وب سایت را مشاهده کنید.
  **توجه** این وبسایت به شکل پیشفرض در حالت local روی پورت ۱۳۱۳ رایانهٔ شخصی شما راه اندازی می شود. اگر این پورت روی رایانهٔ شما بسته است یا به هر دلیل قصد دارید از پورت دیگری به این منظور استفاده کنید، کافی است خط زیر از فایل `Makefile` موجود در ریشهٔ پروژه را تغییر دهید و شمارهٔ پورت دلخواه خود را بنویسید:
`PORT = 1313`
  7. محتوای لازم را به سایت اضافه کنید یا تغییر دهید. برای مطالعه ی بیشتر برای کار با هوگو به [وبسایت آن](https://gohugo.io) مراجعه کنید.
  8. تغییرات خود را با `git add` و `git commit` به مخزن محلی خود اضافه کنید. سپس با ‍‍`git push` به مخزن شخصی خودتان در framagit.org ارسال کنید.
  9. از Fork خودتان یک درخواست ادغام یا merge request به پروژهٔ اصلی شیرازلاگ بفرستید. اگر راهبران شیرازلاگ تغییرات شما را بپذیرند، در مخزن اصلی اعمال خواهند کرد.

### پیش نمایش وبسایت

در صورتی که این پروژه را بر روی کامپیوتر شخصی خود ذخیره کنید و در مسیر پروژه، دستور
`make server`
را بزنید، سایت شما در آدرس
`localhost:xxxx/`
قابل مشاهده خواهد بود.

دستور بالا نسخه ای از وبسایت را تولید می کند که فایلهای آن شامل HTML و XML شامل خطوط و فضای خالی زیادی است. برای مشاهدهٔ یک نسخهٔ minified به جای دستور بالا، دستور زیر را اجرا کنید:

`make minserver`

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
