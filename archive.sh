#!/bin/bash

# Check for help flag and arguments
if [[ $1 == "-h" || $1 == "--help" ]]; then
    echo "Usage: ./archive.sh sourcedir targetdir"
    echo "  backup sourcedir in targetdir"
    exit
elif [[ $# -ne 2 || ! -d $1 || ! -d $2 ]]; then
    echo "Try -h or --help for more information"
    exit
fi

tsp_bkp=$(date +%Y)$(date +%m)$(date +%e) # timestamp of backup

# get the new number of backups
shopt -s nullglob
files=($2/autobass-bkp_"$tsp_bkp"*)
num_bkp=${#files[@]}        #old
nnm_bkp=$((num_bkp + 1))    #new
shopt -u nullglob

nme_bkp=autobass-bkp_$tsp_bkp"_"$(printf "%06d" $((nnm_bkp))) # name of backup

# The meat
if [[ -f .bassignore ]]; then
    rsync -aAXz --exclude-from='.bassignore' $1 $2/$nme_bkp
else
    rsync -aAXz $1 $2/$nme_bkp
fi
