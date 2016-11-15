#!/bin/bash

source ./settings.sh

if [[ ! -d "$FASTA_DIR" ]]; then
    echo "$FASTA_DIR does not exist. Job terminated."
    exit 1
fi

if [[ ! -f "$DIAMOND_DB.dmnd" ]]; then
    echo "$DIAMOND_DB.dmd does not exist. Edit DIAMOND_DB path and try again. Job terminated."
    exit 1
fi

if [[ ! -d "$DIAMOND_DIR" ]]; then
    echo "$DIAMOND_DIR does not exist. You must declare where Diamond is located. Edit DIAMOND_DIR path before you continue. Job terminated."
    exit 1
fi

if [[ ! -d "$OUT_DIR" ]]; then
    echo "$OUT_DIR does not exist. I made it for you and will place diamond output there."
    mkdir -p "$OUT_DIR"
fi

if [[ ! -d "$STDERR_DIR" ]]; then
    echo "$STDERR_DIR does not exist. Directory created for standard error."
    mkdir -p "$STDERR_DIR"
fi

if [[ ! -d "$STDOUT_DIR" ]]; then
    echo "$STDOUT_DIR does not exist. Directory created for standard out."
    mkdir -p "$STDOUT_DIR"
fi

cd "$FASTA_DIR"
export FASTA_LIST="$FASTA_DIR/fasta-list"
pwd
ls *.fasta > $FASTA_LIST
echo "FASTA files to be processed:" `cat $FASTA_LIST`

while read FASTA; do
    export FASTA="$FASTA"
    NUM_FILES=`wc -l $FASTA_LIST | cut -d ' ' -f 1`
    export FILENAME=$(basename $FASTA | cut -d '.' -f 1)    

    JOB_ID1=`qsub -v SCRIPT_DIR,FASTA,FASTA_DIR,DIAMOND_DIR,DIAMOND_DB,OUT_DIR,THREADS,FILENAME,ID_DB -N Diamond_X -e "$STDERR_DIR" -o "$STDOUT_DIR" $SCRIPT_DIR/diamondx.sh`

done < $FASTA_LIST
