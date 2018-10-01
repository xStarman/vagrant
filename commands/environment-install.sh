(
cd "$MACHINE_ROOT/config/" &&
. gitclone.sh
)

ret=$?
if ! test "$ret" -eq 0
then
	read -r -s -t 5
    exit 1
fi

printf "\n\n"
