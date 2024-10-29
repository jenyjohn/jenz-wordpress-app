# Use Maven image as base
# Testing with maven
# Testing with docker compose command

FROM maven:3.8.1-jdk-11 AS build

# Copy your application files
COPY . /app
WORKDIR /app

# Run Maven to build the project
RUN mvn clean install

# Use the official WordPress image
FROM wordpress:latest

# Copy custom WordPress application files into the container
COPY . /var/www/html

# Set permissions
RUN chown -R www-data:www-data /var/www/html

# Expose port 80 for WordPress
EXPOSE 8081

# Start Apache
CMD ["apache2-foreground"]
