#!/bin/bash

if [[ ! -z "$1" ]]
then
	TESTS=$1
else	
	TESTS=$(find ./tests -maxdepth 1 -mindepth 1 -type d -not -name "build" -printf "%P\n")
fi



for TEST in $TESTS
do
	make run -E TEST_NAME=$TEST > /dev/null
	if [[ ! -d "./tests/$TEST/bin" || ! -f "./tests/$TEST/bin/ram.bin" ]]
	then
		echo --------------------------------------------
		echo TEST: $TEST missing reference memory dump
		echo --------------------------------------------
		continue
	fi

	RES=$(diff <(hexdump ./bin/output_ram.bin) <(hexdump ./tests/$TEST/output_ram.bin))

	if [[ -z "$RES" ]]; then
		continue
	fi
	
	echo --------------------------------------------
	echo TEST: $TEST failed \| DIFF:
	echo --------------------------------------------
	echo $RES
	echo --------------------------------------------

	break
done
