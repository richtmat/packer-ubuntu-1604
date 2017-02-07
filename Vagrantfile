# -*- mode: ruby -*-
# vi: set ft=ruby :

# Overwrite host locale in ssh session
# because: usually host locale environment variables are passed to guest
# see https://www.vagrantup.com/docs/vagrantfile/tips.html
ENV["LC_ALL"] = "en_US.UTF-8"

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.ssh.forward_agent = true
  
  config.vm.synced_folder '.', '/vagrant', type: 'nfs'
  config.vm.synced_folder '/home/matthias/development/repos', '/home/vagrant/development'
  
  config.vm.define "virtualbox" do |virtualbox|
    virtualbox.vm.hostname = "virtualbox-ubuntu1604"
    virtualbox.vm.box = "file://builds/virtualbox-ubuntu1604.box"
    virtualbox.vm.network :private_network, ip: "172.16.3.2"
    config.vm.network "forwarded_port", guest: 8000, host: 8000

    config.vm.provider :virtualbox do |v|
      v.gui = false
      v.memory = 3072
      v.cpus = 2
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
    end

    config.vm.provision "fix-no-tty", type: "shell" do |s|
      s.privileged = false
      s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
    end
  end

end
