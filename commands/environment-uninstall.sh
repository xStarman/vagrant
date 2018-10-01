printf "\n\nRemovendo o ambiente...\n\n"

(
cd "$MACHINE_ROOT/config/" &&
. gitremove.sh
)