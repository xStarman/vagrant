# set -e

# this function is called when Ctrl-C is sent
function trap_ctrlc ()
{
    # perform cleanup here
    # echo "Ctrl-C caught...performing clean up"

    # echo "Doing cleanup"

    # exit shell script with error code 2
    # if omitted, shell script will continue execution
    exit 2
}

# initialise trap to call trap_ctrlc function
# when signal 2 (SIGINT) is received
trap "trap_ctrlc" 2

function gitClone ()
{
	local URL=$1
	local DIRECTORY=$2
	local BRANCH=$3
	local REPOSITORY_NAME=$4

	while true
	do
		git clone $URL $DIRECTORY

		ret=$?
		if ! test "$ret" -eq 0
		then
			rm -rf -- $DIRECTORY
		    printf "\nFalha ao clonar o repositório '$REPOSITORY_NAME'. Error code: $ret"
		    printf "\nRetentando em 3 segundos...\n\n"
		    sleep 3
		    continue
		    # exit 1
		fi

		break
	done

	if [ ! "$BRANCH" == "master" ]
	then
		printf "\ncheckout to $BRANCH...\n"
		(
		cd $DIRECTORY &&
		git checkout -b $BRANCH --track origin/$BRANCH &&
		git submodule update --init --recursive
		)
		# cd -
	fi
}

function isDirectory ()
{
  if [ -d "$1" ]
  then
    # 0 = true
    return 0
  else
    # 1 = false
    return 1
  fi
}

function isEmptyDirectory ()
{
  local DIRECTORY=$1
  if [ "$(ls -A $DIRECTORY)" ]
  then
    # 1 = false
    return 1
  else
    # 0 = true
    return 0
  fi
}

function createDirectory ()
{
	local DIRECTORY=$1
	mkdir -p $DIRECTORY
	chmod 755 $DIRECTORY
}

function removeDirectory ()
{
	local DIRECTORY=$1
	rm -rf -v -- $DIRECTORY
}