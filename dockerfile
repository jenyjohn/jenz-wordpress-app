# Start with an official WordPress image
FROM wordpress:latest

# Update and install MySQL Server
RUN apt-get update && apt-get install -y mariadb-server mariadb-client

# Environment variables for MySQL
ENV MYSQL_ROOT_PASSWORD=wordpress
MYSQL_DATABASE=wordpress_db
MYSQL_USER=jeni
MYSQL_PASSWORD=jenijohn

# Setup entrypoint for MySQL
RUN service mysql start && \
    mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE ${MYSQL_DATABASE};" && \
    mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" && \
    mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';" && \
    mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

# Copy the default WordPress configuration to use the MySQL service
COPY wp-config.php /var/www/html/wp-config.php

# Start both MySQL and Apache when the container starts
CMD service mysql start && apache2-foreground
