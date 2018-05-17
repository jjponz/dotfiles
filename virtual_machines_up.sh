#!/bin/bash

# uso: ./virtual_machines_up NOMBRE_CARPETA_QUE_CONTIENE_LA_MAQUINA VIRTUAL
# el script levanta la máquina virtual mediante el comando vagrant up
#VIRTUAL_MACHINES_RELATIVE_HOMEPATH debe ser una carpeta dentro de $HOME donde se encuentran por carpetas distribuidas las maquinas virtuales, por ejemplo:
# ./virtual_machines_up bla
# levantara la máquina virtual dentro de $HOME/maquinasvirtuales/bla 
if [ $# -ne 1 ]
then
   echo "Usage: virtual_machines_up NombreCarpetaQueContieneLaMaquina"
   exit
fi

VIRTUAL_MACHINES_RELATIVE_HOMEPATH="maquinasvirtuales"
VIRTUAL_MACHINE=$1
cd $HOME/$VIRTUAL_MACHINES_RELATIVE_HOMEPATH/$VIRTUAL_MACHINE && vagrant up
