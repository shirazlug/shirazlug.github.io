---
title: "معرفی RustDesk (نرم‌افزار آزاد دسترسی از راه دور)"
date: "2025-11-10"
subtitle: "جایگزین آزاد برای TeamViewer/AnyDesk با امکان خودمیزبانی"
description: "راهنمای کوتاه نصب، شروع سریع و راه‌اندازی سرور خودمیزبانِ RustDesk"
tags: ["RustDesk","Remote Desktop","Self-Hosted","Linux"]
draft: false
author: "علی خاک باز"
readmore: true
needshighlight: true
---

# راهنمای جامع RustDesk برای کاربران لینوکس
راهنمایی برای مدیران سیستم، برنامه‌نویسان و کاربران حرفه‌ای: معرفی RustDesk، نصب سریع کلاینت، راه‌اندازی سرور self-host با Docker، نکات امنیتی (TLS/فایروال)، مجوز نرم‌افزار، و نکات عملیاتی.

---

## فهرست مطالب
- [معرفی RustDesk](#معرفی-rustdesk)
- [نصب سریع کلاینت روی لینوکس](#نصب-سریع-کلاینت-روی-لینوکس)
- [راه‌اندازی سرور Self-Hosted با Docker](#راهاندازی-سرور-selfhosted-با-docker)  
  - [پیش‌نیازها](#پیشنیازها)  
  - [پورت‌های موردنیاز](#پورتهای-موردنیاز)  
  - [نمونه `docker-compose.yml`](#نمونه-docker-composeyml)  
  - [تولید کلید رمزنگاری سرور (E2E)](#تولید-کلید-رمزنگاری-سرور-e2e)  
  - [اتصال کلاینت‌ها به سرور شما](#اتصال-کلاینتها-به-سرور-شما)  
  - [LAN در برابر اینترنت (DNS/Port Forwarding)](#lan-در-برابر-اینترنت-dnsport-forwarding)
- [نکات امنیتی](#نکات-امنیتی)  
  - [فعال‌سازی TLS با Nginx/Let’s Encrypt](#فعالسازی-tls-با-nginxlets-encrypt)  
  - [فعال‌سازی TLS با Caddy](#فعالسازی-tls-با-caddy)  
  - [تنظیم فایروال (UFW/Firewalld)](#تنظیم-فایروال-ufwfirewalld)  
  - [مدیریت کلید و رمزنگاری انتها-به-انتها](#مدیریت-کلید-و-رمزنگاری-انتها-به-انتها)
- [مجوز نرم‌افزار (License)](#مجوز-نرم‌افزار-license)
- [نکات تکمیلی و عملیاتی](#نکات-تکمیلی-و-عملیاتی)  
  - [پشتیبان‌گیری](#پشتیبانگیری)  
  - [به‌روزرسانی سرور Docker](#بهرورسانی-سرور-docker)  
  - [LDAP/SSO در نسخه‌ی Pro](#ldapssso-در-نسخهی-pro)
- [عیب‌یابی سریع](#عیبیابی-سریع)

---

## معرفی RustDesk
**RustDesk** یک نرم‌افزار متن‌باز دسترسی از راه دور (Remote Desktop) با قابلیت **خودمیزبانی (Self-Hosting)** است که جایگزینی کامل برای TeamViewer/AnyDesk با کنترل کامل بر داده‌ها به شمار می‌رود. معماری آن شامل موارد زیر است:
- **hbbs** (سرور شناسه/ثبت): برای کشف و هماهنگی اتصال به کار می‌رود.
- **hbbr** (سرور رله یا Relay): عبور ترافیک وقتی اتصال مستقیم P2P ممکن نیست.

در حالت عادی، کلاینت‌ها از طریق **NAT hole punching** به‌صورت **P2P** وصل می‌شوند؛ hlh اگر نشد، ترافیک از رله عبور می‌کند. رمزنگاری **End-to-End** با کلید عمومی/خصوصی نیز، حریم خصوصی را تضمین می‌کند.

---

## نصب سریع کلاینت روی لینوکس
### 1) دریافت بسته
- از **GitHub Releases** یا وب‌سایت رسمی Rustdesk، بسته متناسب با توزیع خود را دریافت کنید.
### 2) نصب (Debian/Ubuntu)
```bash
sudo apt install -y ./rustdesk-<version>.deb
```

**Fedora/RHEL:**
```bash
sudo dnf install -y ./rustdesk-<version>.rpm
# یا:
# sudo yum localinstall ./rustdesk-<version>.rpm
```

**Arch:**
```bash
sudo pacman -U ./rustdesk-<version>.pkg.tar.zst
```

**Flatpak (Flathub):**
```bash
flatpak install flathub com.rustdesk.RustDesk
```

> نکته: برای اجرای AppImage ممکن است به `libfuse2` نیاز داشته باشید. در سیستم‌های Wayland، تجربه‌ی پایدارتر معمولاً با استفاده از Xorg به دست می‌آید.

---

## راه‌اندازی سرور Self-Hosted با Docker

### پیش‌نیازها
- داشتن یک سرور لینوکسی (VPS یا on-prem) با Docker و ترجیحاً **Docker Compose**
- داشتن دسترسی روت یا sudo
- داشتن دامنه (برای دسترسی از اینترنت و گواهی TLS) — اختیاری برای LAN

**نصب سریع Docker (نمونهٔ کد):**
```bash
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER
# سپس از سیستم خارج/وارد شوید
```

### پورت‌های موردنیاز
- `21115/tcp` – سیگنال/تست NAT (hbbs)
- `21116/tcp` و `21116/udp` – سرور ID (hbbs)
- `21117/tcp` – سرور رله (hbbr)
- (اختیاری وب‌کلاینت) `21118/tcp` و `21119/tcp`

> اگر فقط در LAN هستید و وب‌کلاینت نمی‌خواهید، معمولاً پورت‌های 21115–21117 کافی است. در صورتی که اتصال اینترنت شما ضعیف است، می‌توانید از مقالهٔ دیگر من با نام [راهنمای اجرای RustDesk برای شبکه‌های ضعیف](https://driver.filefox.ir/article/rustdesk-for-weak-networks-performance-optimization-solutions/) برای مدیریت این مشکل استفاده کنید.

### نمونه `docker-compose.yml`
یک پوشه‌ی کاری (برای دایرکتوری پروژه) بسازید و فایل زیر را در آن قرار دهید:

```yaml
version: "3"
services:
  hbbr:
    image: rustdesk/rustdesk-server:latest
    container_name: hbbr
    command: hbbr
    network_mode: "host"
    volumes:
      - ./data:/root
    restart: unless-stopped

  hbbs:
    image: rustdesk/rustdesk-server:latest
    container_name: hbbs
    command: hbbs
    network_mode: "host"
    volumes:
      - ./data:/root
    depends_on:
      - hbbr
    restart: unless-stopped
```

برای اجرای سرویس‌ها:
```bash
docker compose up -d
docker ps
docker logs -f hbbs
```

> اگر نمی‌توانید از `network_mode: host` استفاده کنید، پورت‌ها را `publish` کنید:
> ```yaml
> ports:
>   - "21115:21115/tcp"
>   - "21116:21116/tcp"
>   - "21116:21116/udp"
>   - "21117:21117/tcp"
>   - "21118:21118/tcp"
>   - "21119:21119/tcp"
> ```

### تولید کلید رمزنگاری سرور (E2E)
در اولین اجرا، جفت‌کلید **Ed25519** در مسیر ولوم (Docker Volume) (`./data`) ساخته می‌شود. اگر لازم بود دستی بسازید/مشاهده کنید می‌توانید از این کد استفاده کنید:

```bash
docker exec hbbs /usr/bin/rustdesk-utils genkey
# کلید عمومی در:  ./data/id_ed25519.pub
# کلید خصوصی در:  ./data/id_ed25519
```

### اتصال کلاینت‌ها به سرور شما
روی هر کلاینت RustDesk:
1. به **Settings → Network** بروید.
2. آدرس سرور ID و Relay را مطابق با دامنه/آی‌پی سرور خود تنظیم کنید (مثلاً `your-domain:21116` برای hbbs).
3. مقدار **Key** را از محتوای `id_ed25519.pub` سرور کپی و وارد کنید.

> در نظر داشته باشید که بدون وارد کردن کلید عمومی، هشدار عدم رمزگذاری E2E نمایش داده می‌شود.

### تفاوت اجرا در LAN در مقایسه با اینترنت
- **LAN:** کافی است آی‌پی داخلی سرور و پورت‌ها در فایروال باز باشد.
- **اینترنت:** باید روی روتر/فایروال، Port Forwarding انجام دهید (21115–21117 و در صورت نیاز 21118–21119) و یک **DNS** (دامنه یا DDNS) تنظیم کنید تا بعداً برای TLS هم استفاده شود.

---

## نکات امنیتی

### فعال‌سازی TLS با Nginx/Let’s Encrypt
برای وب‌کلاینت/وب‌سوکت‌ها (21118/21119) پیشنهاد می‌شود Nginx را به‌عنوان **Reverse Proxy** جلوی سرور قرار دهید و گواهی معتبری (مانند Let’s Encrypt) دریافت کنید.

**نمونه‌ی بسیار ساده (مسیر عمومی برای hbbs روی 21118):**
```nginx
server {
    listen 80;
    server_name your-domain.com;
    location /.well-known/acme-challenge/ { root /var/www/html; }
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl http2;
    server_name your-domain.com;

    ssl_certificate     /etc/letsencrypt/live/your-domain.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/your-domain.com/privkey.pem;

    # وب‌سوکت به hbbs (21118)
    location / {
        proxy_pass http://127.0.0.1:21118;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_read_timeout 3600;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header X-Forwarded-For $remote_addr;
    }
}
```

برای hbbr (21119) می‌توانید مسیر/سرور بلاک جداگانه تعریف کنید.
برای دریافت گواهی با **certbot**:

```bash
sudo apt install -y certbot python3-certbot-nginx
sudo certbot --nginx -d your-domain.com
```

### فعال‌سازی TLS با Caddy
Caddy گواهی Let’s Encrypt را خودکار مدیریت می‌کند:

```caddy
your-domain.com {
  reverse_proxy 127.0.0.1:21118
}
# برای hbbr نیز بلاک دیگری اضافه کنید (مثلاً زیردامنه‌ی relay.your-domain.com)
```

> حتماً هدرهای Upgrade/Connection برای WebSocket در وب‌سرورِ انتخابی تنظیم شوند.

### تنظیمات فایروال (UFW/Firewalld)
**UFW (Ubuntu):**
```bash
sudo ufw allow 21115/tcp
sudo ufw allow 21116/tcp
sudo ufw allow 21116/udp
sudo ufw allow 21117/tcp
# در صورت نیاز به وب‌کلاینت:
sudo ufw allow 21118/tcp
sudo ufw allow 21119/tcp
# برای TLS/Certbot:
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable
sudo ufw status
```

**Firewalld (RHEL/Fedora):**
```bash
sudo firewall-cmd --permanent --add-port=21115/tcp
sudo firewall-cmd --permanent --add-port=21116/tcp
sudo firewall-cmd --permanent --add-port=21116/udp
sudo firewall-cmd --permanent --add-port=21117/tcp
sudo firewall-cmd --permanent --add-port=21118/tcp
sudo firewall-cmd --permanent --add-port=21119/tcp
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload
```

> اصل طلایی: فقط پورت‌های لازم را باز بگذارید. در سناریوهای سازمانی حتی می‌توانید دسترسی را به رنج‌های آی‌پی مشخص محدود کنید.

### مدیریت کلید و رمزنگاری انتها-به-انتها
- **کلید خصوصی** (`id_ed25519`) را حتما در فضایی امن نگه دارید (فضایی با دسترسی حداقلی و پشتیبان‌گیری مطمئن).
- **کلید عمومی** (`id_ed25519.pub`) را در همه‌ی کلاینت‌ها وارد کنید تا حملهٔ **MITM** غیرممکن شود.
- در زمان مهاجرت یا بازیابی، همین کلید را منتقل کنید تا نیاز به تغییرات در سمت کلاینت نباشد.

---

## مجوز نرم‌افزار (License)
RustDesk یک نرم‌افزار متن‌باز است که تحت مجوز GNU AGPLv3 منتشر می‌شود. استفاده از برنامه و انتشار نسخهٔ دست‌نخوردهٔ آن رایگان است. اگر کد را تغییر بدهید و نسخهٔ تغییر‌یافته را به‌صورت سرویس شبکه‌ای در اختیار دیگران بگذارید، طبق الزامات AGPLv3 باید همان کدِ تغییر‌یافته را نیز در دسترس عموم قرار دهید. در کنار نسخهٔ متن‌باز (OSS)، نسخهٔ تجاری Pro برای نیازهای سازمانی عرضه می‌شود که قابلیت‌هایی مانند وب‌کنسول مدیریتی، کنترل دسترسی (ACL)، ورود یکپارچه (SSO/OIDC)، اتصال به LDAP/Active Directory، گزارش‌گیری و پشتیبانی از چند رله متفاوت را فراهم می‌کند. با این همه، برای بیشتر سناریوهای معمولِ دسترسی از راه دور، همان نسخهٔ متن‌باز کفایت می‌کند.

---

## نکات تکمیلی و عملیاتی

### پشتیبان‌گیری
- در استقرار با OSS، کافی است پوشه‌ی **`./data`** (که به `/root` کانتینر مپ شده) و حاوی کلیدها و تنظیمات است را به صورت دوره‌ای بکاپ بگیرید.
- در نسخهٔ Pro (در صورت استفاده)، پایگاه‌داده/لاگ‌های مربوطه را هم در بکاپ بگنجانید.

نمونه اسکریپت ساده‌ای برای پشتیبان‌گیری روزانه:
```bash
#!/usr/bin/env bash
set -euo pipefail
TS=$(date +%F-%H%M%S)
SRC=/opt/rustdesk/data
DST=/backup/rustdesk
mkdir -p "$DST"
tar -C "$SRC/.." -czf "$DST/rustdesk-$TS.tgz" "$(basename "$SRC")"
find "$DST" -type f -name 'rustdesk-*.tgz' -mtime +14 -delete
```

### به‌روزرسانی سرور Docker
```bash
docker compose pull
docker compose up -d --force-recreate
```
> قبل از ارتقاء نسخه‌های اصلی، یک بکاپ تازه بگیرید.

### LDAP/SSO در نسخه‌ی Pro
- احراز هویت متمرکز با **LDAP/Active Directory** و یا **OIDC/SSO** در کنسول وب نسخهٔ Pro قابل پیکربندی است و نسخهٔ Pro مدیریت متمرکز کاربران را ممکن می‌کند (با LDAP/AD/SSO): یعنی کاربر با حساب سازمانی وارد می‌شود و دسترسی‌ها را از یک جا می‌توان اعطا کرد یا قطع کرد.  نسخهٔ متن‌باز (OSS) مرکز کاربری ندارد؛ هر دستگاه جداگانه تنظیم و کنترل می‌شود، پس مدیریت گسترده سخت‌تر است.

---

## عیب‌یابی سریع
در صورت مواجهه با مشکلات زیر، راه‌کارهای عیب‌یابی مطرح‌شده را دنبال کنید:
- **اتصال برقرار نمی‌شود:** بررسی فایروال (هاست/کلود/روتر)، Port Forwarding، و باز بودن UDP روی 21116.  
- **P2P شکست می‌خورد و رله هم جواب نمی‌دهد:** اطمینان از دسترسی به `21117/tcp` از اینترنت.  
- **هشدار Key/بدون E2E:** تنظیم بودن کلید عمومی سرور را در کلاینت‌ها بررسی کنید.  
- **وب‌کلاینت کار نمی‌کند:** بررسی TLS/Reverse Proxy و هدرهای Upgrade/Connection.  
- **Wayland:** برای کنترل جلسه ورود/لاک‌اسکرین، از سشن Xorg استفاده کنید یا تنظیمات Wayland/GDM را مطابق نیاز تغییر دهید.


