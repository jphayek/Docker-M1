FROM alpine:latest

WORKDIR /var/www/html

RUN apk --no-cache add \
    php7 \
    php7-fpm \
    php7-pdo \
    php7-pdo_pgsql

# Copier les fichiers Adminer
COPY . .

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "-t", "."]