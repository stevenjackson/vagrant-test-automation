Project using vagrant to setup an ATDD environment on centos 6.3 box
* git
* vim
* openssl
* mysql
* java
* tomcat
* rvm
* firefox
* Xvfb

To use 

```
$ vagrant box add centos https://s3.amazonaws.com/itmat-public/centos-6.3-chef-10.14.2.box
$ vagrant up 
$ vagrant reload
$ vagrant ssh
```

From there clone any repositories and bundle accordingly.

Any files stored with the Vagrantfile become accessible under the /vagrant directory in the VM.  So, a vagrant file and cookbooks can be added to an existing repo, providing a way to spin up a testing environment with the test code already installed.

