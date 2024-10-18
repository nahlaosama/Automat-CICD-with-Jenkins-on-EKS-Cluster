#!/bin/bash
exec > >(tee -i /var/log/user-data.log)
exec 2>&1
sudo apt update -y 
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible
sudo apt install git -y 
mkdir Ansible && cd Ansible
pwd 
git clone https://github.com/nahlaosama/ansible.git
cd ansible
ansible-playbook -i lockalhost install_jenkins.yml 