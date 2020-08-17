#!/bin/bash

FILE=$PWD

clear
echo -e "\e[1;32mWait a moment .....\e[0m"
sleep 2
echo -e "\e[0;31mGenereting the report with Inspec ....\e[0m"
mkdir report
inspec exec infrabasic --reporter cli json:$FILE/report/output.json html:$FILE/report/index.html -t aws://
#$md5 = md5sum report/output.json && md5sum report/index.html
echo -e "\e[0;32m|-----------------------------------------------------------------------------|\e[0m"
echo -e "\e[0;32m| File saved in the following path $FILE|\e[0m"
echo -e "\e[0;32m| File saved in the following path $FILE|\e[0m"
echo -e "\e[0;32m|-----------------------------------------------------------------------------|\e[0m"
