# Dockerfile for React Vite development environment
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json files
# Note: Ces fichiers seront copiés depuis la racine du projet, pas depuis le dossier docker
COPY package*.json ./

# Install dependencies
RUN npm install

# Le reste des fichiers sera monté en volume, pas besoin de les copier
# pour le développement

# Expose the development server port
EXPOSE 5173

# Set environment variables for development
ENV NODE_ENV=development

# Définir le script d'entrée
COPY docker/docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

# Default command to start development server
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]