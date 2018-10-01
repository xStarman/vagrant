(
cd $MACHINE_ROOT &&
vagrant box update &&
vagrant destroy -f &&
vagrant up
)