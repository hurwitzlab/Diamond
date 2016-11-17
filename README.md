# Diamond
This program utilizes Diamond to generate BlastX data from sequence reads. The default reference database used in this analyses is Swiss-Prot and will automatically be downloaded for use. The Diamond output files (.dout) are in BlastX format and Swiss-Prot ids are extracted from the results (.ids). The Swiss-Prot ids are assigned NCBI taxonomy ids (.taxid). Counts are then generated for both taxonomy (tax.count) and Swiss-Prot ids (id.count). See "Expected Results" section for examples of output files. 

If you want to use a reference other than Swiss-Prot, a Diamond database must be generated.  

    $ diamond makedb --in nr.faa -d nr

This program is optimized for the default settings which uses Swiss-
Prot reference database. If using the default settings, the above command is not necessary. 

Before Start:

A file named 'list' needs to be created in the directory containing your Fasta/q files. The program will read 'list' in order to know what files need to be analyzed. Below is an example of how 'list' could be created:

    $ cd $FASTA_DIR
    $ ls
    file1.fa   file2.fa   file3.fa
    $ ls *.fa > list
    $ cat list
    file1.fa
    file2.fa
    file3.fa

Instructions:

1) Edit the VARIABLE DECLARATION section at the top of submit.sh to include the paths for the FASTA_DIR (location of fasta files and 'list') and DIAMOND_DIR (location of Diamond executable). Other variables can be edited as needed such as THREADS (# of CPUs). PRESETS only need to be changed if you are not using the default Swiss-Prot database.

2) Edit PBS ALLOCATIONS section at the top of diamondx.sh (found in script directory). Here is an example of a complete PBS ALLOCATIONS:

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

Note that group_list, -q standard, and -M email, should be edited to include your group name, queue type, and email respectively. 

3) Execute submit.sh
    
    $ ./submit.sh

Expected Results:

Diamond Blast Output (.dout) -

    [jamesthornton@service1 diamond_out]$ head IonXpress_017.dout
    3932-6  sp|Q99959|PKP2_HUMAN    72.7    33  9   0   106 8   472 504 4.4e-07 53.9
    3932-6  sp|Q05481|ZNF91_HUMAN   80.0    30  6   0   90  1   1159    1188    1.7e-06 52.0
    3932-6  sp|Q7Z5D8|NANGN_HUMAN   76.7    30  7   0   105 16  332 2.2e-06 51.6
    3932-6  sp|Q86V71|ZN429_HUMAN   74.1    27  7   0   97  17  648 674 9.2e-05 46.2
    5017-5  sp|B2RM62|UVRC_PORG3    60.0    40  16  0   5   124 55  94  1.8e-06 52.0
    5017-5  sp|Q7MTG8|UVRC_PORGI    60.0    40  16  0   5   124 54  93  1.8e-06 52.0
    5017-5  sp|Q04EZ7|UVRC_OENOB    55.0    40  18  0   5   124 53  92  1.2e-05 49.3
    5017-5  sp|B3E394|UVRC_GEOLS    58.3    36  15  0   17  124 55  90  4.5e-05 47.4
    5017-5  sp|Q8REL0|UVRC_FUSNN    55.0    40  18  0   5   124 48  87  4.5e-05 47.4
    5017-5  sp|Q14I60|UVRC_FRAT1    55.0    40  18  0   5   124 59  98  2.2e-04 45.1

Swiss-Prot ID list (.ids) - 

    [jamesthornton@service1 diamond_out]$ head IonXpress_017.ids
    PKP2_HUMAN
    ZNF91_HUMAN
    NANGN_HUMAN
    ZN429_HUMAN
    UVRC_PORG3
    UVRC_PORGI
    UVRC_OENOB
    UVRC_GEOLS
    UVRC_FUSNN
    UVRC_FRAT1

Taxid Assignment (.taxid) -

    [jamesthornton@service1 diamond_out]$ head IonXpress_017.taxid
    PKP2_HUMAN = 9606
    ZNF91_HUMAN = 9606
    NANGN_HUMAN = 9606
    ZN429_HUMAN = 9606
    UVRC_PORG3 = 431947
    UVRC_PORGI = 242619
    UVRC_OENOB = 203123
    UVRC_GEOLS = 398767
    UVRC_FUSNN = 190304
    UVRC_FRAT1 = 393115

Taxid Counts (tax.count) -

    [jamesthornton@service1 diamond_out]$ head IonXpress_017_tax.count
    9565    16
    378806  4
    135720  9
    9595    91
    138119  20
    1245    2
    9833    37
    323850  33
    9546    1
    224324  106

Swiss-Prot ID Counts (id.count) -

    [jamesthornton@service1 diamond_out]$ head IonXpress_017_id.count
    TRMFO_RHIL3 2
    GCDH_MACFA  2
    RL16_MYCPA  1
    LOLD_XANOR  1
    XYLG_RALSO  1
    FABZ_VEREI  1
    PANB_NITOC  1
    UVRC_FRATM  2
    SECA_GEOMG  3
    Y1095_PORGI 1

For more information on Diamond see the user manual at http://ab.inf.uni-tuebingen.de/data/software/diamond/download/public/manual.pdf

Diamond publication can be found here: http://www.nature.com/nmeth/journal/v12/n1/full/nmeth.3176.html
