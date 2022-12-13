#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo yum install git -y
sudo yum install php -y
sudo yum install mysql -y
sudo yum install php-gd -y
sudo yum install php-pear -y
sudo yum install php-mbstring -y
sudo yum install php-mcrypt -y
sudo yum install php-xmlrpc -y
sudo yum install php-soap -y
sudo yum install php-intl -y
sudo yum install php-zip -y
sudo yum install php-zts -y
sudo yum install php-xml -y
sudo amazon-linux-extras enable php7.4
sudo yum update php
sudo mkdir /var/www/moodledata
sudo mkdir /var/www/html/moodle
sudo chown apache:apache /var/www/moodledata
sudo chown -R apache:apache /var/www/html/moodle
sudo cd /var/www/html
sudo git clone https://github.com/moodle/moodle.git .
sudo systemctl start httpd
sudo systemctl enable httpd
