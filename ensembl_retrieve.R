#!/usr/bin/env Rscript

# Takes as standard input EnsEMBL IDs, start and end sites and 
# chromosome numbers. Once standard input is detected, it retrieves sequences
# in FASTA format from EnsEMBL using BiomaRt and writes them to standard output.

library(biomaRt)

# establish BioMart DB connection
# use Homo Sapiens as the dataset
mart <- useMart("ensembl", dataset="hsapiens_gene_ensembl") 
input <- file("stdin", open = "r")

current.line <- 1 

while(length(line <- readLines(input, n=1)) > 0){	

	result.list <- list()

	result.list[[current.line]] <- strsplit(line, split="\t")

	M <- unlist(result.list)

	# M[1] EnsEMBL ID, M[2] start, M[3] end, M[4] chromosome number
	seq <- getSequence(id=M[1], 
			   type="ensembl_gene_id", 
			   seqType="gene_flank", 
			   upstream=1000, 
			   mart=mart)
	show(seq)
	current.line <- current.line + 1
}

close(input)
#---------------------------------------------------------------------------------------
