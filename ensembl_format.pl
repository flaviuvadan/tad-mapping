#!/usr/bin/perl -w

# Takes in a list of tab delimited chromosome locations 
# with chromosomal annotations, e.g. chr1 0 150, and converts it to the
# Ensembl's BioMart format, e.g. chromosome:start:end:str

use warnings;
use strict;

foreach my $line (<>){
	my @result =  split(/\s/, $line);
	# we take 1000 to the left and 50 to the right of the chromosome
	# for future promoter localization using Clover and MEME-ChIP
	print $result[0]."\t".($result[1]-1000)."\t".($result[1]+50)."\t".$result[3]."\n";
}
