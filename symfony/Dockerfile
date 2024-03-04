FROM alpine:latest


RUN apk add --no-cache \
    php \
    php-fpm \
    php-pdo \
    php-pdo_mysql \
    php-json \
    php-openssl \
    php-curl \
    php-zlib \
    php-xml \
    php-phar \
    php-intl \
    php-dom \
    php-xmlreader \
    php-ctype \
    php-session \
    php-mbstring \
    php-gd \
    curl \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


WORKDIR /app


EXPOSE 8000


COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["php", "-S", "0.0.0.0:8000", "-t", "public"]
