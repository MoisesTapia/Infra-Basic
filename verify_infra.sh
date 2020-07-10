#!/bin/bash

FILE=$PWD

echo -e "\e[1;32mWait a moment .....\e[0m"
echo -e "\e[0;31mGenereting the report with Inspec ....\e[0m"
mkdir report
inspec exec infrabasic --reporter json:$FILE/report/output.json html:$FILE/report/index.html -t aws://
echo -e "\e[0;32m|------------------------------------------------------------------------------|\e[0m"
echo -e "\e[0;32m| File saived in the following path $FILE|\e[0m"
echo -e "\e[0;32m|------------------------------------------------------------------------------|\e[0m"