# Use the official WordPress image
#test
FROM wordpress:latest

# Copy custom WordPress application files into the container
COPY . /var/www/html

# Set permissions
RUN chown -R www-data:www-data /var/www/html

# Expose port 80 for WordPress
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
