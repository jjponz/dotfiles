#!/bin/bash

# uso: ./virtual_machines_up NOMBRE_CARPETA_QUE_CONTIENE_LA_MAQUINA VIRTUAL
# el script levanta la máquina virtual mediante el comando vagrant up
#VIRTUAL_MACHINES_RELATIVE_HOMEPATH debe ser una carpeta dentro de $HOME donde se encuentran por carpetas distribuidas las maquinas virtuales, por ejemplo:
# ./virtual_machines_up bla
# levantara la máquina virtual dentro de $HOME/maquinasvirtuales/bla 

function usage {
    echo "USAGE:"
   echo "virtual_machines_up up NombreCarpetaQueContieneLaMaquina\n"
   echo "Or"
   echo "virtual_machine_up up NombrecarpetaQueContieneLaMaquina ssh => to open vagrant ssh connection"
   echo "Or"
   echo "virtual_machines_up list"
}

VIRTUAL_MACHINES_RELATIVE_HOMEPATH="maquinasvirtuales"

if [ $# -gt 3 ]
then
   usage   
   exit
fi

case "$1" in
    up)
        VIRTUAL_MACHINE=$2
        cd $HOME/$VIRTUAL_MACHINES_RELATIVE_HOMEPATH/$VIRTUAL_MACHINE && vagrant up
        exit
        ;;
    list)
        ls -lha $HOME/$VIRTUAL_MACHINES_RELATIVE_HOMEPATH
        exit
        ;;
    ssh)
        VIRTUAL_MACHINE=$2
        cd $HOME/$VIRTUAL_MACHINES_RELATIVE_HOMEPATH/$VIRTUAL_MACHINE && vagrant ssh
        exit
        ;;
    *)
        usage
        exit
esac

case "$3" in
    ssh)
        vagrant ssh
        ;;
    *)
        usage
        exit
esac
