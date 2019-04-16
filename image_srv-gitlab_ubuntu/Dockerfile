FROM ubuntu:18.04

LABEL maintainer="Dylan Gouzenne <contact@dylangouzenne.fr>"

RUN apt-get update -q && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    curl \
    openssh-server \
    ca-certificates \
    vim

RUN curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash

RUN apt-get update && EXTERNAL_URL="http://localhost" apt-get install -yq --no-install-recommends gitlab-ce

# copy des certificats ssl du domaine pour la connexion https
COPY config/ssl/ /etc/gitlab/trusted-certs/

EXPOSE 22 80 443