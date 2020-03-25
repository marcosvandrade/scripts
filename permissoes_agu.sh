#!/bin/bash

PATH=/sbin:/bin:/usr/bin:/usr/sbin

hoje=$(date +%d"/"%m"/20"%y)
revdate=$(date +"20"%y%m%d)

killall -HUP nmbd

/etc/init.d/samba stop

valor=$(echo $?)

if [ "$valor" = 0 ]

then

#echo "" >> /var/log/samba/permissoes/permissoes_$revdate.log

#date >> /var/log/samba/permissoes/permissoes_$revdate.log

#echo "" >> /var/log/samba/permissoes/permissoes_$revdate.log

#echo "" >> /var/log/samba/permissoes/permissoes_$revdate.log

#echo "###################################################################" >> /var/log/samba/permissoes/permissoes_$revdate.log

chown -R root.corat /media/veracrypt1/CORAT
chown -R root.corat /media/veracrypt1/*
chmod -R 2770 /media/veracrypt1
chmod -R 2770 /media/veracrypt1/*

chown -R marcos.marcos /media/veracrypt1/Marcos
chown -R root.corat /media/veracrypt1/Marcos/*
chmod -R 2770 /media/veracrypt1/Marcos
chmod -R 2770 /media/veracrypt1/Marcos/*

/etc/init.d/samba start

else exit 0

#echo "falha no samba" > /var/log/samba/permissoes/permissoes_$revdate.log

fi
