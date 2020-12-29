#!/bin/bash

# https://docs.docker.com/engine/security/rootless/
# https://stackoverflow.com/questions/63482865/how-to-set-modprobe-overlay-permit-mounts-in-userns-1

# Paquetería previa (Ubuntu + Debian)
sudo apt update

sudo apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    uidmap

# Particularidades Debian
modificacionKernelparaDebian(){
    echo "kernel.unprivileged_userns_clone=1" | sudo tee -a /etc/sysctl.d/10-docker.conf
    sudo sysctl --system
    echo "options overlay permit_mounts_in_userns=1" | sudo tee -a /etc/modprobe.d/10-docker.conf
    sudo modprobe overlay permit_mounts_in_userns=1
}

# Instalación de Docker
distro=$(awk '{ print $1 }' /etc/issue)

if [ "$distro" = "Debian" ]
    then
        modificacionKernelparaDebian
        curl -fsSL https://get.docker.com/rootless | sh
else
    curl -fsSL https://get.docker.com/rootless | sh
fi