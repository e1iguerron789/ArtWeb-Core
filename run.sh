#!/bin/bash

# Instalar dependencias PHP
composer install --no-dev --optimize-autoloader

# Instalar dependencias del frontend
npm install

# Construir el frontend con Vite
npm run build

# Generar APP_KEY si no existe
if [ -z "$APP_KEY" ]; then
    php artisan key:generate --force
fi

# Migraciones
php artisan migrate --force

# Servir Laravel
php artisan serve --host 0.0.0.0 --port $PORT