#Install Vagrant after configuring KVM or VirtualBox
FROM centos:7 as build

RUN groupadd vagrant-users && useradd vagrant
RUN usermod -a -G vagrant-users vagrant

WORKDIR /home/vagrant
RUN curl -sfL https://releases.hashicorp.com/vagrant/2.2.6/vagrant_2.2.6_x86_64.rpm -o vagrant_2.2.6_x86_64.rpm

RUN rpm -i vagrant_2.2.6_x86_64.rpm

RUN vagrant box add geerlingguy/centos7
RUN vagrant init geerlingguy/centos7


ENTRYPOINT ["vagrant", "up"]

#Apache Server

#Nginx Server

