FROM        ubuntu:14.04
MAINTAINER  Dicotraining info@dicotraining.com
 

# Update the package repository
RUN apt-get update -y && apt-get upgrade -y


# Install base system
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget curl 

 
# Install PHP 5.5
RUN apt-get install -y php5-cli php5 php5-mcrypt php5-curl php5-pgsql libxml2-dev
 
RUN a2enmod xml2enc
RUN a2enmod proxy_html
RUN a2enmod proxy_balancer
RUN a2enmod proxy_http
RUN a2enmod proxy_ajp
RUN a2enmod lbmethod_byrequests slotmem_shm

ADD ./config/001-docker.conf /etc/apache2/sites-available/
RUN ln -s /etc/apache2/sites-available/001-docker.conf /etc/apache2/sites-enabled/


# Set Apache environment variables (can be changed on docker run with -e)
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_SERVERADMIN admin@localhost
ENV APACHE_SERVERNAME localhost
ENV APACHE_SERVERALIAS docker.localhost
ENV APACHE_DOCUMENTROOT /var/www


EXPOSE 80
ADD ./scripts/info.php /var/www/html/info.php
ADD ./scripts/start.sh /start.sh
RUN chmod 0755 /start.sh
CMD ["bash", "start.sh"]
