FROM centos:7 as build

RUN yum update && yum -y install qemu-kvm \
    qemu-img \
    virt-manager \
    libvirt \
    libvirt-python \
    libvirt-client \
    virt-install \
    virt-viewer \
    bridge-utils

#May need a VM
RUN systemctl start libvirtd && systemctl enable libvirtd 

WORKDIR /home/VM
#RUN fallocate -l 8G centos7.img
RUN qemu-img create -f qcow2 ./centos7.qcow2 8G
RUN virt-install \
    --name centos7 \
    --ram 1024 \
    --disk path=./centos7.qcow2,size=8 \
    --vcpus 1 \
    --os-type linux \
    --os-variant centos7 \
    --network bridge=virbr0 \
    --graphics none \
    --console pty,target_type=serial \
    --location 'http://ftp.rz.uni-frankfurt.de/pub/mirrors/centos/7.7.1908/isos/x86_64/CentOS-7-x86_64-Minimal-1908.iso' \
    --extra-args 'console=ttyS0,115200n8 serial'
