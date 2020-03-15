---
title: "راهنمای شروع سریع هیوگو"
date: "2018-10-31"
subtitle: "ساخت قفسه کتاب آنلاین توسط هیوگو"
description: "در این آموزش ما یک قفسه کتاب آنلاین خواهیم ساخت که می توانیم کتاب هایی را برای بازدید در آن قرار دهیم و لیست کنیم"
tags: ["Hugo"]
draft: false
author: "محسن نظام الملکی"
readmore: true
---

**ساخت قفسه کتاب:**

در این آموزش ما یک قفسه کتاب آنلاین خواهیم ساخت که می توانیم کتاب هایی را برای بازدید در آن قرار دهیم و لیست کنیم.

**گام ۱ : نصب Hugo (بر روی لینوکس)‬‬**

اگر از توزیعی استفاده میکنید که ابزار snap را پشتیبانی می کند ، می توانید به راحتی با دستور زیر ، hugo  را بر روی سیستم خود نصب کنید .


```console
$ sudo apt install snapd
$ snap install hugo
```


- : نصب باینری و نصب از سورس را می توانید از سایت go.hugo.io  مطالعه کنید.
با اجرای دستور hugo help $ می توانید اطلاعاتی راجع به هیوگو بدست بیاورید. همچنین با دستور hugo version $ میتوانید از ورژن هیوگو خود مطلع شوید.

**گام ۲ : چهار چوب سایت.**

برای ساخت یک چهارچوب کلی از دستور زیر استفاده می کنیم. در اینجا ما یک چهارچوب برای سایتی با نام bookshelf ایجاد کرده ایم، شما میتوانید نام دیگری انتخاب کنید.

``` console
$ hugo new site bookshelf
```

وارد دایرکتوری bookshelf می شویم و از دایرکتوری bookshelf ، لیست ( ls ) میگیریم.

```console
$ ls -1

archtypes
config.toml
content
data
layouts
static
```

همان طور که میبینید دایرکتوری bookshelf دارای ۵ زیر دایرکتوری و یک فایل است. آنها را به ترتیب بررسی می کنیم.

- archtypes : شما می توانید توسط دستور hugo new یک محتوایه جدید ایجاد کنید ، وقتی این دستور اجرا میشود ، هیوگو یک تعداد خواص پیکربندی ( configuration properties ) مانند تاریخ ( date ) و عنوان ( title ) به پست شما اضافه میکند. Archtypes به شما این اجازه را می دهد که خواص پیکربندی دلخواه خود را تعریف کنید تا در زمان ساخت پست جدید ( با دستور hugo new ) آن خواص به صورت خودکار به آن اضافه شود.

- config.toml : هر وب سایتی باید یک فایل پیکربندی ( configuration ) در شاخه ی روت ( اصلی : root ) خود داشته باشد. در این جا به صورت پیشفرض از فایل های TOML استفاده شده است ، ولی شما می توانید از فرمت های YAML و یا JSON به همین کیفیت استفاده کنید. TOML یک فرمت پیکربندی است که خواندن آن راحت می باشد. بدین ترتیب تنظیمات پیکربندی درون فایل config.toml قرار می گیرند که برای کل وب سایت کاربردی خواهند بود. برخی از این تنظیمات شامل baseURL  و title ها می باشند.

- content : اینجا جایی است که شما محتوای سایت خود را در آن قرار می دهید. شما می توانید برای ساخت قسمت های مختلف ، درون دایرکتوری content ، زیر دایرکتوری های مختلفی بسازید. مثلا اگر وبسایت شما سه نوع وضعیت ( status ) داشته باشد مثلا ( blog , article, tutorial ) پس شما سه دایرکتوری به این نام ها درون دایرکتوری content خود خواهید داشت . نام هر یک از blog , article , tutorial برای هیوگو مفهوم خواصی دارد و برای هر یک ، یک لایه برنامه مخصوص به آن اجرا خواهد شد.

