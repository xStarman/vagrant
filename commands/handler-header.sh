source "functions.sh"

COMMAND=''
MACHINE_NAME=''

for i in "$@"
do
case $i in

	--command=*)
		readonly COMMAND="${i#*=}"
		shift # past argument=value
		;;

	--directory=*)
		readonly DIRECTORY="${i#*=}"
		shift # past argument=value
		;;

	--machine-name=*)
		readonly MACHINE_NAME="${i#*=}"
		shift # past argument=value
		;;

esac
done

# -------------------------------------------------

if [ -z "$COMMAND" ]; then
	echo 'A variável COMMAND não está definida, por favor informe o nome do comando nela!'
	read -r -s -t 5
	exit
fi

COMMAND_FILE="$COMMAND.sh"

if [ ! -f "$COMMAND_FILE" ]; then
	echo "O arquivo para o comando '$COMMAND_FILE' não existe. Verifique o parâmetro --command=COMMAND_FILE_NAME."
	read -r -s -t 5
	exit
fi

printf "Comando: $COMMAND\n"

# -------------------------------------------------

if [ -z "$MACHINE_NAME" ]; then
	echo 'A variável MACHINE_NAME não está definida, por favor informe o nome da maquina nela!'
	read -r -s -t 5
	exit
fi

printf "Máquina: $MACHINE_NAME\n"

# -------------------------------------------------

MACHINE_ROOT="/d/dev/vagrant/$MACHINE_NAME"

if [ ! -d "$MACHINE_ROOT" ]; then
	echo "O diretório '$MACHINE_ROOT' não existe. Verifique o parâmetro --machine-name=MACHINE_FOLDER_NAME."
	read -r -s -t 5
	exit
fi

printf "Diretório: $MACHINE_ROOT\n\n"