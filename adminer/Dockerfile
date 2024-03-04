RUN apk update && apk upgrade
RUN apk add php php-session php-pgsql
WORKDIR /
COPY ./adminer.php /index.php
COPY ./default.css /adminer.css
EXPOSE 80
CMD ["php", "-S", "0.0.0.0:80", "-t", "/"]

