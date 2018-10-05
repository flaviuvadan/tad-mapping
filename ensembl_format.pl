#!/usr/bin/perl -w

# PErl script that takes in a list of tab delimited chromosome locations 
# with chromosomal annotations, e.g. chr1 0 150, and converts it to the
# Ensembl's BioMart format, e.g. chromosome:start:end:str

use warnings;
use strict;

foreach my $line (<>){
	my @result =  split(/\s/, $line);
	print $result[0]."\t".($result[1]-1000)."\t".($result[1]+50)."\t".$result[3]."\n";
}