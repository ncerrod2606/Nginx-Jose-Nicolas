# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  config.vm.box = "debian/bullseye64"

  config.vm.network "private_network", ip: "192.168.125.16"

  config.vm.synced_folder "C:\\Users\\FX506\\Downloads\\perfect-html-education\\html",
                          "/var/www/jose-nico.test/html/static-website-example"

  config.vm.provision "shell", path: "provision.sh"
end

