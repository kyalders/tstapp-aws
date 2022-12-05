#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo yum install httpd git php php-gd php-pear php-mbstring php-mcrypt  php-xmlrpc php-soap php-intl php-zip php-zts php-xml -y
sudo mkdir /var/www/moodledata
sudo chown apache:apache /var/www/moodledata
sudo cd /var/www/html
sudo git clone git://git.moodle.org/moodle.git
sudo chown -R apache:apache /var/www/html/moodle
