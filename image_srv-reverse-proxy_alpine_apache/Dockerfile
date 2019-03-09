# ++++++++++++++++++++++++++++++++++++++++
#   Alpine 3.7 Apache
# ++++++++++++++++++++++++++++++++++++++++

# Image de base
From alpine:3.7

MAINTAINER Dylan Gouzenne <contact@dylangouzenne.fr>

# Installation de bash et du serveur web apache2
RUN apk update && apk add --no-cache \
	bash \
	vim \
	git \
	apache2 

# copie du fichier conf apache et php
COPY config/apache2.conf /etc/apache2/apache2.conf
COPY config/httpd.conf /etc/apache2/httpd.conf
COPY config/000-default.conf /etc/apache2/sites-available/000-default.conf

# activation du fichier de conf servername.conf
#RUN a2enconf servername

# copie du fichier de l'application sur le serveur
COPY app/ /var/www/

# Variables environment.
ENV HOME /root

# Répertoire de travail.
WORKDIR /var/www/

# Port exposer.
EXPOSE 80

# Point d'entrée
ENTRYPOINT /usr/sbin/apache2ctl -D FOREGROUND
