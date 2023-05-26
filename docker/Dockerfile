FROM composer AS composer

FROM php:8.0-apache

RUN apt update && apt install -y git libzip-dev && docker-php-ext-install zip
ENV COMPOSER_ALLOW_SUPERUSER=1
COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN mkdir /var/www/sculpin; mkdir /var/www/public
COPY docker/composer.json /var/www/sculpin/
WORKDIR /var/www/sculpin
RUN /usr/bin/composer install

COPY docker/vhost.conf /etc/apache2/conf-enabled/vhost.conf
COPY docker/entrypoint.sh /usr/local/bin/
COPY functions /var/www/functions/
COPY source /var/www/source/
COPY docker/router.php /var/www/router/

RUN a2enmod rewrite
ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]