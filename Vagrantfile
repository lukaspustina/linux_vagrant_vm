Vagrant.require_version ">= 1.4.0"

UBUNTU_VERSION = "bionic64"

BOX_NAME = "#{UBUNTU_VERSION}-vagrant-vm"

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/#{UBUNTU_VERSION}"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder "./vagrant", "/vagrant"
  
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  config.vm.define BOX_NAME do |t| end
  config.vm.hostname = "#{BOX_NAME}.localdomain"
  config.vm.provider :virtualbox do |vbox|
    vbox.name = BOX_NAME
    vbox.memory = 2048
  end

  # Network forwardings to host
  # config.vm.network "forwarded_port", guest: 5001, host_ip: "127.0.0.1", host: 5001 # e.g., spiderfoot

  config.vm.provision "ansible" do |ansible|
    ansible.compatibility_mode = "2.0"
    ansible.playbook = "ansible/site.yml"
    ansible.extra_vars = {
      # Select which extra playbooks should be run
      install: {
        rust: true,
        ebpf: true, 
      }
    }
  end

end

# -*- mode: ruby -*-
# vi: set ft=ruby :
