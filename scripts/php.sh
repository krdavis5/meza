#!/bin/bash
#
# Setup PHP

print_title "Starting script php.sh"


# Install IUS repository
yum -y install https://centos7.iuscommunity.org/ius-release.rpm

# Install yum-plugin-replace and replace the php packages with php70u packages:
# yum install -y yum-plugin-replace
# yum -y replace --replace-with php70u php

# Install php70u packages
# not available (yet?) with PHP 7.0:
#	php70u-pecl-memcache \ (required for SAML auth)
#		https://github.com/iuscommunity/wishlist/issues/38
#	php70u-pspell \ (I don't think this is required for anything)
# 	php70u-pecl-jsonc \ (may not be required anymore due to JSON module
#		inclusion in PHP7, ref:
#		https://github.com/iuscommunity/wishlist/issues/87)
# 	php70u-intl \ (Not entirely sure we're actually using this)
yum install -y \
	php70u \
	php70u-cli \
	php70u-common \
	php70u-devel \
	php70u-gd \
	php70u-snmp \
	php70u-xml \
	php70u-xmlrpc \
	php70u-mysqlnd \
	php70u-pdo \
	php70u-odbc \
	php70u-pear \
	php70u-process \
	php70u-bcmath \
	php70u-opcache \
	php70u-soap \
	php70u-mbstring \
	php70u-mcrypt


#
# Initiate php.ini
#
mv /etc/php.ini /etc/php.ini.default
ln -s "$m_config/core/php.ini" /etc/php.ini


#
# Start webserver service
#
chkconfig httpd on
service httpd status
service httpd restart

# # Install PEAR Mail
pear install --alldeps Mail

echo -e "\n\nPHP has been setup.\n\nPlease use the web browser on your host computer to navigate to http://192.168.56.56/info.php to verify php is being executed."
