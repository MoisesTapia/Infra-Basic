#!/bin/bash

FILE=$PWD

echo "Wait a moment ....."
echo "Genereting the report with Inspec ...."
inspec exec infrabasic --reporter cli json:$FILE/output.json html:$FILE/index.html -t aws://
echo "File saived in the following path $FILE"
