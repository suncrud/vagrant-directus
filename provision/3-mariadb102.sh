#!/bin/bash

echo "$(tput setaf 0) $(tput setab 3)start installing mariadb 10.2$(tput sgr 0)"

sudo apt-get install software-properties-common
sudo apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://sgp1.mirrors.digitalocean.com/mariadb/repo/10.2/ubuntu bionic main'
sudo apt update

export DEBIAN_FRONTEND=noninteractive
echo "mariadb-server-10.2 mysql-server/root_password password root" | sudo debconf-set-selections
echo "mariadb-server-10.2 mysql-server/root_password_again password root" | sudo debconf-set-selections
sudo apt install -y mariadb-server
mysql -V
mysql -uroot -proot -e "CREATE USER 'vagrant'@'localhost' IDENTIFIED BY 'vagrant';"
mysql -uroot -proot -e "CREATE DATABASE vagrant_db;"
mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON vagrant_db.* to 'vagrant'@'localhost' IDENTIFIED BY 'vagrant';"
mysql -uroot -proot -e "FLUSH PRIVILEGES;"
mysql -uroot -proot -e "SHOW GRANTS FOR 'vagrant'@'localhost';"

echo "$(tput setaf 0) $(tput setab 2)mariadb 10.2 installation complete$(tput sgr 0)"
