FROM alpine:latest

WORKDIR /var/www/html

RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.14/main" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/v3.14/community" >> /etc/apk/repositories

# Copier le code source de Symfony
COPY . .

# Installation des dépendances Symfony
RUN apk --no-cache add \
    php8 \
    php8-fpm \
    php8-mbstring \
    php8-openssl \
    php8-json \
    php8-dom \
    php8-pdo \
    php8-pdo_pgsql \
    php8-tokenizer \
    php8-xml \
    php8-ctype \
    php8-session \
    php8-simplexml \
    php8-fileinfo 


EXPOSE 8000

CMD ["php", "bin/console", "server:run", "0.0.0.0:8000"]