FROM php:7.1-apache
RUN apt-get update && apt-get install libpng-dev zip git libzip-dev -y
RUN docker-php-ext-configure zip --with-libzip
RUN docker-php-ext-install zip pdo_mysql gd gettext
# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
COPY ./ /var/www/html/
WORKDIR /var/www/html 
RUN chmod 0777 -R /var/www/html
RUN composer install --prefer-dist
