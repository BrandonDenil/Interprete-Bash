#!/bin/bash
valid=true
count=1
while [ $valid ]
do
read -p ">>>" codigo
resto=""
if [ ${codigo:0:3} = "chd" ];
then
	resto=${codigo:3}
	cd $resto
elif [ ${codigo:0:3} = "ver" ];
then
	resto=${codigo:3}
	cat $resto
elif [ ${codigo:0:4} = "tipo" ]
then
	resto=${codigo:4}
	file $resto
elif [ ${codigo:0:6} = "deldir" ];
then
	resto=${codigo:6}
	rmdir $resto
elif [ ${codigo:0:7} = "txtedit" ];
then	
	resto=${codigo:7}
	nano $resto
elif [ ${codigo:0:8} = "creardir" ];
then
	resto=${codigo:8}
	mkdir $resto
elif [ ${codigo:0:8} = "imprimir" ];
then
	resto=${codigo:8}
	echo $resto
elif [ $codigo = "cerrar" ];
then
	break

elif [ $codigo = "clearpnt" ];
then
	clear
elif [ $codigo = "helpme" ];
then
echo "	cerrar:		cierra la terminal"
echo "	clearpnt:	limpia la pantalla "
echo "	directoriosver:	Muestra los directorios existentes "
echo "	now:		Muestra la hora y fecha actual"
echo "	showact: 	Muestra el directorio actual"
echo "	creardir:	Crea un directorio"
echo "	outd:	Regresa al directorio anterior"
echo "	creardir:	Crea un directorio"
echo "	txtedit:	edita un archivo de texto"
echo "	chd:		Cambiar de directorio"
echo "	deldir:		eliminar un directorio y su contenido"
echo "	ver:		Visualiza el contenido de una archivo"
echo "	imprimir:	Imprime una cadena un caracter o una variable"

elif [ $codigo = "directoriosver" ];
then
	ls
elif [ $codigo = "now" ];
then
	dia=`date +"%d/%m/%y"`
	hora=`date +"%H:%M"`
	echo "Fecha: $dia"
	echo "Hora: $hora"
elif [ $codigo = "showact" ]
then
	pwd
elif [ $codigo = "outd" ]
then
	cd ..
else
	echo "codigo no identificado o erroneo"
fi
done

