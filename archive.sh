#!/bin/bash

# Check for help flag and arguments
if [[ $# -eq 1 && ($1 == "-h" || $1 == "--help") || $# -ne 2 ]]; then
    echo "Usage: ./archive.sh sourcedir targetdir"
    echo "  backup sourcedir in targetdir as a compressed tar.gz file"
    exit
fi

# Log setup
tlog() { date -u +%FT%TZ; }
log=archive.log
touch $log
ms1_log="INFO : "
ms2_log="ERROR: "

# program run log
tsp_log=$(tlog)
echo $ms1_log$tsp_log" archive script started" >> $log

# Directory checks
if [[ ! -d $1 ]]; then
    echo "Invalid source argument!"
    tsp_log=$(tlog)
    echo $ms2_log$tsp_log" Source directory ("$1") is not valid!" >> $log
    exit
fi

if [[ ! -d $2 ]]; then
    echo "Invalid target argument!"
    tsp_log=$(tlog)
    echo $ms2_log$tsp_log" Target directory ("$2") is not valid!" >> $log
    exit
fi

# Backup file name
tsp_bkp=$(date +%Y)$(date +%m)$(date +%e) # timestamp of backup

shopt -s nullglob # get the new number of backups
files=($2/autobass-bkp_"$tsp_bkp"*)
num_bkp=${#files[@]}        #old
nnm_bkp=$((num_bkp + 1))    #new
shopt -u nullglob

nme_bkp=autobass-bkp_$tsp_bkp"_"$(printf "%06d" $((nnm_bkp))) # name of backup
prs_bkp=$nme_bkp.tar.gz # name of compressed backup

# Backup initiation log
tsp_log=$(tlog)
echo $ms1_log$tsp_log" Backing up from "$1" to "$2 >> $log

# compression
tar --acls --xattrs --warning=no-file-changed -czf $prs_bkp $1
if [ $? -ne 0 ]; then
    tsp_log=$(tlog)
    echo $ms2_log$tsp_log" Backup failed during compression" >> $log
    exit
fi

# transfer (The meat)
rsync -aAX $prs_bkp $2
if [ $? -ne 0 ]; then
    tsp_log=$(tlog)
    echo $ms2_log$tsp_log" Backup failed during transfer" >> $log
    exit
elif [[ $1 != $2 ]]; then
    rm $prs_bkp
fi

# Backup success log
tsp_log=$(tlog)
echo $ms1_log$tsp_log" Backup completed successfully" >> $log