- date : این دایرکتوری فایل های پیکربندی ای را نگهداری می کند که در زمان اجرای وب سایت ، هیوگو می تواند از آنها استفاده کند. شما می توانید این فایل ها را با فرمت های YAML, JSON , TOML بنویسید.

- layouts : محتوایه این دایرکتوری برای تعیین چگونگی تبدیل محتوا برای نمایش در سایت استفاده میشوند. ( بعدا بیشتر خواهید آموخت )

- statics : این دایرکتوری شامل تمام محتوا هایه ثابت ( static ) نظیر عکس ها ، فایل های css, javascript , … می باشد.


**گام ۳: اضافه کردن محتوا.**

بیایید یک پست جدید اضافه کنیم. از hugo new استفاده می کنیم.

```console
$ hugo new post/firstpost.md
home/.../bookshelf/content/post/firstpost.md created
```

فرمان بالا یک پوشه جدید به نام post در دایرکتوری content ایجاد می کند و در آن فایلی به نام firstpost.md  می سازد. دقت کنید که پسوند md به معنی مارکدان  ( markdown ) میباشد.
فرمان زیر را برای مشاهده پوشه اجرا کنید.

```console
$ tree content

content
└── post
    └── firstpost.md

1 directory, 1 file
```
 محتوای درون firstpost.md باید به صورت زیر باشد.( یا چیزی مانند این. ممکن است به جای +++ از --- استفاده شود.)

```
+++
title = “firstpost”
draft = true
date = “2017-02-17T17:40:24+03:30”
+++
```

محتوای بین علامت +++ یک محتوای پیکربندی در فرمت TOML می باشد. این محتوای پیکربندی در اینجا frontmatter نامیده می شود. این ویژگی به شما امکان می دهد محتوای پیکربندی پست خود را به همراه محتوای آن یکجا داشته باشیم. به طور پیشفرض پست ها سه نوع خاصیت ( properties ) دارند:

- date : تاریخ و زمان ساخته شدن پست را مشخص میکند.

- draft : مشخص می کند که این پست آماده ی انتشار در سایت است یا خیر ، در حالت true ، پست در سایت به نمایش در نمی آید.

- title : عنوان پست .

بیاید یک متن کوچک اضافه کنیم .


	+++
	title = “firstpost”
	draft = true
	date = …
	+++
	سلام. امروز یکشنبه ۱ اسفند است. امروز هوا خوب بود. بارندگی چند روز اخیر همه را مسرور کرده است.




**گام ۴: سرویس دهی محتوا.**

هیوگو یک سرور درون درون ساختی ( built-in )‌ دارد که می توانید سایت خود را در آن آماده و اجرا کنید و نتیجه کار را ببینید.
فرمان زیر را درون دایرکتوری bookshelf اجرا کنید.

```console
$ hugo server
```

```console
0 of 1 draft rendered
0 future content
0 pages created
0 paginator pages created
0 tags created
0 categories created
in 9 ms
Watching for changes in /Users/shekhargulati/bookshelf/{data,content,layouts,static}
Serving pages from memory
Web Server is available at http://localhost:1313/ (bind address 127.0.0.1)
Press Ctrl+C to stop
```

شما می توانید بلاگ خود را در آدرس مشخص شده مشاهده کنید.

http://localhost:1313

به این آدرس بروید و خب چیزی نخواهید دید!

این امر دو دلیل دارد :

۱ – همان طور که در خروجی hugo server مشاهده می کنید ، هیوگو پست های draft شده را ایجاد نمی کند.

۲ – ما هیچ مشخصاتی برای چگونگی نمایش محتوا ( ظاهر ) نداریم ، بنابر این چیزی به نمایش در نمی آید و باید از یک تم برای رفع این مشکل استفاده کنیم. ما این کار را در گام بعدی انجام خواهیم داد.

برای اجرای سایت به همراه نمایش فایل های draft شده دستور زیر را وارد می کنیم.

```console
$ hugo server --buildDrafts
```

