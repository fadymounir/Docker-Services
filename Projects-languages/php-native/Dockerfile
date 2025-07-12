FROM php:7.4-apache

# Install needed PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql calendar

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Copy your app files
COPY . /var/www/html/
