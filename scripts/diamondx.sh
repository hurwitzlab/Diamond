#!/bin/bash

#---- PBS ALLOCATIONS ----

#PBS -W group_list=bhurwitz
#PBS -q standard
#PBS -l select=1:ncpus=4:mem=15gb
#PBS -l pvmem=12gb
#PBS -l place=pack:shared
#PBS -l walltime=24:00:00
#PBS -l cput=24:00:00
#PBS -M jamesthornton@email.arizona.edu
#PBS -m bea


diamond blastx -p $THREADS -d $DIAMOND_DB -q $FASTA_DIR/$FASTA -o $OUT_DIR/$FILENAME.dout

cat $OUT_DIR/$FILENAME.dout | awk 'BEGIN{FS="\t"}{print $2}' | cut -d '|' -f 3  > $OUT_DIR/$FILENAME.ids

cd "$SCRIPT_DIR"

./diamond_parser.pl6 --db=$ID_DB --ids=$OUT_DIR/$FILENAME.ids --out=$OUT_DIR/$FILENAME.taxid

./taxid_count.pl6 $OUT_DIR/$FILENAME.taxid 1 > $OUT_DIR/$FILENAME"_tax.count" 

./taxid_count.pl6 $OUT_DIR/$FILENAME.taxid 0 > $OUT_DIR/$FILENAME"_id.count" 
