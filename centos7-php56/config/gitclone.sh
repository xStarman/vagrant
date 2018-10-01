DIRECTORY="/d/dev/centos7-php56"

if ! isDirectory $DIRECTORY; then
	createDirectory $DIRECTORY
fi

rm --recursive --force --verbose "$DIRECTORY/*"

if ! isDirectory "$DIRECTORY/centos7-php56/rma"; then
	gitClone "http://gitlab.oderco.com.br/ti/rma.git" "$DIRECTORY/rma" "develop" "rma"
fi

if ! isDirectory "$DIRECTORY/centos7-php56/salesforce"; then
	gitClone "http://gitlab.oderco.com.br/ti/salesforce.git" "$DIRECTORY/salesforce" "develop" "salesforce"
fi

if ! isDirectory "$DIRECTORY/centos7-php56/services"; then
	gitClone "http://gitlab.oderco.com.br/ti/services.git" "$DIRECTORY/services" "develop" "services"
fi

if ! isDirectory "$DIRECTORY/centos7-php56/seguranca"; then
	gitClone "http://gitlab.oderco.com.br/ti/seguranca.git" "$DIRECTORY/seguranca" "develop" "seguranca"
fi