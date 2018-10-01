DIRECTORY="/d/dev/centos7-php56"

if isDirectory $DIRECTORY; then
	if isDirectory "$DIRECTORY/centos7-php56/rma"; then
		removeDirectory "$DIRECTORY/centos7-php56/rma"
	fi
	
	if isDirectory "$DIRECTORY/centos7-php56/salesforce"; then
		removeDirectory "$DIRECTORY/centos7-php56/salesforce"
	fi
	
	if isDirectory "$DIRECTORY/centos7-php56/services"; then
		removeDirectory "$DIRECTORY/centos7-php56/services"
	fi
	
	if isDirectory "$DIRECTORY/centos7-php56/seguranca"; then
		removeDirectory "$DIRECTORY/centos7-php56/seguranca"
	fi

	removeDirectory $DIRECTORY
fi