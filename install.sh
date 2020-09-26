#!/bin/bash

echo -e "Installing aws-cli"

sudo apt-get install python python-pip
sudo pip install awscli
sleep 4
aws --version
sleep 4
clear

echo -e "Installing Inspec"

curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P inspec
sleep 3
inspec --version
clear