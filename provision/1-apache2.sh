#!/bin/bash

echo "$(tput setaf 0) $(tput setab 3)start installing apache2$(tput sgr 0)"

sudo apt update
sudo apt install -y apache2
curl http://192.168.10.54

echo "$(tput setaf 0) $(tput setab 2)apache2 installation complete$(tput sgr 0)"

