FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    zip unzip curl \
    libpng-dev libonig-dev libxml2-dev \
    nodejs npm

RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

COPY . /var/www
WORKDIR /var/www

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer install --optimize-autoloader --no-dev
RUN npm install
RUN npm run build

# 🔥 CREAR EL .env con las variables de Railway
RUN echo "APP_NAME=Laravel" > .env && \
    echo "APP_ENV=production" >> .env && \
    echo "APP_KEY=" >> .env && \
    echo "APP_DEBUG=false" >> .env && \
    echo "APP_URL=${APP_URL}" >> .env && \
    echo "DB_CONNECTION=mysql" >> .env && \
    echo "DB_HOST=${DB_HOST}" >> .env && \
    echo "DB_PORT=${DB_PORT}" >> .env && \
    echo "DB_DATABASE=${DB_DATABASE}" >> .env && \
    echo "DB_USERNAME=${DB_USERNAME}" >> .env && \
    echo "DB_PASSWORD=${DB_PASSWORD}" >> .env

# 🔑 Generar APP_KEY
RUN php artisan key:generate

# 🚀 CMD ÚNICO
CMD php artisan migrate --force && php artisan config:cache && php artisan serve --host=0.0.0.0 --port=8080
