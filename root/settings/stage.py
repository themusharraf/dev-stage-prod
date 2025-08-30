from .base import *
from dotenv import load_dotenv

load_dotenv(".env.stage")

DEBUG = True
ALLOWED_HOSTS = [os.getenv('ALLOWED_HOSTS')]

DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.postgresql",
        "NAME": os.getenv("DB_NAME"),
        "USER": os.getenv("DB_USER"),
        "PASSWORD": os.getenv("DB_PASSWORD"),
        "HOST": os.getenv("DB_HOST"),
        "PORT": os.getenv("DB_PORT"),
    }
}
