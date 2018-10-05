# tad-mapping
Topologically-associating domains (TADs) are self-interacting genome regions.
These genomic regions physically interact with each other more frequently than
with regions outside these regions. Because of their self-interacting nature, 
it has been hypothesized they function in transcription regulation. 

`mapping.sh` is a script that will get genes that fit a given TAD region. The
script will first take your predefined TAD (chromosome #, start index, end 
index), will extract genes (chromosome #, start index, end index, EnsEMBL ID, 
description) that fit into the TAD region, pull them from BioMart, and format
them into FASTA. 

## Usage
Requirement: 
	- OSX or Linux system. 

Invoke (in Terminal):
	.mapping.sh <TAD> <GENES>
