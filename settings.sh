#--------- VARIABLE DECLARATIONS ----------
#Current working directory
export CWD=$PWD

#Script directory
export SCRIPT_DIR="$CWD/scripts"

#Fasta directory containing files to run Diamond
export FASTA_DIR="/edit/this/path"

#Directory containing Diamond executable
export DIAMOND_DIR="/edit/this/path"

#Directory and basename of Diamond database
export DIAMOND_DB="$CWD/diamonddb/swissprot"

#Swissprot ID to Taxonomy file
export ID_DB="$CWD/diamonddb/swissprot2taxonomy"
 
#Output directory
export OUT_DIR="$CWD/diamond_out"

#Number of CPU Threads
export THREADS="4"

#Standard Out/Error
export STDERR_DIR="$CWD/std-err"
export STDOUT_DIR="$CWD/std-out"
# ------------------------------------------
