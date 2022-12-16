#!/bin/bash

apt update
apt-get -y install python3-pip && apt-get -y install python3-venv
apt-get install -y apt-utils vim curl apache2 apache2-utils
apt-get -y install libapache2-mod-wsgi-py3
cp django_project.conf /etc/apache2/sites-available/
a2ensite django_project 
a2dissite 000-default.conf
pip install -r requirements.txt
chmod 777 /app/media_root