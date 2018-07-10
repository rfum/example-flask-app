# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.box = "ubuntu/trusty64"
    #It's possible to reach the flask application from 127.0.0.1:8080
    config.vm.network "forwarded_port", guest: 5000, host: 8080, host_ip: "127.0.0.1"
    config.vm.provider "virtualbox" do |vb|
    #enough memory allocation for this simple app
      vb.memory = "1024"
      vb.name = "flask-box"
    end
    #If you would like to change the location of the flask app. just fill the env. vars with appropriate args
    config.vm.provision "shell", path: "provision.sh", env: {"GITHUB_USERNAME" => "rfum","GITHUB_REPONAME" =>"example-flask-app" } 
  end
  