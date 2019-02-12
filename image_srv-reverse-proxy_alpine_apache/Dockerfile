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

# Variables environment.
ENV HOME /root

# Répertoire de travail.
WORKDIR /var/www/

# Port exposer.
EXPOSE 80

# Point d'entrée.
CMD /bin/bash
