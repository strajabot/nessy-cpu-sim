#!/bin/bash

if [[ ! -z "$1" ]]
then
	TESTS=$1
else	
	TESTS=$(find ./tests -maxdepth 1 -mindepth 1 -type d -not -name "build" -printf "%P\n")
fi



for TEST in $TESTS
do
	echo --------------------------------------------
	echo STARTING TEST: $TEST
	echo --------------------------------------------

	RES=
	make default -E TEST_NAME=$TEST > /dev/null
	if [[ -f "./tests/$TEST/output_ram.bin" ]]
	then
		RES=$(diff <(hexdump "tests/$TEST/output_ram.bin" -vC) <(hexdump bin/output_ram.bin -vC)) 
	else 
		echo --------------------------------------------
		echo TEST: $TEST missing reference memory dump
		echo --------------------------------------------
	fi

	if [[ -f "./tests/$TEST/output_reg.dump" ]]
	then
		if [[ ! -z "$RES" ]]
		then
			RES+=$'\n\n'
		fi
		RES+=$(diff ./tests/$TEST/output_reg.dump ./bin/output_reg.dump)
	else 
		echo --------------------------------------------
		echo TEST: $TEST missing reference register dump
		echo --------------------------------------------
	fi

	if [[ -z "$RES" ]]; then
		continue
	fi
	
	echo --------------------------------------------
	echo TEST: $TEST failed \| DIFF:
	echo --------------------------------------------
	echo "$RES"
	echo --------------------------------------------

	break
done
