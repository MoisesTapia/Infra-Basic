#!/bin/bash

FILE=$PWD

echo -e "\e[1;32mWait a moment .....\e[0m"
sleep 3
echo -e "\e[92mExecuting terraform apply  ....\e[0m"
terraform apply -auto-approve
sleep 4
echo -e "\e[96mGenerating the\e[0m \e[44m'outputfile'\e[0m \e[96mwait a moment ....\e[0m"
terraform output --json > terraform.json
sudo mv terraform.json $FILE/Infra-Basic/infrabasic/files/
sleep 5
clear
echo -e "File Saved in \e[30;48;5;82m$FILE/Infra-Basic/infrabasic/files/\e[0m"
