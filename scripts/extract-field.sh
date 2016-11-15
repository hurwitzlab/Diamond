#!/bin/bash
#CUSTOM PARSING OF DIAMOND BLASTX OUTPUT

set -u

export FASTA_LIST="$PWD/fasta-list"
ls *.dout > $FASTA_LIST

while read FILE; do
    cat $FILE | awk 'BEGIN{FS="\t"}{print $2}' | cut -d '|' -f 3  > $(basename $FILE.ids) 
done < $FASTA_LIST
