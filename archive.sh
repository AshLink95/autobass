#!/bin/bash

if [[ $1 -eq "-h" || $1 -eq "--help" || $# -ne 2 ]]; then
    echo "Usage: ./archive.sh sourcedir targetdir"
    echo "  backup sourcedir in targetdir"
    exit
fi

tsp_bkp=$(date +%Y)$(date +%m)$(date +%e)                  # timestamp of backup
num_bkp=$(f=autobass-bkp_$tsp_bkp*; echo ${#f[@]})   # number of existing backups
nme_bkp=autobass-bkp_$tsp_bkp"_"$(printf "%06d" $((num_bkp+1))) # name of backup
echo $nme_bkp

rsync $1 $2/$nme_bkp
