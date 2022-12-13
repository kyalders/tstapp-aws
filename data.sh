#!/bin/bash
sudo yum update -y
sudo yum install httpd 
sudo yum install git php -y
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
sudo mkdir /var/www/moodledata
sudo mkdir /var/www/moodledata
sudo chown apache:apache /var/www/moodledata
sudo chown -R apache:apache /var/www/html/moodle
sudo cd /var/www/html
sudo git clone https://github.com/moodle/moodle.git .
sudo systemctl start httpd
sudo systemctl enable httpd
