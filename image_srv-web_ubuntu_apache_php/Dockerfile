# ++++++++++++++++++++++++++++++++++++++ 
#  Ubuntu 18.04 Apache PHP7.2
# ++++++++++++++++++++++++++++++++++++++ 


# image de base.
FROM ubuntu:18.04

MAINTAINER Dylan Gouzenne <contact@dylangouzenne.fr>

ENV DEBIAN_FRONTEND=noninteractive

# Installation du serveur web Apache2 avec PHP + vim, curl et git.
RUN apt-get update && apt-get install -y \
    apt-utils \
    vim \
    curl \
    git \
    openssl \
    apache2 \
    libapache2-mod-php7.2 \
    php7.2-mysql && \
    a2enmod php7.2 rewrite ssl && \
    # supression des fichier inutile pour réduire le poid de l'image
    rm -rf /var/www/html && \
    rm -rf /var/lib/apt/lists/*

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# copie des fichier conf apache et php
COPY config/custom.php.ini /etc/php/7.2/apache2/conf.d/custom.php.ini
COPY config/apache2.conf /etc/apache2/apache2.conf

# copie des fichier conf des virtualhost des sites
COPY config/vhost/ /etc/apache2/sites-available/

# copie des clés et certificats SSL
COPY config/ssl/ /etc/apache2/ssl/

# activation du virtualhost default-ssl
RUN a2ensite 001-default-ssl.conf

# copie des fichier de l'application sur le serveur
COPY app/ /var/www/

# Variables environment.
ENV HOME /root

# Répertoire de travail.
WORKDIR /var/www/

# Port exposer.
EXPOSE 80

# Point d'entrée.
ENTRYPOINT /usr/sbin/apache2ctl -D FOREGROUND
