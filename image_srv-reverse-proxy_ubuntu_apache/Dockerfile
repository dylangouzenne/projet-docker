# ++++++++++++++++++++++++++++++++++++++ 
#  Ubuntu 18.04 Apache2-mod-proxy
# ++++++++++++++++++++++++++++++++++++++ 


# image de base.
FROM ubuntu:18.04

LABEL maintainer="Dylan Gouzenne <contact@dylangouzenne.fr>"

ENV DEBIAN_FRONTEND=noninteractive

# Installation du serveur web Apache2 mod proxy.
RUN apt-get update && apt-get install -yq \
    vim \
    curl \
    git \
    openssl \
    apache2 \
    libapache2-mod-proxy-html && \
    a2enmod php7.2 rewrite ssl && \
    # supression des fichier inutile pour réduire le poid de l'image
    rm -rf /var/www/html && \
    rm -rf /var/lib/apt/lists/*

# copie fichier conf apache
COPY config/apache2.conf /etc/apache2/apache2.conf

# copie des fichier conf des virtualhost des sites
COPY config/vhost/ /etc/apache2/sites-available/

# activation du virtualhost default-ssl
RUN a2ensite 001-default-ssl.conf

# Variables environment.
ENV HOME /root

# Répertoire de travail.
WORKDIR /etc/apache2/

# Port exposer.
EXPOSE 80 443

# Point d'entrée.
ENTRYPOINT /usr/sbin/apache2ctl -D FOREGROUND
