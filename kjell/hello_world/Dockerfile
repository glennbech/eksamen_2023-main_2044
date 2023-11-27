#ref:
#https://docs.docker.com/engine/reference/builder/
# Velg et base image med Python 3
FROM python:3.9-slim

# Sett arbeidskatalogen til /app i containeren
WORKDIR /app

# Kopier nåværende katalog til /app i containeren
COPY . /app

# Installer avhengigheter fra requirements.txt
RUN pip3 install -r requirements.txt

# Kjør app.py når containeren starter
CMD ["python3", "app.py"]
