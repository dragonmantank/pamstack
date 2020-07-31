FROM php:7.4-apache

COPY docker/vhost.conf /etc/apache2/conf-enabled/vhost.conf
COPY public /var/www/public/
COPY functions /var/www/functions/
COPY docker/router.php /var/www/router/

RUN a2enmod rewrite