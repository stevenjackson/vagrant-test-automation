# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

if ARGV[0] == "up" then
  has_installed_plugins = false

  unless Vagrant.has_plugin?("vagrant-vbguest")
    system("vagrant plugin install vagrant-vbguest")
    has_installed_plugins = true
  end

  unless Vagrant.has_plugin?("vagrant-berkshelf")
    system("vagrant plugin install vagrant-berkshelf")
    has_installed_plugins = true
  end

  unless Vagrant.has_plugin?("vagrant-omnibus")
    system("vagrant plugin install vagrant-omnibus")
    has_installed_plugins = true
  end

  if has_installed_plugins then
    puts "Vagrant plugins were installed. Please run vagrant up again to install the VM"
    exit
  end
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest

  #play app (on VM)
  config.vm.network :forwarded_port, guest: 9000, host: 9000
  #selenium remote(on host)
  config.vm.network :private_network, ip: "192.168.88.2"

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "apt"
    chef.add_recipe "build-essential"
    chef.add_recipe "git"
    chef.add_recipe "vim"
    chef.add_recipe "openssl"
    chef.add_recipe "mysql"
    chef.add_recipe "mysql::server"
    chef.add_recipe "java"
    chef.add_recipe "play2"
    chef.add_recipe "rvm::vagrant"
    chef.add_recipe "rvm::system"
    chef.add_recipe "phantomjs"

    chef.json = {
      "mysql" => {
        "server_root_password" => "password",
        "server_repl_password" => "password",
        "server_debian_password" => "password"
      },
      'rvm' => {
        'default_ruby' => 'ruby-2.0.0-p451',
        'user_default_ruby' => 'ruby-2.0.0-p451',
        'global_gems'  => [
            {'name'    => 'bundler'},
            {'name'    => 'rake'}
        ],
        'vagrant' => {
          'system_chef_solo' => '/usr/bin/chef-solo'
        },
        'group_users' => [ "vagrant" ]
      }
    }

  end

  $script = "su -l -c 'cd /vagrant/todolist && play compile' vagrant"

  config.vm.provision :shell, :inline => $script

  $script = "su -l -c 'cd /vagrant && bundle install' vagrant"

  config.vm.provision :shell, :inline => $script
end
