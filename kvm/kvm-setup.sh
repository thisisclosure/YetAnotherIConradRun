yum update && yum -y install qemu-kvm \
    qemu-img \
    virt-manager \
    libvirt \
    libvirt-python \
    libvirt-client \
    virt-install \
    virt-viewer \
    bridge-utils

systemctl start libvirtd && systemctl enable libvirtd 

curl -L -O 'http:///mirror.23media.com/centos/7.7.1908/isos/x86_64/CentOS-7-x86_64-Minimal-1908.iso' 
    
#RUN fallocate -l 8G centos7.img

#IDEA: Use this as base image for the rest of the exercises?
qemu-img create -f qcow2 ./centos7.qcow2 8G
virt-install \
    --name centos7 \
    --ram 1024 \
    --disk path=./centos7.qcow2,size=8 \
    --vcpus 1 \
    --os-type linux \
    --os-variant centos7.0 \
    --network bridge=virbr0 \
    --graphics none \
    --console pty,target_type=serial \
    --location './CentOS-7-x86_64-Minimal-1908.iso' \
    --extra-args 'console=ttyS0,115200n8 serial'
