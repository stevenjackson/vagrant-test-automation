Description
-----------
Project using vagrant to setup an ATDD environment on centos 6.3 box

Dependencies
----------------------
* [VirtualBox](https://www.virtualbox.org)
* [Vagrant](http://vagrantup.com)


Current "recipe"
-----------------------
* git
* vim
* openssl
* mysql
* java
* tomcat
* rvm
* firefox
* Xvfb
* gnome

To use 
-------------------------
```
$ vagrant box add centos https://s3.amazonaws.com/itmat-public/centos-6.3-chef-10.14.2.box
$ vagrant up 
$ vagrant reload
$ vagrant ssh
```

From there clone any repositories and bundle accordingly.

Any files stored with the Vagrantfile become accessible under the /vagrant directory in the VM.  So, a vagrant file and cookbooks can be added to an existing repo, providing a way to spin up a testing environment with the test code already installed.


To enable gui (gnome) 
-------------------------
Shutdown the VM if running
```
$ vagrant halt
```

Edit Vagrantfile and uncomment this line
```
 # config.vm.boot_mode = :gui
```

Restart the VM
```
$ vagrant up
```
Use vagrant/vagrant to login and then type startx to launch the desktop.

Managing VM
---------------------------

See [Vagrant guide](http://vagrantup.com/v1/docs/getting-started/teardown.html) for information on starting and stopping VMs. 
