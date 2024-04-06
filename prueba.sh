#!/bin/bash
monto_enero=0
totalteclados=0
totalmemoria=0
totaltarjetas=0
totalmonitores=0
totalssd=0
totalescalon=0
totalvenezuela=0
totalluceiro=0
totalcentro=0
totallarabida=0
totallamascota=0
ventastotales=0

while IFS=";" read -r mes monto descripcion sucursal
do
    echo "-e" "$mes $monto $descripcion $sucursal"

    #ventas totales

    ventastotales=$(echo $ventastotales $monto | awk '{printf "%.2f", $1 + $2}')

    #quiero saber cual es el producto mas vendido

    if [ "$descripcion" == "Teclados" ]; then

        totalteclados=$((totalteclados+1))
    fi    
    if [ "$descripcion" == "Memoria Ram" ]; then

        totalmemoria=$((totalmemoria+1))
    fi

    if [ "$descripcion" == "Tarjetas Graficas" ]; then
        totaltarjetas=$((totaltarjetas+1))
    fi

    if [ "$descripcion" == "Monitores" ]; then
        totalmonitores=$((totalmonitores+1))
    fi

    if [ "$descripcion" == "SSD" ]; then
        totalssd=$((totalssd+1))
    fi


    if [ "$sucursal" == "Escalon" ]; then
        totalescalon=$((totalescalon+1))
    fi

    if [ "$sucursal" == "Venezuela" ]; then
        totalvenezuela=$((totalvenezuela+1))
    fi

    if [ "$sucursal" == "Luceiro" ]; then
        totalluceiro=$((totalluceiro+1))
    fi

    if [ "$sucursal" == "Centro" ]; then
        totalcentro=$((totalcentro+1))
    fi

    if [ "$sucursal" == "La rabida" ]; then
        totallarabida=$((totallarabida+1))
    fi

    if [ "$sucursal" == "La mascota" ]; then

        totallamascota=$((totallamascota+1))
    fi

    #Sumar las ventas que hayan sido vendidas en el mes de enero
    if [[ $mes == "Enero" ]]; then
        monto_enero=$(echo $monto_enero $monto | awk '{printf "%.2f", $1 + $2}')



        #saber cual fue el mes que mas vendio        
       
        if [[ $monto > $mayor ]]; then
            mayor=$monto
            mes_mayor=$mes
        fi
    fi
done < ventas.csv

echo -e "El monto vendido en el mes de enero es: $ $monto_enero" > prueba_de_salida.txt
echo -e "El mes que mas vendio fue: $mes_mayor" >> prueba_de_salida.txt
echo -e "Las ventas totales son : $ $ventastotales" >> prueba_de_salida.txt
echo -e "el total de teclados vendidos es: $totalteclados" >> prueba_de_salida.txt
echo -e "el total de memorias ram vendidas es: $totalmemoria" >> prueba_de_salida.txt
echo -e "el total de tarjetas graficas vendidas es: $totaltarjetas" >> prueba_de_salida.txt
echo -e "el total de monitores vendidos es: $totalmonitores" >> prueba_de_salida.txt
echo -e "el total de SSD vendidos es: $totalssd" >> prueba_de_salida.txt
echo -e "el total de ventas de la sucrsal Escalon es: $totalescalon" >> prueba_de_salida.txt
echo -e "el total de ventas de la sucursal Venezuela es: $totalvenezuela" >> prueba_de_salida.txt
echo -e "el total de ventas de la sucursal Luceiro es: $totalluceiro" >> prueba_de_salida.txt
echo -e "el total de ventas de la sucursal Centro es: $totalcentro" >> prueba_de_salida.txt
echo -e "el total de ventas de la sucursal La rabida es: $totallarabida" >> prueba_de_salida.txt
echo -e "el total de ventas de la sucursal La mascota es: $totallamascota" >> prueba_de_salida.txt
