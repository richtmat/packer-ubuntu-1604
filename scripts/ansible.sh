#!/bin/bash -eux

# copy motd
cp /tmp/motd /etc/motd

# Install Ansible repository.
apt-add-repository ppa:ansible/ansible

# Install Ansible.
apt -y update && apt-get -y upgrade
apt -y install software-properties-common
apt -y install ansible
