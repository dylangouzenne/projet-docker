FROM gitlab/gitlab-ce:latest

LABEL maintainer="Dylan Gouzenne <contact@dylangouzenne.fr>"

# copy des certificats ssl du domaine pour la connexion https
COPY config/ssl/ /etc/gitlab/trusted-certs/

EXPOSE 22 80 443