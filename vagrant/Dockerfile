#Install Vagrant
FROM centos:7 as build

RUN groupadd vagrant-users && useradd vagrant
RUN usermod -a -G vagrant-users vagrant

WORKDIR /home/vagrant
RUN curl -sfL https://releases.hashicorp.com/vagrant/2.2.6/vagrant_2.2.6_x86_64.rpm -o vagrant_2.2.6_x86_64.rpm

RUN rpm -i vagrant_2.2.6_x86_64.rpm



#Apache Server

#Nginx Server

