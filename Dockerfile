# Utiliser l'image Alpine comme base
FROM alpine:latest

# Mettre à jour les paquets et installer les dépendances nécessaires
RUN apk update \
    && apk add --no-cache \
        php7 \
        php7-fpm \
        php7-mbstring \
        php7-openssl \
        php7-json \
        php7-dom \
        php7-pdo \
        php7-pdo_pgsql \
        php7-tokenizer \
        php7-xml \
        php7-ctype \
        php7-session \
        php7-simplexml \
        php7-fileinfo \
        composer \
        nginx \
        postgresql \
        postgresql-client \
        supervisor

# Configurer PHP-FPM
COPY php-fpm.conf /etc/php7/php-fpm.conf

# Configurer Nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

# Copier les fichiers de configuration de Supervisor
COPY supervisord.conf /etc/supervisord.conf

# Créer le répertoire pour l'application Symfony
WORKDIR /var/www/html

# Copier les fichiers de l'application Symfony
COPY . .

# Installer les dépendances de l'application Symfony
RUN composer install --no-scripts --no-interaction

# Exposer le port 80
EXPOSE 80

# Commande par défaut pour lancer Supervisor
CMD ["supervisord", "-c", "/etc/supervisord.conf"]