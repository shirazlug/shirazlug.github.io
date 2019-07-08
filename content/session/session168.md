---
title: "جلسه ۱۶۸"
description: "پروژه Jupyter و اکوسیستم آن"
date: "1398-03-01"
author: "حمیدرضا معدلی، مریم بهزادی"
draft: false
categories:
    - "sessions"
---
[![poster168](../../img/posters/poster168.jpg)](../../img/poster168.jpg)

صد و شصت و هشتمین نشست شیرازلاگ با همکاری شیرازپاگ، و با ارائه مهندس حمیدرضا معدلی در خانه فرهنگ دانشگاه صنعتی شیراز برگزار شد.

در حال حاضر Jupyter به عنوان یکی از اصلی ترین ابزارها توسط متخصصین علم داده (Data Science) برای آنالیز داده به صورت کاوش و تعاملی استفاده می‌شود. همچنین به دلیل توانایی اشتراک گذاری، این ابزار یک رکن اصلی در بحث های مهم Open Science  و Reproducible Science  می باشد. از مهم ترین موفقیت های این پروژه می توان به نقش آن در تعامل و  اشتراک گذاری نتایج آزمایش LIGO Black Hole اشاره کرد که به عنوان برنده جایزه نوبل فیزیک در سال ۲۰۱۷ معرفی شد. استفاده از این ابزار به گونه ای گسترش پیدا کرده است که در تابستان گذشته کنفرانسی مجزا روی این ابزار به نام jupytercon  برگزار شد. در این نشست تاکید اصلی بر آشنایی با قابلیت ها و کار کردن با Jupyter و JupyterLab بود، اما به مباحث دیگری از جمله تاریخچه، معماری و ابزاری های دیگر موجود در اکوسیستم Jupyter به طور خلاصه پرداخته شد.

Jupyter در اصل قسمتی از پروژه   IPython است که به دلیل مناسب بودن برای ایجاد برنامه تحت وب برای زبانهای دیگر برنامه نویسی از این پروژه جدا و به صورت پروژه‌ای مستقل تحت نام Jupyter که مخفف زبانهای Julia ، Python و R  در آمد. 

در بخش اول ارائه به معماری و پروتکل ها و فرمت باز این ابزار پرداخته شد و همچنین با ابزارهای مشابه آن به طور خلاصه مقایسه ای در کنار تاریخچه بیان گردید.

در بخش بعد به معرفی قابلیت های خود ابزار Jupyter بر اساس زیر عنوان های زیر پرداخته شد:

    • Basics, Magics, specialized display and other tricks of IPython
    	• Notebook Basics
    	• Code / Markdown Cells
    	• Plotting in the Notebook
    	• IPython extra language features
    	• Cell Magics
    	• Rich Display System
    • Working with notebook files
    	• Notebook files and Nbconvert
    	• Notebooks in version control (Nbdime)
    	• Testing notebooks (Nbval)
    • Interactive HTML Widgets (ipywidgets)
    • Interactive (parallel) Python (Ipyparallel)
    • Jupyter Notebook Extensions
        • community-contributed unofficial extensions
        • RISE: "Live" Reveal.js Jupyter/IPython Slideshow Extension
        • nbgrader: A system for assigning and grading Jupyter notebooks.

در آخر ارائه به معرفی اجمالی ابزار جدید JupyterLab و قابلیت های آن پرداخته شد. این پروژه در نسخه های اولیه بوده و قرار است به زودی نسخه اولیه بتای آن اعلام شود. این ابزار کاستی های ابزار  Jupyter را مخصوصا برای متخصصان علم داده تا حد زیادی برطرف می کند و محیطی مانند یک IDE فراهم می کند به صورتی که کاربر می تواند به صورت همزمان چندین 
notebooks، text editors، terminals و اجزای دیگر را در تب و پنل‌های چندگانه مدیریت و استفاده کند.

مباحثی که در JupyterLab معرفی گردید عبارتند از:

    • The JupyterLab Interface
    • Working with Files 
    • Notebooks
    • Code Consoles
    • Terminals
    • Command Palette
    • File and output Format
    • Document and kernels


#### مراجع:

• [JupyterCon 2017](https://conferences.oreilly.com/jupyter/jup-ny-2017 )

• [JupyterLab](https://towardsdatascience.com/jupyterlab-you-should-try-this-data-science-ui-for-jupyter-right-now-a799f8914bb3)

• [IPython/Jupyter Workshop at the NGCM Summer Academy, 2017](https://github.com/jupyter/ngcm-tutorial)

• [LIGO, the 2017 Nobel prize in physics, and wrapping up Makefiles](https://berkeley-stat159-f17.github.io/stat159-f17/lectures/08-ligo-make.html)