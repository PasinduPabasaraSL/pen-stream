# Use official PHP with Apache (better for Laravel dev than plain CLI)
FROM php:8.3-apache

# Enable Apache mod_rewrite (needed for Laravel routes)
RUN a2enmod rewrite

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    zip \
    libzip-dev \
    libpng-dev \
    default-mysql-client \
    && docker-php-ext-install pdo pdo_mysql zip gd \
    && rm -rf /var/lib/apt/lists/*

# Install Composer (from composer image)
COPY --from=composer:2.6 /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /app

# Copy app files
COPY . /app

# Install Laravel dependencies
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# Set Laravel permissions
RUN chown -R www-data:www-data /app/storage /app/bootstrap/cache

# Apache config (point DocumentRoot to Laravel public folder)
RUN sed -i 's|/var/www/html|/app/public|g' /etc/apache2/sites-available/000-default.conf

# Expose port 8000 for local dev
EXPOSE 8000

# Run Apache in foreground
CMD ["apache2-foreground"]
