# # Use Maven image as base
# # Testing with maven
# # Testing with docker compose command

# FROM maven:3.8.1-jdk-11 AS build

# # Copy your application files
# COPY . /app
# WORKDIR /app

# # Run Maven to build the project
# RUN mvn clean install

# Use the official WordPress image
FROM php:latest

# Copy custom WordPress application files into the container
COPY ./wordpress_data /usr/local/apache2/htdocs/

# # Set permissions
# RUN chown -R httpd:jenkins /var/www/html

# # Expose port 80 for WordPress
# EXPOSE 80

# # Start Apache
# CMD ["apache2-foreground"]
