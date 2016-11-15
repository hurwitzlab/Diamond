#!/bin/bash

#PBS -W group_list=bh_class
#PBS -q windfall
#PBS -l jobtype=cluster_only
#PBS -l select=1:ncpus=2:mem=4gb
#PBS -l walltime=24:00:00
#PBS -l cput=24:00:00
#PBS -l place=pack:shared
#PBS -M jamesthornton@email.arizona.edu
#PBS -m bea

module load perl

echo “my job_id is: ${PBS_JOBID}”

ID_DIR="/rsgrps/bhurwitz/jetjr/neutropenicfever/diamond_out"
export $ID_DIR
cd $ID_DIR

for file in `cat list`; do
    ./taxid_count.pl6 $file 0 > $file.protcount
done
