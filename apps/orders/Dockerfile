# Utiliser une image Python officielle en tant que base
FROM python:3.9-alpine

WORKDIR /app

# Copier les fichiers requis dans le répertoire de travail de l'image
COPY requirements.txt /app
COPY app.py /app

# Installer les dépendances de l'application
RUN pip install --no-cache-dir -r requirements.txt

# Exposer le port sur lequel l'application écoute
EXPOSE 8080

# Commande pour démarrer l'application lorsque le conteneur démarre
CMD ["python", "app.py"]
