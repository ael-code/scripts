#!/bin/bash

min_port=8914
max_port=65535
host_name='portquiz.net'
time_out=6   #in secs
sleep_time=1s

echo -e "\ntesting \"$host_name\""
echo -e "port range: {$min_port,$max_port}\n" 

for (( i=$min_port; i<=$max_port; i++ )) ; do
	curl --silent --connect-timeout $time_out --output /dev/null $host_name:$i
	res=$?
	if [ $res -eq 0 ]; then
		printf '[ OK ] '
		printf '\e[1;92m[ OK ]\e[0m ' 1>&2
		
	else
		printf '[ NO ] '
		printf '\e[1;91m[ NO ]\e[0m ' 1>&2
	fi
	printf 'port: %5d -> %d\n' $i $res
	printf 'port: %5d -> %d\n' $i $res 1>&2
	sleep $sleep_time
done

exit 0
