#!/bin/bash
###
# This presumes a 64-bit Ubuntu 16 installation ("xenial")
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
apt-cache policy docker-ce
apt-get install -y docker-ce
groupadd docker
usermod -aG docker $USER