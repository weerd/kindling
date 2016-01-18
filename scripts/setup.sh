#!/usr/bin/env bash

# Download the latest packages list
sudo apt-get update

# Set password for MySQL
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password vagrant'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password vagrant'

# Install utility applications
sudo apt-get install -y vim curl wget software-properties-common

# Add repository for PHP
sudo add-apt-repository -y ppa:ondrej/php5

# Download the latest packages list
sudo apt-get update

# Install all the necessary software
sudo apt-get install -y php5 apache2 libapache2-mod-php5 php5-curl php5-gd php5-mcrypt php5-readline mysql-server-5.5 php5-mysql git-core php5-xdebug

# Enable XDebug
cat << EOF | sudo tee -a /etc/php5/mods-available/xdebug.ini
xdebug.scream=1
xdebug.cli_color=1
xdebug.show_local_vars=1
EOF

# Setup Apache
sudo a2enmod rewrite

# Enable error reportting for PHP
sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php5/apache2/php.ini
sed -i "s/display_errors = .*/display_errors = On/" /etc/php5/apache2/php.ini
sed -i "s/disable_functions = .*/disable_functions = /" /etc/php5/cli/php.ini

# Restart Apache
sudo service apache2 restart

# Setup Composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
