#usr/bin/perl 

use warnings;
use strict;

#Serches through Bed coordinates and only keeps entries in primary Chrs

#Usage: perl 2GRChFiles.pl <<INPUT.chrom.sizes>> <INPUT.bed>> > Output.fa
my $hand1=$ARGV[0];
my $hand2=$ARGV[1];

my %CHR=();

#Load Chrs to keep 
open FILE1, "$hand1" or die "Could not open $hand1: $!\n";
while(my $tmp = <FILE1>){
    $tmp =~ s/[\n\r]//g;
    my @line = split /\t/, $tmp;
    $CHR{$line[0]}=$line[0];
}
close FILE1;

open FILE2, "$hand2" or die "Could not open $hand2: $!\n";
while(my $tmp = <FILE2>){
    $tmp =~ s/[\n\r]//g;
    my @line = split /\t/, $tmp;
    if(exists $CHR{$line[0]}){
         print $tmp."\n";   
    }else{    
        
    }
}
close FILE1;


