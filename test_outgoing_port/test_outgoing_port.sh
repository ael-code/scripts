#!/bin/bash

min_port=9874
max_port=10000
host_name='portquiz.net'
time_out=10   #in secs
sleep_time=0.3s

echo -e "\ntesting \"$host_name\"" 1>&2
echo -e "port range: {$min_port,$max_port}\n" 1>&2

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
