#!/usr/local/bin/bash
# check if memcached is running #


PORT=""
RAM=""

if ps ax | grep memcached | grep -v grep > /dev/null
then
	echo "memcached is running" > /dev/null
else
	echo "`date` - died without any special reason XD" >> $HOME/memcached.log
	/usr/local/bin/memcached -l 127.0.0.1 -p $PORT -m $RAM -d
fi