```console
1 of 1 draft rendered
0 future content
1 pages created
0 paginator pages created
0 tags created
0 categories created
in 6 ms
Watching for changes in /Users/shekhargulati/bookshelf/{data,content,layouts,static}
Serving pages from memory
Web Server is available at http://localhost:1313/ (bind address 127.0.0.1)
Press Ctrl+C to stop
```

اگر به آدرس http://localhost:1313 بروید باز چیزی مشاهده نخواهید کرد.

**گام ۵: اضافه کردن تم :**

تم ها یک لایه از الگوها ( templates ) را برای تولید سایت ارایه می کنند. شما می توانید تعداد زیادی تم که به صورت اپن سورس وجود دارند را در آدرس https://theme.gohugo.io ببینید و استفاده کنید.

تم ها باید در دایرکتوری theme اضافه شوند.

دستور زیر را وارد می کنیم.

```console
$ cd theme
```

حالا می خواهیم تم robust را اضافه کنیم.

```console
$ git clone https://github.com/dim0627/hugo_theme_robust.git
$ (cd hugo_theme_robust; git checkout b8ce466)
$ cd ..
```

 اجرای دوباره ی سرور :

```console
$ hugo server --theme=hugo_theme_robust --buildDrafts
```

```console
1 of 1 draft rendered
0 future content
1 pages created
2 paginator pages created
0 tags created
0 categories created
in 10 ms
Watching for changes in /Users/shekhargulati/bookshelf/{data,content,layouts,static,themes}
Serving pages from memory
Web Server is available at http://localhost:1313/ (bind address 127.0.0.1)
Press Ctrl+C to stop
```

به آدرس http://locolhost:1313  بروید و نتیجه را مشاهده کنید. سایت شما ظاهری مانند این خواهد داشت:

[![poster](../../img/quick_start_hugo/hugoImage1.png)](../../img/quick_start_hugo/hugoImage1.png)

بیایید لایه های مختلف تم را یاد بگیریم .یک تم از اجزای زیر ساخته شده است .


- theme.toml : فایل پیکربندی ( configuration ) تم می باشد و اطلاعاتی نظیر اسم تم ، توضیحی درباره ی تم ، نویسنده و جزییات تم و لایسنس آن می دهد.
- دایرکتوری image : شامل دو عکس از ظاهر لیست ها و پست ها به عنوان نمونه است.
- دایرکتوری layouts : در این دایرکتوری فایل های html برای به نمایش در آوردن انواع محتوا نظیر ، نوار کناری سایت ( side bar )‌ ، فوتر سایت ( footer ) ، هدر سایت ( header ) ، لیست ها و صفحه ی اصلی و مانند اینها وجود دارند . در واقع ظاهر سایت،  قسمت بندی شده است و همگی با هم ظاهر سایت را می سازند. هر نوع محتوا شامل دو فایل به نام های single.html و list.html می باشد. برای مثال ، یک پست را که شما در سایت مشاهده می کنید ، دو حالت دارد، وقتی آن را در صفحه ای به صورت لیست شده با دیگر پست ها می بینید ، یک قسمت یه صورت خلاصه از آن پیداست و با کلیک بر روی لینک بیشتر، یا  ادامه می توانید پست را به صورت کامل مشاهده کنید. به این حالت ، حالت تک صفحه ای ( single page ) ، به حالت قبل ، حالت لیست ( list ) می گویند . حال برای تغییر در ظاهر پست در هر یک از این حالت ها فایل متناظر با آن،‌ list.html و یا single.html را تغییر خواهیم داد.
- دایرکتوری static : تمامی محتویات استاتیک سایت نظیر استایل های CSS و کتابخانه های جاوااسکریپت نظیر jquery , … که در سایت استفاده می شوند در اینجا قرار دارند.

**گام ۶ : استفاده از چند تم:**

شما به راحتی می توانید تم های مختلف را به وسیله ی سوییچ کردن بین آنها برای محتوای خود انتخاب کنید. فرض می کنیم که می خواهیم تم bleak را به سایت خود اضافه کنیم. ما تم bleak را با دستور زیر در دایرکتوری theme کپی می کنیم.

