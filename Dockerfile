# Base image
FROM wordpress:latest

ARG MYSQLPASSWORD
ARG MYSQLHOST
ARG MYSQLPORT
ARG MYSQLDATABASE
ARG MYSQLUSER

ENV WORDPRESS_DB_HOST=$MYSQLHOST:$MYSQLPORT
ENV WORDPRESS_DB_NAME=$MYSQLDATABASE
ENV WORDPRESS_DB_USER=$MYSQLUSER
ENV WORDPRESS_DB_PASSWORD=$MYSQLPASSWORD
ENV WORDPRESS_TABLE_PREFIX="RW_"
ENV APACHE_SERVER_NAME=0.0.0.0

# Set the ServerName directive to 0.0.0.0
RUN echo "ServerName 0.0.0.0" >> /etc/apache2/apache2.conf

# Add DirectoryIndex directive
RUN echo "DirectoryIndex index.php index.html" >> /etc/apache2/apache2.conf

# Start the Apache web server
CMD ["apache2-foreground"]
