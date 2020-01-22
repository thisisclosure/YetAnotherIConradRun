#Install Vagrant after configuring KVM or VirtualBox
FROM centos:7 as build

RUN groupadd vagrant-users && useradd vagrant
RUN usermod -a -G vagrant-users vagrant

WORKDIR /home/vagrant
RUN curl -sfL https://releases.hashicorp.com/vagrant/2.2.6/vagrant_2.2.6_x86_64.rpm -o vagrant_2.2.6_x86_64.rpm

RUN rpm -i vagrant_2.2.6_x86_64.rpm

RUN yum -y update && yum group install -y "Development Tools" 
RUN yum -y install ruby gcc make libvirt qemu-kvm virt-install bridge-utils libxslt-devel libxml2-devel libguestfs-tools-c libvirt-devel ruby-devel 
#zlib-devel && gem update --system

#RUN gpasswd libvirt -a
#RUN export VIRSH_DEFAULT_CONNECT_URI=qemu:///system

#RUN vagrant plugin install /opt/vagrant/embedded/gems/2.2.6/cache/pkg-config-1.1.9.gem
#RUN CONFIGURE_ARGS="with-libvirt-include=/usr/include/libvirt with-libvirt-lib=/usr/lib" vagrant plugin install vagrant-libvirt

RUN vagrant plugin install vagrant-libvirt

RUN vagrant box add geerlingguy/centos7
RUN vagrant init geerlingguy/centos7

#This works for Centos 7 buy can't use libvirt due to need to restart libvirtd service using systemctl. Might not be a problem for other providers e.g. Virtualbox
#ENTRYPOINT ["vagrant", "up", "--provider=libvirt"]