```console
$ git clone https://github.com/Zenithar/hugo-theme-bleak.git
```

سرور را دوباره راه اندازی می کنیم ، البته با تم hugo-theme-bleak .

```console
$ hugo server --theme=hugo-theme-bleak --buildDrafts
```

حالا وب سایت شما چنین ظاهری خواهد داشت.
( عکس از سایت اصلی گرفته شده است ).

[![poster](../../img/quick_start_hugo/hugoImage2.png)](../../img/quick_start_hugo/hugoImage2.png)

**گام ۷ : به روز رسانی فایل پیکربندی سایت ، config.toml .**

سرور را با تم robust مجددا راه اندازی کنید.

```console
$ hugo server --theme=hugo_theme_robust --buildDrafts
```

وب سایت از مقادیر مشخص شده در فایل bookshelf/config.toml  استفاده میکند. بیایید این فایل را بروز رسانی کنیم.

```toml
languageCode="en-us"
title= "سایت هیوگو "
baseURL=" http://example.org/"
[Params]
	Author= " محسن "
```

هیوگو از یک سیستم ریلود زنده ( live reloading ) برای آپدیت تغییرات استفاده می کند. بدین ترتیب که نیازی نیست سرور را ریست کنید و سایت به طور خودکار تغییر می کند. می توانید تغییرات ایجاد شده را ببینید.

[![poster](../../img/quick_start_hugo/hugoImage3.png)](../../img/quick_start_hugo/hugoImage3.png)


**گام ۸: شخصی سازی تم robust:**

تم robust شروع خوبی برای کتاب خانه ی آنلاین ما است، اما ما می خواهیم که متناست با نیازهاییمان کمی آن را تغییر بدهیم.

هیوگو ایجاد تغییرات در تم را خیلی راحت کرده است . شما حتی می توانید تم خود را از صفر بسازید ، که در درس های آینده آن را فرا خواهید گرفت. اگر می خواهید تم خود را از صفر بسازید به سایت go.hugo و به قسمت documentaition مراجعه کنید.

اولین تغییری که باید انجام دهید، تغییر تصاویر پیشفرض برای سایت است.

تمام تصاویر استفاده شده در سایت، در آدرس theme/hugo-theme-robust/static/images/defult.jpg قرار دارند. ما میتوانیم به راحتی با ساختن یک دایرکتوری مشابه ،مسیر دایرکتوری قبل را باطل کنیم.

یک دایرکتوری به نام images درون دایرکتوری bookshelf/static بسازید و عکس مورد نظر خود را با نام default.jpg در آنجا کپی کنید. ما از عکس زیر استفاده خواهیم کرد.


[![poster](../../img/quick_start_hugo/hugoImage4.png)](../../img/quick_start_hugo/hugoImage4.png)

بعد از قرار دادن عکس ، سایت به این شکل میشود.

[![poster](../../img/quick_start_hugo/hugoImage5.png)](../../img/quick_start_hugo/hugoImage5.png)

توجه: اگر بعد از انجام عملیات فوق، تغییری مشاهده نکردید، به این دلیل است که محتوای عکس در حافظه کش مرورگر شما ذخیره شده است ، که این مشکل با ریست کردن سیستم درست خواهد شد.

حالا ما می خواهیم صفحه را طوری تغییر دهیم که نوشته زیر عکس پنهان شود و فقط عکس ها معلوم باشند. فایل index.html درون دایرکتوری /layouts در دایرکتوری تم مورد نظر به li که مشخصه لیست ها می باشد اشاره دارد. در زیر محتوای آن را می بینیم.

```html
<article class="li">
  <a href="{{ .Permalink }}" class="clearfix">
    <div class="image" style="background-image: url({{ $.Site.BaseURL }}images/{{ with .Params.image }}{{ . }}{{ else }}default.jpg{{ end }});"></div>
    <div class="detail">
      <time>{{ with .Site.Params.DateForm }}{{ $.Date.Format . }}{{ else }}{{ $.Date.Format "Mon, Jan 2, 2006" }}{{ end }}</time>
      <h2 class="title">{{ .Title }}</h2>
      <div class="summary">{{ .Summary }}</div>
    </div>
  </a>
</article>
```

