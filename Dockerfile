# Utiliser une image officielle Node.js comme base
FROM node:18-alpine

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier les fichiers package.json et package-lock.json
COPY package*.json ./

# Installer les dépendances
RUN npm install

# Copier le reste de l'application
COPY . .

# Lancer les tests à la construction (optionnel, utile pour vérification immédiate)
RUN npm test

# Commande par défaut
CMD ["npm", "test"]
