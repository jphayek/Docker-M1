FROM alpine:latest

# Installation des dépendances nécessaires
RUN apk --no-cache add \
    nginx \
    supervisor

# Copier les fichiers de configuration nécessaires
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf
COPY supervisord.conf /etc/supervisord.conf

# Copier le code source de Symfony
COPY . /var/www/html

# Exposer le port 80
EXPOSE 80

# Commande par défaut pour lancer Supervisor
CMD ["supervisord", "-c", "/etc/supervisord.conf"]