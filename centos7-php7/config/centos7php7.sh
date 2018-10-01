#!/bin/bash

echo "Configurando VirtualHosts..."

HTTPD1=$(cat <<EOF

	ServerName 192.168.56.110
	NameVirtualHost *:80

	<VirtualHost *:80>
	  DocumentRoot "/var/www/html"
	  ServerName 192.168.56.110
	  <Directory "/var/www/html">
		Options Indexes FollowSymLinks Includes ExecCGI
	    AllowOverride All
		Require all granted
	  </Directory>
	</VirtualHost>

EOF
)

echo "${HTTPD1}" > /etc/httpd/conf.d/qwert.oderco.com.br.conf

HTTPD2=$(cat <<EOF

	<VirtualHost *:80>
		ServerAdmin nti@oderco.com.br
		DocumentRoot /var/www/html/magento3
		ServerName oderco.com.br
		ServerAlias www.oderco.com.br
		ErrorLog /var/log/httpd/error_log
		CustomLog /var/log/httpd/access_log common
	</VirtualHost>
	
	<Directory "/var/www/html/magento3">
		Options FollowSymLinks
		AllowOverride All
		Order allow,deny
		Allow from all
	</Directory>


EOF
)

echo "${HTTPD2}" > /etc/httpd/conf.d/oderco.com.br.conf


echo "Configurando httpd.conf..."

sed -i 's#EnableSendfile on#EnableSendfile off#' /etc/httpd/conf/httpd.conf

service httpd restart




