# Usa una versione di Python recente e leggera
FROM python:3.11-slim

# Imposta la directory di lavoro
WORKDIR /app

# Installa le dipendenze di sistema essenziali (spesso necessarie per compilare pacchetti Python)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Installa direttamente i pacchetti necessari
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir anthropic openai tiktoken python-dotenv

# Copia il resto del codice
COPY . .

# Sostituisci main.py con il file effettivo della repo (es. app.py o server.py)
CMD ["python", "main.py"]
