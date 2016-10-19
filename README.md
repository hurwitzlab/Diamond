# Diamond
A simple program that utilizes Diamond to generate BlastX data from sequence reads

Before Start:
A diamond database must be created prior to using this program. 

    $ diamond makedb --in nr.faa -d nr

Instructions:

1) Edit the Variable Declaration section at the top of submit.sh to include the correct paths.
2) Execute submit.sh
    
    $ ./submit.sh

For more information on Diamond see the user manual at http://ab.inf.uni-tuebingen.de/data/software/diamond/download/public/manual.pdf
Diamond publication can be found here: http://www.nature.com/nmeth/journal/v12/n1/full/nmeth.3176.html
