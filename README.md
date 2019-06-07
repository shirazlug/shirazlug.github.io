![Build Status](https://gitlab.com/shirazlug/shirazlug.gitlab.io/badges/master/build.svg)

---
## داستان ما

 اعضای جامعه ی کاربری  شیرازلاگ تصمیم گرفتند تا توسعه سایت را
 به گیت لب و سرویس صفحات آن منتقل کنند.

برخی از این نیاز ها عبارت اند از:
- آسانی در مشارکت همگانی
- انعطاف پذیری و کنترل بالا در توسعه
- مزایای استفاده از یک سیستم مدیریت نسخه مانند گیت(git)


---

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [سرویس گیت لب سی آی](#%D8%B3%D8%B1%D9%88%DB%8C%D8%B3-%DA%AF%DB%8C%D8%AA-%D9%84%D8%A8-%D8%B3%DB%8C-%D8%A2%DB%8C)
- [چگونه میتوانید کمک کنید؟](#%DA%86%DA%AF%D9%88%D9%86%D9%87-%D9%85%DB%8C%D8%AA%D9%88%D8%A7%D9%86%DB%8C%D8%AF-%DA%A9%D9%85%DA%A9-%DA%A9%D9%86%DB%8C%D8%AF%D8%9F)
    - [نحوه ی کار با پروژه بر روی کامپیوتر شخصی](#%D9%86%D8%AD%D9%88%D9%87-%DB%8C-%DA%A9%D8%A7%D8%B1-%D8%A8%D8%A7-%D9%BE%D8%B1%D9%88%DA%98%D9%87-%D8%A8%D8%B1-%D8%B1%D9%88%DB%8C-%DA%A9%D8%A7%D9%85%D9%BE%DB%8C%D9%88%D8%AA%D8%B1-%D8%B4%D8%AE%D8%B5%DB%8C)
        - [پیش نمایش وبسایت](#%D9%BE%DB%8C%D8%B4-%D9%86%D9%85%D8%A7%DB%8C%D8%B4-%D9%88%D8%A8%D8%B3%D8%A7%DB%8C%D8%AA)
    - [Troubleshooting](#troubleshooting)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## سرویس گیت لب **سی آی**

This project's static Pages are built by [GitLab CI][ci], following the steps
defined in [`.gitlab-ci.yml`](.gitlab-ci.yml):

```
image: alpine:3.4

before_script:
  - apk update && apk add openssl
  - wget https://github.com/spf13/hugo/releases/download/v0.16/hugo_0.16_linux-64bit.tgz
  - echo "37ee91ab3469afbf7602a091d466dfa5  hugo_0.16_linux-64bit.tgz" | md5sum -c
  - tar xf hugo_0.16_linux-64bit.tgz && cp ./hugo /usr/bin
  - hugo version

pages:
  script:
  - hugo
  artifacts:
    paths:
    - public
  only:
  - master
```
# چگونه میتوانید کمک کنید؟

## نحوه ی کار با پروژه بر روی کامپیوتر شخصی

To work locally with this project, you'll have to follow the steps below:

1. **Fork**, clone or download this project
1. [Install][] **Hugo**
1. Preview your project: `hugo server`
1. Add content
1. Generate the website: `hugo` (غیر لازم برای این پروژه)

برای مطالعه ی بیشتر برای کار با هوگو به وبسایت آن مراجعه کنید. [documentation][].

### پیش نمایش وبسایت

If you **clone** or **download** this project to your local computer and run `hugo server`,
your site can be accessed under `localhost:1313/hugo/`.


## Troubleshooting

1. CSS is missing! That means two things:

    Either that you have wrongly set up the CSS URL in your templates, or
    your static generator has a configuration option that needs to be explicitly
    set in order to serve static assets under a relative URL.

[ci]: https://about.gitlab.com/gitlab-ci/
[hugo]: https://gohugo.io
[install]: https://gohugo.io/overview/installing/
[documentation]: https://gohugo.io/overview/introduction/
[userpages]: http://doc.gitlab.com/ee/pages/README.html#user-or-group-pages
[projpages]: http://doc.gitlab.com/ee/pages/README.html#project-pages
[post]: https://about.gitlab.com/2016/04/07/gitlab-pages-setup/#custom-domains
