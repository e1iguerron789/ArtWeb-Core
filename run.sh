#!/bin/bash

composer install --no-dev --optimize-autoloader

npm install
npm run build

if [ -z "$APP_KEY" ]; then
    php artisan key:generate --force
fi

php artisan migrate --force

# SERVIDOR CORRECTO PARA RAILWAY
php -S 0.0.0.0:$PORT -t public
