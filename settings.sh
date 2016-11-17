#--------- VARIABLE DECLARATIONS ----------
#Current working directory
export CWD=$PWD

#Script directory
export SCRIPT_DIR="$CWD/scripts"

#Fasta directory containing files to run Diamond
export FASTA_DIR="/rsgrps/bhurwitz/jetjr/practice/reads"

#Directory containing Diamond executable
export DIAMOND_DIR="/rsgrps/bhurwitz/hurwitzlab/bin"
 
#Output directory
export OUT_DIR="$CWD/diamond_out"

#Number of CPU Threads
export THREADS="4"

#Standard Out/Error
export STDERR_DIR="$CWD/std-err"
export STDOUT_DIR="$CWD/std-out"

#------------------ PRESETS -----------------

#Directory containing database and Swissport ID to Taxonomy file
export DB_DIR="$CWD/diamond_db"

#Directory and basename of Diamond database
export DIAMOND_DB="$DB_DIR/swissprot"

#Swissprot ID to Taxonomy file
export ID_DB="$DB_DIR/swissprot2taxonomy"
