#!/bin/bash

### Don't edit below this line ###

if (( $# < 1 )) ; then
	echo -e "\nUsage: $0 <report_file>\n"
	exit 1
fi

echo -e "\nFrom \"$1\"\n"

grep -e '^\[\ OK\ \].*' "$1" -o

exit 0