یک فایل جدید به نام li.html درون دایرکتوری bookshelf/layouts/_default بسازید و محتوای زیر را درون آن کپی کنید بدین ترتیب ما مسیر قبلی را برای سایت باطل کردیم و از این به بعد سایت برای نمایش لیست ها از این فایل استفاده میکند.

```html
<article class="li">
  <a href="{{ .Permalink }}" class="clearfix">
    <div class="image" style="background-image: url({{ $.Site.BaseURL }}images/{{ with .Params.image }}{{ . }}{{ else }}default.jpg{{ end }});"></div>
  </a>
</article>
```

حالا وبسایت مطابق زیر نمایش داده خواهد شد.

[![poster](../../img/quick_start_hugo/hugoImage6.png)](../../img/quick_start_hugo/hugoImage6.png)

حالا می خواهیم اطلاعات مربوط به تم ، در قسمت فوتر ( footer ) سایت را حذف کنیم. بنابراین یک دایرکتوری جدید به نام partials درون دایرکتوری bookshelf/layouts می سازیم. در آن جا یک فایل جدید با نام default_foot.html می سازیم و محتویات فایل layouts/partials/default_foot.html  واقع در دایرکتوری تم را در آن کپی می کنیم. محتوای مربوط به قسمت footer را با محتویات زیر جایگزین می کنیم.

```html
<footer class="site">
  <p>{{ with .Site.Copyright | safeHTML }}{{ . }}{{ else }}&copy; {{ $.Site.LastChange.Year }} {{ if isset $.Site.Params "Author" }}{{ $.Site.Params.Author }}{{ else }}{{ .Site.Title }}{{ end }}{{ end }}</p>
  <p>Powered by <a href="http://gohugo.io" target="_blank">Hugo</a>,</p>
</footer>
```

ما همچنین سایدبار ( sidebar ) سایت را هم پاک می کنیم .

می خواهیم فایل index.html  واقع در دایرکتوری layouts  از دایرکتوری تم را در دایرکتوری bookshelf/layouts کپی کنیم.

قسمت مربوط به سایدبار را پاک می کنیم.

```html
<div class="col-sm-3">
  {{ partial "sidebar.html" . }}
</div>
```

تا اینجا ما از یک عکس به عنوان پیشفر	ض برای سایتمان استفاده کرده ایم، اما شاید بخواهیم برای هر کتابی از یک عکس استفاده کنیم. برین منظور تغییر زیر را در فایل firstpost.md ایجاد می کنیم.

```toml
+++
title = "firstpost"
draft = true
date = "2017-02-17T17:40:24+03:30"
image=firstpost.jpg
+++
سلام. امروز یکشنبه ۱ اسفند است. امروز هوا خوب بود. بارندگی چند روز اخیر همه را خوش حال کرده است.
```

حال عکس مورد نظر خود را به نام firstpost.jpg تغییر داده و در دایرکتوری bookshelf/static/image قرار دهید. بعد از اضافه کردن چندین کتاب وب سایت نویسنده ، به این صورت در آمده است.


[![poster](../../img/quick_start_hugo/hugoImage7.png)](../../img/quick_start_hugo/hugoImage7.png)

**گام ۹ : ایجاد پست عمومی ( public ):**

تا اینجا تمام پست های ما در حالت پیش نویس ( draft ) بودنده اند. برای تبدیل این پست ها به حالت عمومی میتوانید دستور زیر را اجرا کنید و یا به صورت دستی مقدار draft را در front-matter پست false قرار دهید

```console
$ hugo undraft content/post/first.md
```

حالا می توانید سرور را بدون عبارت buildDrafts اجرا کنید.

```console
$ hugo server --theme=hugo_theme_robust
```

**گام ۱۰: یکپارچه سازی Disqus :**

