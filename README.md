Description
-----------
Project using vagrant to setup an ATDD environment ubuntu (precise64) box

Dependencies
----------------------
* [VirtualBox](https://www.virtualbox.org)
* [Vagrant](http://vagrantup.com)
* [vagrant-berkshelf](https://github.com/riotgames/vagrant-berkshelf)
* [vagrant-omnibus](https://github.com/schisamo/vagrant-omnibus)


Current "recipe"
-----------------------
* git
* vim
* openssl
* mysql
* java
* rvm

To use 
-------------------------
```
$ vagrant plugin install vagrant-berkshelf
$ vagrant plugin install vagrant-omnibus
$ vagrant up 
```

From there clone any repositories and bundle accordingly.

Any files stored with the Vagrantfile become accessible under the /vagrant directory in the VM.  So, a Vagrantfile and Berksfile can be added to an existing repo, providing a way to spin up a testing environment with the test code already installed.

Managing VM
---------------------------

See [Vagrant guide](http://vagrantup.com/v1/docs/getting-started/teardown.html) for information on starting and stopping VMs. 
