#!/bin/bash

declare -a evalPids=()

# run command in parallel. Define evalThreads=x to override default (# processors)
function eval_mt {
	cmd=$1

	while :
	do
		if [[ ${#evalPids[@]} -lt ${evalThreads-$(nproc)} ]]
		then
			eval $cmd & evalPids+=($!)
			break
		fi

		evalPids=($(ps -opid= -p ${evalPids[@]}))
	done
}
