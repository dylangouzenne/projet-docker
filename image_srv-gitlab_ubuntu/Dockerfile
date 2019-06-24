FROM gitlab/gitlab-ce:latest

LABEL maintainer="Dylan Gouzenne <contact@dylangouzenne.fr>"

# copy des certificats ssl du domaine pour la connexion https
COPY config/ssl/numerilife.fr_ssl_certificate.pem /etc/gitlab/trusted-certs/numerilife.fr_ssl_certificate.pem

EXPOSE 22 80 443