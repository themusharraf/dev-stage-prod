# DjangoProject — Multi Environment Setup (dev / stage / prod)

Ushbu loyiha `Django` uchun **multi-environment setup** (development, staging, production) strukturasida yozilgan.  
Har bir environment uchun alohida `settings` fayllar mavjud va `.env` fayllar orqali konfiguratsiya boshqariladi.

---

## 📂 Project Structure

```
DjangoProject/
├── core/                  # asosiy app
├── root/                  # settings papkasi
│   ├── __init__.py
│   ├── base.py            # umumiy settings (hamma env uchun)
│   ├── dev.py             # dev settings
│   ├── stage.py           # staging settings
│   ├── prod.py            # production settings
├── .env.dev               # Default environment variables
├── .env.dev               # faqat local dev uchun
├── .env.stage             # staging server uchun
├── .env.prod              # production server uchun
├── manage.py
└── requirements.txt
```

---

## ⚙️ Environment Management

Loyihada `.env` fayllar orqali environment lar boshqariladi:

- `.env.dev` → **Development**
- `.env.stage` → **Staging**
- `.env.prod` → **Production**

`DJANGO_SETTINGS_MODULE` o‘zgaruvchisi orqali qaysi settings yuklanishini belgilaysiz:

```bash
# Development
export DJANGO_SETTINGS_MODULE=root.settings.dev

# Staging
export DJANGO_SETTINGS_MODULE=root.settings.stage

# Production
export DJANGO_SETTINGS_MODULE=root.settings.prod
```

## 🛠️ Makefile Commands

Makefile orqali tezkor ishlatish mumkin:

```bash
# Development server
make run-dev

# Staging server
make run-stage

# Production server
make run-prod

# Apply migrations
make migrate
```

## Docker command

```bash
# Development
docker-compose -f docker/dev/docker-compose.dev.yml up --build

# Staging
docker-compose -f docker/stage/docker-compose.stage.yml up -d --build

# Production
docker-compose -f docker/prod/docker-compose.prod.yml up -d --build

```

## 🔍 Health Check Endpoint

Loyiha ichida health_check endpoint mavjud, u DB bilan ulanishni tekshiradi va joriy environment ni qaytaradi:

```json
{
  "status": "ok",
  "record": [
    {
      "id": 1,
      "name": "Musharraf"
    }
  ]
} 
```

## 🚀 Deploy

- Mos .env.* faylni tanlang
- DJANGO_SETTINGS_MODULE ni sozlang
- python manage.py migrate
- python manage.py runserver yoki gunicorn orqali ishga tushiring
- ✅ Shu struktura orqali `dev → stage → prod` ga oson o‘tish mumkin