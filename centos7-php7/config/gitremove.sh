DIRECTORY="/d/dev/centos7-php7"

if isDirectory $DIRECTORY; then
	if isDirectory "$DIRECTORY/centos7-php7/magento3"; then
		removeDirectory "$DIRECTORY/centos7-php7/magento3"
	fi

	removeDirectory $DIRECTORY
fi