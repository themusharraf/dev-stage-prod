run-dev:
	DJANGO_SETTINGS_MODULE=root.settings.dev python manage.py runserver

run-stage:
	DJANGO_SETTINGS_MODULE=root.settings.stage python manage.py runserver

run-prod:
	DJANGO_SETTINGS_MODULE=root.settings.prod python manage.py runserver

mig:
	python manage.py makemigrations

migrate:
	python manage.py migrate

admin:
	python manage.py createsuperuser