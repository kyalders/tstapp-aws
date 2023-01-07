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
sudo mkdir /var/www/moodledata /var/www/html/moodle
sudo chown apache:apache /var/www/moodledata /var/www/html/moodle
sudo git clone https://github.com/moodle/moodle.git /var/www/html/moodle
## Make config.php ##
set -x

cat <<EOT >> /var/www/html/moodle/config.php
\<?php  // Moodle configuration file

\unset($CFG);
\global $CFG;
\$CFG = new stdClass();

\$CFG->dbtype    = 'mysqli';
\$CFG->dblibrary = 'native';
\$CFG->dbhost    = '${moodledbhost}';
\$CFG->dbname    = 'moodle';
\$CFG->dbuser    = '${moodledbuser}';
\$CFG->dbpass    = '${moodledbpw}';
\$CFG->prefix    = 'mdl_';
\$CFG->dboptions = array (
  'dbpersist' => 0,
  'dbport' => 3306,
  'dbsocket' => '',
  'dbcollation' => 'utf8mb4_unicode_ci',
);

\$CFG->wwwroot   = '${moodlealb}/moodle';
\$CFG->dataroot  = '/var/www/moodledata';
\$CFG->admin     = 'admin';

\$CFG->directorypermissions = 0777;

\$CFG->session_handler_class = '\core\session\redis';
\$CFG->session_redis_host = '${redis}';
\$CFG->session_redis_port = 6379;

require_once(__DIR__ . '/lib/setup.php');

// There is no php closing tag in this file,
// it is intentional because it prevents trailing whitespace problems!
EOT
sudo systemctl start httpd
sudo systemctl enable httpd
