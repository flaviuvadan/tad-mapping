#!/usr/bin/perl

# This script takes in FASTA formatted sequences from FASTA_format and 
# removes duplicated sequences. Duplicated sequences occur due to 
# the way getSequences() returns EnsEMBL sequences in R. Script is 
# adapted from https://www.biostars.org/p/143617/ with original
# author: biolab 

#---------------------------------------------------------------------------------------
use strict;
use warnings;
#---------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------
my (%id2seq, %seen);
my ($key, $duplicate);
#---------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------
while(<>) {
    chomp;
    if($_ =~ /^>(.+)/){
        $key = $1;
        if (exists $seen{$key}) {
            $duplicate  = 1;
        } else {
            $seen{$key} = 1;
            $duplicate  = 0;
        }
    } else {
        ($duplicate == 1) ? (next) : ($id2seq{$key} .= $_);
    }
}

foreach(keys %id2seq) {
    print join("\n",">".$_,$id2seq{$_}),"\n";
}
#---------------------------------------------------------------------------------------