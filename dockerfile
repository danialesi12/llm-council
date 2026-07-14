# Usa una versione di Python recente e leggera
FROM python:3.11-slim

# Imposta la directory di lavoro
WORKDIR /app

# Installa le dipendenze di sistema essenziali
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Installa direttamente i pacchetti necessari
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir anthropic openai tiktoken python-dotenv

# Copia il resto del codice nella directory di lavoro
COPY . .

# Comando per avviare il backend (assicurati che main.py sia il file di avvio del tuo fork)
CMD ["python", "main.py"]
