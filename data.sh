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
sudo python3 -m pip install botocore
sudo mkdir -p /var/www/moodledata /var/www/html/moodle
mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport ${moodleefs}:/ /var/www/moodledata
sudo chown apache:apache /var/www/moodledata /var/www/html/moodle
sudo git clone https://github.com/moodle/moodle.git /var/www/html/moodle

# Add if RDS has been created within last 30 minutes statement? 
sudo php /var/www/html/moodle/admin/cli/install.php --wwwroot=http://${moodlealb}/moodle --dataroot=/var/wwwmoodledata/ --dbtype=mysqli --dbhost=${moodledbhost} --dbname=${moodledbname} --dbuser=${moodledbuser} --dbpass=${moodledbpw} --fullname=moodle --shortname=moodle --adminpass=${moodledbpw} --non-interactive --agree-license

# ## Make config.php ##
# set -x

# cat <<EOT >> /var/www/html/moodle/config.php
# \<?php  // Moodle configuration file

# \unset($CFG);
# \global $CFG;
# \$CFG = new stdClass();

# \$CFG->dbtype    = 'mysqli';
# \$CFG->dblibrary = 'native';
# \$CFG->dbhost    = '${moodledbhost}';
# \$CFG->dbname    = '${moodledbname}';
# \$CFG->dbuser    = '${moodledbuser}';
# \$CFG->dbpass    = '${moodledbpw}';
# \$CFG->prefix    = 'mdl_';
# \$CFG->dboptions = array (
#   'dbpersist' => 0,
#   'dbport' => 3306,
#   'dbsocket' => '',
#   'dbcollation' => 'utf8mb4_unicode_ci',
# );

# \$CFG->wwwroot   = '${moodlealb}/moodle';
# \$CFG->dataroot  = '/var/www/moodledata';
# \$CFG->admin     = 'admin';

# \$CFG->directorypermissions = 0777;

# require_once(__DIR__ . '/lib/setup.php');

# // There is no php closing tag in this file,
# // it is intentional because it prevents trailing whitespace problems!
# EOT
#!/bin/bash

# Set the document root and server name
# DOCUMENT_ROOT="/var/www/moodle"
# SERVER_NAME=${moodlealb}

# # Set the error and access log paths
# ERROR_LOG="/var/log/httpd/moodle-error.log"
# ACCESS_LOG="/var/log/httpd/moodle-access.log"

# # Set the PHP values
# PHP_MEMORY_LIMIT="256M"
# PHP_UPLOAD_MAX_FILESIZE="50M"
# PHP_POST_MAX_SIZE="50M"
# PHP_MAX_EXECUTION_TIME="3600"
# PHP_MAX_INPUT_TIME="3600"

# # Create the VirtualHost configuration
# VHOST_CONF="
# Listen 80

# <VirtualHost *:80>
#     DocumentRoot $DOCUMENT_ROOT
#     ServerName $SERVER_NAME
#     ErrorLog $ERROR_LOG
#     CustomLog $ACCESS_LOG combined

#     <Directory $DOCUMENT_ROOT>
#         Options FollowSymLinks
#         AllowOverride All
#         Require all granted
#     </Directory>

#     <IfModule mod_php5.c>
#         php_value memory_limit $PHP_MEMORY_LIMIT
#         php_value upload_max_filesize $PHP_UPLOAD_MAX_FILESIZE
#         php_value post_max_size $PHP_POST_MAX_SIZE
#         php_value max_execution_time $PHP_MAX_EXECUTION_TIME
#         php_value max_input_time $PHP_MAX_INPUT_TIME
#     </IfModule>
# </VirtualHost>"

# # Write the configuration to the file
# sudo echo "$VHOST_CONF" > /etc/httpd/conf/moodle.conf

sudo systemctl start httpd
sudo systemctl enable httpd
