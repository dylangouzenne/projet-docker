# ++++++++++++++++++++++++++++++++++++++++
#   Alpine 3.7 Apache
# ++++++++++++++++++++++++++++++++++++++++

# Image de base
From alpine:3.7

MAINTAINER Dylan Gouzenne <contact@dylangouzenne.fr>

# Installation du serveur web apache2
RUN apk update && apk add \
	bash \
	vim \
	git \
	openrc \
	apache2 \
	apache2-proxy

# Variables environment.
ENV HOME /root

# Répertoire de travail.
WORKDIR /var/www/

# Port exposer.
EXPOSE 80 443

# Point d'entrée.
ENTRYPOINT rc-service apache2 start -q
#ENTRYPOINT /usr/sbin/httpd -D FOREGROUND