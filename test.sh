#!/bin/bash

source ./functions.sh

#evalThreads=8

for i in {1..100} ; do

	eval_mt "sleep 8s"

	echo "job ="$i

done


