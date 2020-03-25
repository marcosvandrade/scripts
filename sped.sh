#!/bin/bash

PATH=/sbin:/bin:/usr/bin:/usr/sbin

revdate=$(date +"20"%y%m%d)

#ab -n 10 -c 5 http://127.0.0.1:81/sped

wget 127.0.0.1:81/sped -O - -q

valor=$(echo $?)

if [ "$valor" != 0 ]

then

date -s '2014-01-01 00:00:00'

sleep 5

/etc/init.d/tomcat restart

sleep 5

/etc/init.d/apache2 restart

sleep 5

killall slapd

sleep 5

/etc/init.d/slapd restart

sleep 5

/etc/init.d/postgresql-8.3 restart

sleep 5

#ntpdate 200.20.186.75
#ntpdate -u 10.25.96.4
date -s "$(curl -s --head http://google.com | grep ^Date: | sed 's/Date: //g')"

echo "sped down. executado script de reparo em" && date >> /var/log/sped.log;

else exit 0

fi
