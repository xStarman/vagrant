#!/bin/bash

echo "Configurando VirtualHosts..."

HTTPD1=$(cat <<EOF

	ServerName 192.168.56.108
	NameVirtualHost *:80

	<VirtualHost *:80>
	  DocumentRoot "/var/www/html"
	  ServerName 192.168.56.108
	  <Directory "/var/www/html">
		Options Indexes FollowSymLinks Includes ExecCGI
	    AllowOverride All
		Require all granted
	  </Directory>
	</VirtualHost>

EOF
)

echo "${HTTPD1}" > /etc/httpd/conf.d/abcdefg.oderco.com.br.conf

HTTPD2=$(cat <<EOF

	<VirtualHost *:80>
	  DocumentRoot "/var/www/html/rma"
	  ServerName rma.oderco.com.br
	  <Directory "/var/www/html/rma">
		Options Indexes FollowSymLinks Includes ExecCGI
	    AllowOverride All
		Require all granted
	  </Directory>
	</VirtualHost>


EOF
)

echo "${HTTPD2}" > /etc/httpd/conf.d/rma.oderco.com.br.conf

HTTPD3=$(cat <<EOF

	<VirtualHost *:80>
	  DocumentRoot "/var/www/html/salesforce"
	  ServerName salesforce.oderco.com.br
	  <Directory "/var/www/html/salesforce">
		Options Indexes FollowSymLinks Includes ExecCGI
	    AllowOverride All
		Require all granted
	  </Directory>
	</VirtualHost>

EOF
)

echo "${HTTPD3}" > /etc/httpd/conf.d/salesforce.oderco.com.br.conf


HTTPD4=$(cat <<EOF

	<VirtualHost *:80>
	  DocumentRoot "/var/www/html/services"
	  ServerName services.oderco.com.br
	  <Directory "/var/www/html/services">
		Options Indexes FollowSymLinks Includes ExecCGI
	    AllowOverride All
		Require all granted
	  </Directory>
	</VirtualHost>

EOF
)

echo "${HTTPD4}" > /etc/httpd/conf.d/services.oderco.com.br.conf

HTTPD5=$(cat <<EOF

	<VirtualHost *:80>
	  DocumentRoot "/var/www/html/seguranca"
	  ServerName seguranca.oderco.com.br
	  <Directory "/var/www/html/seguranca">
		Options Indexes FollowSymLinks Includes ExecCGI
	    AllowOverride All
		Require all granted
	  </Directory>
	</VirtualHost>

EOF
)

echo "${HTTPD5}" > /etc/httpd/conf.d/seguranca.oderco.com.br.conf

HTTPD6=$(cat <<EOF

	<VirtualHost *:80>
	  DocumentRoot "/var/www/html/apiodex/public"
	  ServerName api.odex.com.br
	  <Directory "/var/www/html/apiodex/public">
		Options Indexes FollowSymLinks Includes ExecCGI
	    AllowOverride All
		Require all granted
	  </Directory>
	</VirtualHost>

EOF
)

echo "${HTTPD6}" > /etc/httpd/conf.d/api.odex.com.br.conf

HTTPD7=$(cat <<EOF

	<VirtualHost *:80>
	  DocumentRoot "/var/www/html/intranetodex"
	  ServerName intranet.odex.com.br
	  <Directory "/var/www/html/intranetodex">
		Options Indexes FollowSymLinks Includes ExecCGI
	    AllowOverride All
		Require all granted
	  </Directory>
	</VirtualHost>

EOF
)

echo "${HTTPD7}" > /etc/httpd/conf.d/intranet.odex.com.br.conf

echo "Configurando httpd.conf..."

sed -i 's#EnableSendfile on#EnableSendfile off#' /etc/httpd/conf/httpd.conf

service httpd restart
