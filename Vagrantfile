# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "precise64"

  	config.vm.network "forwarded_port", guest: 3333, host: 3333
  	config.vm.network "private_network", ip: "192.168.33.10"

  	config.vm.synced_folder ".", "/opt/OpenRefine"

  	config.vm.provider "virtualbox" do |vb|
		vb.customize ["modifyvm", :id, "--memory", "2048"]
	end
  
  config.vm.provision "shell" do |shell|
    shell.path = "provision/shell/provision.sh"
  end
 
  # config.vm.provision "puppet" do |puppet|
  #   puppet.manifests_path = "manifests"
  #   puppet.manifest_file  = "default.pp"
  # end
end
