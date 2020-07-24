#!/bin/bash

echo "$(tput setaf 0) $(tput setab 3)start installing php7.2$(tput sgr 0)"

yes | sudo apt install php libapache2-mod-php
sudo systemctl restart apache2
yes | sudo apt install php-pdo php-mysql php-curl php-gd php-fileinfo php-mbstring php-xml
echo "php -V"
echo "<?php phpinfo();" > /var/www/html/info.php
curl http://192.168.10.54/info.php

echo "$(tput setaf 0) $(tput setab 2)php7.2 installation complete$(tput sgr 0)"
