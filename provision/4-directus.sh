#!/bin/bash

echo "$(tput setaf 0) $(tput setab 3)start installing directus$(tput sgr 0)"


sudo git clone https://github.com/directus/directus.git /var/www/directus
sudo a2enmod rewrite
sudo systemctl restart apache2

sudo rm /etc/apache2/sites-available/000-default.conf

echo "
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/directus/public

        <Directory /var/www/directus/public/>
            Options Indexes FollowSymLinks
            AllowOverride All
            Require all granted
        </Directory>

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

        <IfModule mod_dir.c>
            DirectoryIndex index.php index.pl index.cgi index.html index.xhtml index.htm
        </IfModule>
</VirtualHost>
" | sudo tee /etc/apache2/sites-available/000-default.conf

sudo systemctl restart apache2

sudo chown -R www-data:www-data /var/www/directus

curl http://192.168.10.54

echo "$(tput setaf 0) $(tput setab 2)directus installation complete$(tput sgr 0)"
