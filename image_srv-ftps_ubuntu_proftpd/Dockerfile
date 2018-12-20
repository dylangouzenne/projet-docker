# ++++++++++++++++++++++++++++++++++++++ 
#  proftpd Ubuntu 18.04
# ++++++++++++++++++++++++++++++++++++++ 


# image de base.
FROM ubuntu:18.04

MAINTAINER Dylan Gouzenne <contact@dylangouzenne.fr>

ENV DEBIAN_FRONTEND=noninteractive

# Installation du serveur sftp proftpd + vim.
RUN apt-get update && apt-get install -y \
    vim \
    openssl \
    proftpd

RUN openssl genrsa -out /etc/ssl/private/proftpd.key 4096 && \
    openssl req -new -x509 -days 365 -key /etc/ssl/private/proftpd.key -out /etc/ssl/certs/proftpd.crt -subj "/OU=Domain Control Validated/CN=localhost"

# copie des fichier conf
COPY config/proftpd.conf /etc/proftpd/proftpd.conf
COPY config/tls.conf /etc/proftpd/tls.conf
# Variables environment.
ENV HOME /root

# Répertoire de travail.
WORKDIR /etc/proftpd

# Port exposer.
EXPOSE 21

# Point d'entrée.
ENTRYPOINT ["proftpd", "--nodaemon", "-c", "/etc/proftpd/proftpd.conf"]
#CMD ["proftpd", "--nodaemon", "-c", "/etc/proftpd/proftpd.conf"]