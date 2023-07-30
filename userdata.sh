#! /bin/bash
yum update -y
yum install python3
pip3 install flask
FOLDER="https://raw.githubusercontent.com/bedilk/Cfn-CLI/main/"

cd /home/ec2-user
mkdir templatesaws
wget ${FOLDER}/app.py
cd templates
wget ${FOLDER}/templates/index.html
wget ${FOLDER}/templates/result.html
cd ..
python3 app.py


