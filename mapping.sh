#!/bin/bash 

# Given two files, a 3D TAD formatted file, i.e. (chr #, stard, end) and a 5D 
# file containing genes, i.e. (chr #, start, end, EnsEMBL ID, description), 
# this script extracts the genes that are on the specified TAD chromosome.
# The script invokes TAD_format.pl (see doc). Once genes are extracted, the 
# script formats them in EnsEMBL format to be passed to BioMart. 

./tad_format.pl $1 $2 			 	| \
./ensembl_format.pl   			 	| \
sort -buk1,1          			 	| \ # sort unique EnsEMBL IDs
./ensembl_retrieve.R  			 	| \
./fasta_format.pl	  			| \
./fasta_format_remove_duplicates.pl
