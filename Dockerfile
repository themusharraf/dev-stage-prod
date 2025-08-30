FROM python:3.13-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get install -y \
    libpq-dev gcc && \
    pip install --upgrade pip && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

CMD ["gunicorn", "root.wsgi:application", "--bind", "0.0.0.0:8000"]