disqus به شما اجازه می دهد که کامنت ها را در بلاگ خود یکپارچه سازی کنید، برای فعال کردن Disqus ، تنها کافی است که یک disqus short name به فایل config.toml خود مانند زیر اضافه کنید.

```toml
[Params]
  Author = "mohsen"
  disqusShortname = <your disqus shortname>
```

بعد از انجام این عمل امکان کامنت گذاشتن به سایت شما اضافه می شود، مانند زیر :
( عکس از سایت نویسنده می باشد.)

[![poster](../../img/quick_start_hugo/hugoImage8.png)](../../img/quick_start_hugo/hugoImage8.png)


**گام ۱۱: قرار دادن سایت بر روی سرور:**

برای ایجاد وبسایت خود می توانید آن را در صفحه ی گیت هاب قرار دهید.

ابتدا فایل bookshelf/config.toml و مقدار baseURL را تغییر بدهید.

```toml
baseURL = "https://<your GitHub username>.github.io/bookshelf/"
```

سپس دستور زیر را اجرا کنید.

```console
$ hugo --theme=hugo_theme_robust
```

```console
0 draft content
0 future content
5 pages created
2 paginator pages created
0 tags created
0 categories created
in 17 ms
```

**گام ۱۲ : قرار دادن سورس bookshelf در صفحه ی گیت هاب :**

در اینجا می خواهیم از امکانات گیت ( git ) برای سایت خود استفاده کنیم.

در دایرکتوری روت دستورات زیر را وارد می کنیم.

```console
$ git init
```

برای ایجاد کردن git بر روی دایرکتوری جاری.

```console
$ echo "/public/" >> .gitignore
$ echo "/themes/" >> .gitignore
```

پوشه های pubic و theme  را در لیست gitignore قرار می دهیم، بدین ترتیب در هنگام ارسال پروژه به سرور محتوای این دو پوشه فرستاده نمی شود.

```console
$ git add –all
```

اضافه کردن همه ی تغییرات به حافظه میانجی

```console
$ git status
```

دیدن تغییرات

```console
$ git commit -m "Initial commit"
```

اعمال تغییرات

m- برای اضافه کردن یک توضیح


دلیل این که public و theme را از این گیت حذف کردیم این بود که مخازن bookshelf/theme و bookshelf و bookshelf/public با هم در تداخل نباشند. برای themes و public به صورت جداگانه گیت خواهیم ساخت.( در ادامه ی این پروژه ما تنها برای public یک گیت جداگانه ایجاد می کنیم و کاری با theme نخواهیم داشت. )

یک مخزن جدید به نام bookshelf در صفحه ی گیت هاب خود ایجاد کنید.( همراه یک README ) . بعد یک مخزن گیت بر روی کامپیوتر شخصی و در دایرکتوری bookshelf/public ایجاد کنید و سپس یک ریموت در آن ایجاد کنید. مانند زیر:


```console
$ cd public
$ git init
$ git remote add origin git@github.com:<github-username>/bookshelf.git
```

خب حالا ما یک انشعاب جدید ،درست می کنیم.

```console
$ git checkout -b gh-pages
Switched to a new branch 'gh-pages'
```

تمام فایل های موجود در دایرکتوری bookshelf/pubic را به فهرست git اضافه کرده و سپس آنها را کامیت ( commit ) می کنیم و در آخر به گیت هاب انتقال می دهیم .

```console
$ git add --all
$ git commit -m "bookshelf added"
$ git push -f origin gh-pages
```

فرستادن تغییرات به شاخه ی gh-page

در عرض کمتر از ده دقیقه شما می توانید تغییرات را در سایت خود واقع درhttps://<github-username>.github.io/bookshelf/ مشاهده کنید.

شما هر موقع می توانید سایت خود را توسط دستورات زیر بازتولید کنید.

```console
$ (cd ..; hugo --theme=hugo_theme_robust)
$ git add --all
$ git commit -m "<some change message>"
$ git push -f origin gh-pages
```

نوشته شده توسط *Shekhar Gulati*.
