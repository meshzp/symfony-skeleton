FROM php:7.4-fpm-alpine as alpine-xdebug
RUN apk add --update make autoconf gcc g++

RUN pecl install xdebug-2.8.1 && docker-php-ext-enable xdebug

#FROM php:7.4-fpm-alpine
# Copy xdebug configration for remote debugging
COPY ./docker/xdebug.ini $PHP_INI_DIR/conf.d/xdebug.ini
ADD ./docker/php_dev.ini /usr/local/etc/php/php.ini

RUN docker-php-ext-install opcache

## If you do not need xdebug, comment the following two lines
#COPY --from=alpine-xdebug /var/www/html/xdebug-2.8.1/modules/xdebug.so /usr/local/lib/php/extensions/no-debug-non-zts-20180731/xdebug.so
#RUN echo "zend_extension=xdebug.so" > /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
