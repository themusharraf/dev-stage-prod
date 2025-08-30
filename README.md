```
DjangoProject/
├── core/                  # asosiy app
├── root/                  # settings papkasi
│   ├── __init__.py
│   ├── base.py            # umumiy settings (hamma env uchun)
│   ├── dev.py             # dev settings
│   ├── stage.py           # staging settings
│   ├── prod.py            # production settings
├── .env.dev               # faqat local dev uchun
├── .env.stage             # staging server uchun
├── .env.prod              # production server uchun
├── manage.py
└── requirements.txt
```
