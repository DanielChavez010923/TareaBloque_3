#!/bin/bash
monto_anual=0
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

ventastotales=$(echo $ventastotales $venta_mensual | awk '{printf "%.2f", $1 + $2}')

if [ $mes == "Enero" ]; then
    monto_enero=$(echo $monto_enero $v | awk '{printf "%.2f", $1 + $2}')
fi

if [ $mes == "Febrero" ]; then
    monto_febrero=$(echo $monto_febrero $v | awk '{printf "%.2f", $1 + $2}')
fi
if [ $mes == "Marzo" ]; then
    monto_marzo=$(echo $monto_marzo $v | awk '{printf "%.2f", $1 + $2}')
fi
if [ $mes == "Abril" ]; then
    monto_abril=$(echo $monto_abril $v | awk '{printf "%.2f", $1 + $2}')
fi
if [ $mes == "Mayo" ]; then
    monto_mayo=$(echo $monto_mayo $v | awk '{printf "%.2f", $1 + $2}')
fi
if [ $mes == "Junio" ]; then
    monto_junio=$(echo $monto_junio $v | awk '{printf "%.2f", $1 + $2}')
fi
if [ $mes == "Julio" ]; then    
    monto_julio=$(echo $monto_julio $v | awk '{printf "%.2f", $1 + $2}')
fi
if [ $mes == "Agosto" ]; then
    monto_agosto=$(echo $monto_agosto $v | awk '{printf "%.2f", $1 + $2}')
fi
if [ $mes == "Septiembre" ]; then
    monto_septiembre=$(echo $monto_septiembre $v | awk '{printf "%.2f", $1 + $2}')
fi
if [ $mes == "Octubre" ]; then
    monto_octubre=$(echo $monto_octubre $v | awk '{printf "%.2f", $1 + $2}')
fi
if [ $mes == "Noviembre" ]; then
    monto_noviembre=$(echo $monto_noviembre $v | awk '{printf "%.2f", $1 + $2}')
fi
if [ $mes == "Diciembre" ]; then
    monto_diciembre=$(echo $monto_diciembre $v | awk '{printf "%.2f", $1 + $2}')
fi





done < ventas.csv

# Generar reporte
> reporte_ventas.txt    
echo "-------------------------------------------------" >> /workspaces/TareaBloque_3/reporte_ventas.txt
echo "Total venta mensual" >> /workspaces/TareaBloque_3/reporte_ventas.txt
echo "-------------------------------------------------" >> /workspaces/TareaBloque_3/reporte_ventas.txt

echo -e "Enero: $" $monto_enero >> /workspaces/TareaBloque_3/reporte_ventas.txt
echo -e "Febrero: $" $monto_febrero >> /workspaces/TareaBloque_3/reporte_ventas.txt
echo -e "Marzo: $" $monto_marzo >> /workspaces/TareaBloque_3/reporte_ventas.txt
echo -e "Abril: $" $monto_abril >> /workspaces/TareaBloque_3/reporte_ventas.txt
echo -e "Mayo: $" $monto_mayo >> /workspaces/TareaBloque_3/reporte_ventas.txt
echo -e "Junio: $" $monto_junio >> /workspaces/TareaBloque_3/reporte_ventas.txt
echo -e "Julio: $" $monto_julio >> /workspaces/TareaBloque_3/reporte_ventas.txt
echo -e "Agosto: $" $monto_agosto >> /workspaces/TareaBloque_3/reporte_ventas.txt
echo -e "Septiembre: $" $monto_septiembre >> /workspaces/TareaBloque_3/reporte_ventas.txt
echo -e "Octubre: $" $monto_octubre >> /workspaces/TareaBloque_3/reporte_ventas.txt
echo -e "Noviembre: $" $monto_noviembre >> /workspaces/TareaBloque_3/reporte_ventas.txt
echo -e "Diciembre: $" $monto_diciembre >> /workspaces/TareaBloque_3/reporte_ventas.txt

echo -e "Las ventas anuales son: $"$ventastotales >> /workspaces/TareaBloque_3/reporte_ventas.txt
echo "" >> /workspaces/TareaBloque_3/reporte_ventas.txt

echo "-----------------------------------------------" >> /workspaces/TareaBloque_3/reporte_ventas.txt
producto_mas_vendido=$(cut -d';' -f3 ventas.csv | sort | uniq -c | sort -nr | head -n1) 
echo -e "El producto más vendido es:\n-----------------------------------------------\n $(echo $producto_mas_vendido | awk '{$1=""; print $0}' | sed 's/^ //')" >> /workspaces/TareaBloque_3/reporte_ventas.txt
echo "" >> /workspaces/TareaBloque_3/reporte_ventas.txt

echo "-----------------------------------------------" >> /workspaces/TareaBloque_3/reporte_ventas.txt
cliente_mas_frecuente=$(cut -d';' -f4 ventas.csv | sort | uniq -c | sort -nr | head -n1) 
echo -e "El cliente más frecuente es:\n-----------------------------------------------\n $(echo $cliente_mas_frecuente | awk '{$1=""; print $0}' | sed 's/^ //')" >> /workspaces/TareaBloque_3/reporte_ventas.txt
echo "" >> /workspaces/TareaBloque_3/reporte_ventas.txt

echo "Numero de ventas de la sucursal Escalon:  $(awk -F";" '{print $4}' ventas.csv | grep -o "Escalon" | wc -l)">> /workspaces/TareaBloque_3/reporte_ventas.txt
echo "Numero de ventas de la sucursal Venezuela: $(awk -F";" '{print $4}' ventas.csv | grep -o "Venezuela" | wc -l)" >> /workspaces/TareaBloque_3/reporte_ventas.txt
echo "Numero de ventas de la sucursal Luceiro: $(awk -F";" '{print $4}' ventas.csv | grep -o "Luceiro" | wc -l )">> /workspaces/TareaBloque_3/reporte_ventas.txt
echo "Numero de ventas de la sucursal Centro: $(awk -F";" '{print $4}' ventas.csv | grep -o "Centro" | wc -l )">> /workspaces/TareaBloque_3/reporte_ventas.txt
echo "Numero de ventas de la sucursal La rabida: $(awk -F";" '{print $4}' ventas.csv | grep -o "La rabida" | wc -l )">> /workspaces/TareaBloque_3/reporte_ventas.txt
echo "Numero de ventas de la sucursal La mascota: $(awk -F";" '{print $4}' ventas.csv | grep -o "La mascota" | wc -l)" >> /workspaces/TareaBloque_3/reporte_ventas.txt
