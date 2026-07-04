FROM python:3.12-slim

WORKDIR /app

# Dependencies kopieren
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# App kopieren
COPY . .

# Port für Flask
EXPOSE 5000

# Startbefehl
CMD ["sh", "-c", "python create_db.py && gunicorn -w 4 -b 0.0.0.0:5000 api:app"]
