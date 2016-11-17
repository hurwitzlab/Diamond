#!/bin/bash

source ./settings.sh

if [[ ! -d "$FASTA_DIR" ]]; then
    echo "$FASTA_DIR does not exist. Job terminated."
    exit 1
fi

if [[ ! -d "$DIAMOND_DIR" ]]; then
    echo "$DIAMOND_DIR does not exist. You must declare where Diamond is located. Edit DIAMOND_DIR path before you continue. Job terminated."
    exit 1
fi

if [[ ! -d "$DB_DIR" ]]; then
    echo "$DB_DIR does not exist. Directory created."
    mkdir -p "$DB_DIR"
fi

if [[ "$DIAMOND_DB" == "$DB_DIR/swissprot" && ! -f "$DIAMOND_DB.dmnd" ]]; then
    echo "$DIAMOND_DB.dmnd not found. Getting it from imicrobe.us"
    wget -P $DB_DIR/ ftp://ftp.imicrobe.us//diamond-db/swissprot.dmnd
fi

if [[ "$DIAMOND_DB" == "$DB_DIR/swissprot" && ! -f "$ID_DB" ]]; then
    echo "$ID_DB not found. Getting it from imicrobe.us"
    wget -P $DB_DIR/ ftp://ftp.imicrobe.us//diamond-db/swissprot2taxonomy
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
export FASTA_LIST="$FASTA_DIR/list"
pwd
echo "FASTA files to be processed:" `cat $FASTA_LIST`

while read FASTA; do
    export FASTA="$FASTA"
    NUM_FILES=`wc -l $FASTA_LIST | cut -d ' ' -f 1`
    export FILENAME=$(basename $FASTA | cut -d '.' -f 1)    

    JOB_ID1=`qsub -v SCRIPT_DIR,FASTA,FASTA_DIR,DIAMOND_DIR,DIAMOND_DB,OUT_DIR,THREADS,FILENAME,ID_DB -N Diamond_X -e "$STDERR_DIR" -o "$STDOUT_DIR" $SCRIPT_DIR/diamondx.sh`

done < $FASTA_LIST
