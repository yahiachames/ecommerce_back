#!/bin/bash

apt update
apt-get -y install python3-pip && apt-get -y install python3-venv && apt-get install python3-dev libmysqlclient-dev
apt-get install -y apt-utils vim curl apache2 apache2-utils
apt-get -y install libapache2-mod-wsgi-py3
pip install -r requirements.txt
cp django_project.conf /etc/apache2/sites-available/
a2ensite django_project 
a2dissite 000-default.conf
a2enmod rewrite ssl
systemctl restart apache2

