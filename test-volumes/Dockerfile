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
    apache2 \
    libapache2-mod-php7.2 \
    php7.2-mysql && \
    a2enmod php7.2 rewrite

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# VOLUME /var/www/html

# Variables environment.
ENV HOME /root

# Répertoire de travail.
WORKDIR /var/www/

# Port exposer.
EXPOSE 80

# Point d'entrée.
ENTRYPOINT /usr/sbin/apache2ctl -D FOREGROUND