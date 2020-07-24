# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.hostname = "bionic64-directus-mariadb"
  # config.vm.network "private_network", ip: "192.168.10.54"
  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.provider "virtualbox" do |vb|
    vb.name = "bionic64-directus-mariadb"
    vb.cpus = 2
    vb.memory = "2048"
    vb.customize [ "modifyvm", :id, "--uartmode1", "disconnected" ]
  end

  config.vm.provision "shell", path: "./provision/1-apache2.sh"
  config.vm.provision "shell", path: "./provision/2-php72.sh"
  config.vm.provision "shell", path: "./provision/3-mariadb102.sh"
  config.vm.provision "shell", path: "./provision/4-directus.sh"
end
