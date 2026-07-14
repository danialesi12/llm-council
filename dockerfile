# Usa una versione di Python recente e leggera
FROM python:3.11-slim

# Imposta la directory di lavoro
WORKDIR /app

# Installa le dipendenze di sistema essenziali (spesso necessarie per compilare pacchetti Python)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copia solo il file dei requisiti prima, per sfruttare la cache di Docker
COPY requirements.txt .

# Installa le dipendenze Python
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copia il resto del codice
COPY . .

# Comando di default (sovrascrivibile dal docker-compose)
CMD ["python", "--version"]
