#!/bin/bash

source ./functions.sh

#cpu=4
#export cpu

for i in {1..100} ; do

	eval_mt "sleep 8s"

	echo "job ="$i

done


