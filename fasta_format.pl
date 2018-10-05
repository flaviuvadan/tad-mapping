#!/usr/bin/perl

# This script takes in the result from the R script EnsEMBL_retrieve and 
# formats the input into FASTA using the EnsEMBL ID reported by 
# EnsEMBL_retrieve

use warnings;
use strict;

my $sequence = '';
my $ID	     = '';

while(<>){
	if($_ =~ /1\s[ATGC]{1000}/){
		$sequence = substr($_, 2);;
	}

	if($_ =~ /1\sENS/){
		$ID = substr($_, 2);
	}
	print ">$ID$sequence";
}
#---------------------------------------------------------------------------------------
