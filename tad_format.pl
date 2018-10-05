#!/usr/bin/perl

# Given two files, a 3D TAD formatted file, i.e. (chr #, stard, end) and a 5D 
# file containing genes, i.e. (chr #, start, end, EnsEMBL ID, description), 
# this script extracts the genes that are on the specified TAD chromosome.
# Genes are extracted based on their position fit into the specified range of 
# the chromosome TAD.

use warnings;
use strict;
use File::Slurp;
use Data::Dumper qw(Dumper);
use Scalar::Util qw(looks_like_number);

# read in the arguments text files
my @TAD  = read_file($ARGV[0]);
my @GENE = read_file($ARGV[1]);

# format everything nicely
# print "\nEnsEMBL ID\t\tDescription\n\n";

# go through each TAD line and get the start site, end site and chromosome number
foreach my $TAD_line (@TAD){
	
	my @curr_TAD 	 = split "\t+", $TAD_line;

	my $curr_TAD_chr = substr($curr_TAD[0], 3, 2);
	my $curr_TAD_x 	 = $curr_TAD[1];
	my $curr_TAD_y 	 = $curr_TAD[2];

	# go through each gene and see if it is located within the TAD
	# this makes the algorithm O(n^2)
	foreach my $GENE_line (@GENE){

		no warnings 'numeric'; # disable numeric warnings that might occur due to eq comparison

		my @curr_GENE     = split "\t+", $GENE_line;

		my $curr_GENE_chr = $curr_GENE[0];
		my $curr_GENE_x   = $curr_GENE[1];
		my $curr_GENE_y   = $curr_GENE[2];

		# if median lies within the TAD site then most of the gene is within that TAD
 		my $median = ($curr_GENE_x + $curr_GENE_y)/2;

 		# case I  - chromosome numbers
 		if(looks_like_number($curr_TAD_chr) && looks_like_number($curr_GENE_chr)){
 			if($median >= $curr_TAD_x && $median <= $curr_TAD_y && $curr_GENE_chr == $curr_TAD_chr){
 				print $curr_GENE[3]."\t".$curr_GENE[1]."\t".$curr_GENE[2]."\t".$curr_GENE_chr."\n";
 			}
 		# case II - chromosome letters
 		} elsif($curr_GENE_chr eq $curr_TAD_chr) {
 			if($median >= $curr_TAD_x && $median <= $curr_TAD_y && $curr_GENE_chr == $curr_TAD_chr){
 				print $curr_GENE[3]."\t".$curr_GENE[1]."\t".$curr_GENE[2]."\t".$curr_GENE_chr."\n";
 			}
 		}
	}
 } 

 
