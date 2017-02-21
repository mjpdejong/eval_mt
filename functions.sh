#!/bin/bash

eval_mt () {

	if [ -z ${cpu+x} ]; then cpu=`nproc` ; fi

	export cmd=$1

	while : ; do

		activ=()

		for pid in ${pids[@]} ; do

			activ+=(`ps -p $pid | grep -o $pid`) ; done

		pids=(${activ[@]})

		if [ ${#pids[@]} -lt $cpu ] ; then

			eval $cmd & pids+=($!) && export pids
			break ; fi

	done ; }

