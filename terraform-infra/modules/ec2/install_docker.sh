#!/bin/bash

# Update the package list
sudo apt-get update 

# Install prerequisite packages of docker
sudo apt install curl
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker.gpg
sudo add-apt-repository "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update

# Install Docker
sudo apt -y install lsb-release gnupg apt-transport-https ca-certificates curl software-properties-common
sudo apt -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-registry
# sudo usermod -aG docker $USER
# newgrp docker

# Update the package list
sudo apt-get update 

# Install AWS CLI 
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

#  Install and Configure kubectl
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/latest/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin
