FROM alpine:latest

WORKDIR /var/www/html

# Copier le code source de Symfony
COPY . .

# Installation des dépendances Symfony
RUN apk --no-cache add \
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
    composer

RUN composer install --no-scripts --no-interaction

EXPOSE 8000

CMD ["php", "bin/console", "server:run", "0.0.0.0:8000"]