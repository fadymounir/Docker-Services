FROM php:8.2-cli

WORKDIR /var/www

# Install dependencies
RUN apt-get update && apt-get install -y \
    git curl zip unzip libpng-dev libonig-dev libxml2-dev libzip-dev \
    libjpeg-dev libfreetype6-dev \
    && docker-php-ext-install pdo pdo_mysql mbstring zip bcmath gd

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Copy app files
COPY . .

# Set permissions
RUN chown -R www-data:www-data /var/www \
    && chmod -R 775 storage bootstrap/cache

# Install Laravel dependencies
RUN composer install --no-interaction --prefer-dist

# Allow changing port via ARG and ENV
ARG APP_PORT=9000
ENV APP_PORT=${APP_PORT}

EXPOSE ${APP_PORT}

CMD ["sh", "-c", "php artisan serve --host=0.0.0.0 --port=${APP_PORT}"]
