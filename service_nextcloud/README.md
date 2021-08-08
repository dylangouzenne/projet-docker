# Stack Service NextCloud Docker


### Configuration integration serveur OnlyOffice via la CLI OCC de Nextcloud :

#### Ajouter le hostname du container nextcloud a la liste des trusted_domains du fichier config.php de nextcloud
- docker exec -ti -u www-data srv_nextcloud ./occ config:system:set trusted_domains 1 --value=srv_nextcloud

#### Vérifier la liste des trusted_domains du fichier config.php de nextcloud
- docker exec -ti -u www-data srv_nextcloud ./occ config:system:get trusted_domains

#### Installer l'App Connecteur OnlyOffice
- docker exec -ti -u www-data srv_nextcloud ./occ --no-warnings app:install onlyoffice

#### Configurer les URL d'accès au DocumentServer d'OnlyOffice :
- docker exec -ti -u www-data srv_nextcloud ./occ --no-warnings config:system:set onlyoffice DocumentServerUrl --value="/ds-vpath/"
- docker exec -ti -u www-data srv_nextcloud ./occ --no-warnings config:system:set onlyoffice DocumentServerInternalUrl --value="http://srv_onlyoffice/"
- docker exec -ti -u www-data srv_nextcloud ./occ --no-warnings config:system:set onlyoffice StorageUrl --value="http://srv_nextcloud/"
- docker exec -ti -u www-data srv_nextcloud ./occ --no-warnings config:system:set allow_local_remote_servers  --value=true

#### Vérifier la connexion au serveur Onlyoffice :
- docker exec -ti -u www-data srv_nextcloud ./occ onlyoffice:documentserver --check

## Ereurs :

### Ereur exec commande OCC :
Lors de l'execution d'une commande dans le container nextcloud il faut l'executer avec l'utilisateur www-data d'apache sinon la commande échoue a cause de problème de droits
- pour utiliser le bon utilisateur il faut utiliser le l'option "-u" de la commande "docker exec"
- exemple : docker exec -ti -u www-data srv_nextcloud /bin/bash

### Erreur connexion serveur OnlyOffice :
Pour résoudre le problème de connexion, il ne faut pas configurer l'adresse publique du serveur mais a la place ouvrir l'onglet paramètre avancé du serveur et configurer les adresse interne en spécifiant les nom des container comme nom d'hote.
Exemple :
- Adresse du ONLYOFFICE Docs pour les demandes internes du serveur = http://srv_onlyoffice/
- Adresse du serveur pour les demandes internes du ONLYOFFICE Docs = http://srv_nextcloud/