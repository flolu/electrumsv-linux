#!/bin/bash

# https://docs.docker.com/engine/install/fedora/#install-using-the-repository
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf -y install docker-ce docker-ce-cli containerd.io
if ! [ $(getent group docker) ]; then
  sudo groupadd docker
fi
sudo gpasswd -a $USER docker
newgrp docker
sudo su $USER
sudo usermod -aG docker $USER
sudo systemctl start docker
sudo systemctl enable docker
