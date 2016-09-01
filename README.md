
# docker nextcloud
Nexcloud - Alpine based

## Install
    mkdir nextcloud
    cd nextcloud 
    wget https://github.com/castorinop/docker-nextcloud/raw/master/docker-compose.yml.dist -O docker-compose.yml

edit *docker-compose.yml*, customize volume paths. All are required for upgrades.
start
    docker-compose up

## Upgrade
    cd nextcloud
    docker-compose pull
    docker-compose rm app
    docker-compose up
    docker exec nextcloud_app_1 sudo -u nobody php /app/nextcloud/occ upgrade

