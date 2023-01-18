#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo yum install git -y
sudo yum install php -y
sudo yum install mysql -y
sudo amazon-linux-extras enable php7.4 -y
sudo yum install php-cli php-pdo php-fpm php-json php-mysqlnd -y
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
sudo yum install -y amazon-efs-utils
#sudo python3 -m pip install botocore
sudo mkdir -p /var/www/moodledata /var/www/html/moodle
mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport ${moodleefs}:/ /var/www/moodledata
sudo git clone https://github.com/moodle/moodle.git /var/www/html/moodle

# Add if RDS has been created within last 30 minutes statement? 
sudo php /var/www/html/moodle/admin/cli/install.php --wwwroot=http://${moodlealb}/moodle --dataroot=/var/www/moodledata/ --dbtype=mysqli --dbhost=${moodledbhost} --dbname=${moodledbname} --dbuser=${moodledbuser} --dbpass=${moodledbpw} --dbport=3306 --fullname=moodle --shortname=moodle --adminpass=${moodledbpw} --non-interactive --agree-license --allow-unstable
sudo chown -R apache:apache /var/www/moodledata /var/www/html/moodle
sudo chmod -R 700 /var/www/html/moodle
sudo systemctl start httpd
sudo systemctl enable httpd
