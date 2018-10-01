DIRECTORY="/d/dev/centos7-php7"

if ! isDirectory $DIRECTORY; then
	createDirectory $DIRECTORY
fi

rm --recursive --force --verbose "$DIRECTORY/*"

if ! isDirectory "$DIRECTORY/centos7-php7/magento3"; then
	gitClone "http://gitlab.oderco.com.br/ti/magento.git" "$DIRECTORY/magento3" "develop" "magento3"
fi