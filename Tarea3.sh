#!/bin/bash

# Leer el archivo CSV
while IFS=';' read -r mes venta_mensual producto cliente
do
# Convertir la venta mensual a número
v=$(echo $venta_mensual | tr -d '\r')
# Como comprobar que la venta mensual es un número
if [[ $v =~ ^[0-9]+$ ]]; then
    mes+=("$mes")
    venta_mensual+=("$v")
fi
done < ventas.csv

# Generar reporte
> reporte_ventas.txt
echo "-------------------------------------------------" >> reporte_ventas.txt
echo "Total venta mensual" >> reporte_ventas.txt
echo "-------------------------------------------------" >> reporte_ventas.txt
for ((i=0; i<${#venta_mensual[@]}; i++)) do
    echo " ${mes[$i]}" "$" "${venta_mensual[$i]}" >> reporte_ventas.txt        
done
echo "" >> reporte_ventas.txt

echo "-----------------------------------------------" >> reporte_ventas.txt
producto_mas_vendido=$(cut -d';' -f3 ventas.csv | sort | uniq -c | sort -nr | head -n1) 
echo -e "El producto más vendido es:\n-----------------------------------------------\n $(echo $producto_mas_vendido | awk '{$1=""; print $0}' | sed 's/^ //')" >> reporte_ventas.txt
echo "" >> reporte_ventas.txt

echo "-----------------------------------------------" >> reporte_ventas.txt
echo "Monto anual" >> reporte_ventas.txt
echo "-----------------------------------------------" >> reporte_ventas.txt
for i in "${!venta_mensual[@]}"; do
    monto_anual=$((monto_anual + ${venta_mensual[$i]}))
done
echo " $""$monto_anual" >> reporte_ventas.txt
echo "" >> reporte_ventas.txt

echo "-----------------------------------------------" >> reporte_ventas.txt
cliente_mas_frecuente=$(cut -d';' -f4 ventas.csv | sort | uniq -c | sort -nr | head -n1) 
echo -e "El cliente más frecuente es:\n-----------------------------------------------\n $(echo $cliente_mas_frecuente | awk '{$1=""; print $0}' | sed 's/^ //')" >> reporte_ventas.txt
echo "" >> reporte_ventas.txt