#usr/bin/perl 

use warnings;
use strict;

#File 1
#chr#	Size
	
#File 2
#chr1    15055250        15060775  	chr1:15055800-15056250;chr1:15057450-15057750

#Usage: perl Permuter.pl <<../hg19.chrom.sizes>> <<INPUT.bed>> <<Chr#>>
#Required Support Files:
##../Homo_sapiens.GRCh37.67.promoter.bed
##../PHAST/Chr#_phastCons_elements.bed

my $hand1=$ARGV[0];
my $hand2=$ARGV[1];
my $CHROMER=$ARGV[2];

my %Chrom_Size=();
#Load Chrome Sizes
open FILE1, "$hand1" or die "Could not open $hand1: $!\n";
while(my $tmp = <FILE1>){
    $tmp =~ s/[\n\r]//g;
    my @line = split /\t/, $tmp;
    $Chrom_Size{$line[0]} = $line[1] - 1;
    }
close FILE1;


#Read In Peaks
##Peaks Array (Use array to preserve sorting!!!)
my @Peaks;
open FILE2, "$hand2" or die "Could not open $hand2: $!\n";
while(my $tmp = <FILE2>){
    $tmp =~ s/[\n\r]//g;
    my @line = split /\t/, $tmp;
    if($line[0] eq lcfirst($CHROMER)){
        push(@Peaks, $tmp)
    }else{
    }
}


#Make the final output for numbers of Phastcons elements 
my $PermOUT = $CHROMER."_10KPeak_core_Perm.bed";
open(my $OUT, '>', $PermOUT) or die "Could not open file $PermOUT $!\n";

#Print header
print $OUT "Elements_In_Peaks\tElements_In_Cores\tElements_Outside_Cores\n";


#Open Permutation loop here
for(my $P = 0; $P<10000; $P++){
    #Output for a Set of permuted Enhancers
    my $PeakOUT = $CHROMER."_PermPeaks.bed";
    open(my $PPerm, '>', $PeakOUT) or die "Could not open file $PeakOUT $!\n";

    #Output for a Set of Permuted Cores
    my $CoreOUT = $CHROMER."_PermCores.bed";
    open(my $CPerm, '>', $CoreOUT) or die "Could not open file $CoreOUT $!\n";

    #Loop through the array of peaks to permute the SET of peaks
    foreach my $i (@Peaks){   
        my @line = split /\t/, $i;
   	
            my $EnhSize=$line[2]-$line[1];
            my $Breaker=1;
   	
            #Pick a peak randomly from the same chromosome that doesn't overlap an exon or promoter
            my $Start=();
            my $End=();
   	
            #Create a permuted peak and test for intersection with Promoters and Exons
            #The while loop will re-permute until a peak with no Promoters or Exons emerges
            while($Breaker > 0){
   		
                    #Modify chromosome end so that peak is entirely within Chromosome
                    my $ModChr = $Chrom_Size{$line[0]}-($EnhSize-1);
                    #Randomly choose permuted Enh peak start
                    $Start = int(rand($ModChr));
                    $End = $Start+$EnhSize;
   		
                    my $TempBED = $CHROMER."_Temp.bed";
                    open(my $RE, '>', $TempBED) or die "Could not open file '$TempBED' $!";
                    print $RE $line[0]."\t".$Start."\t".$End."\n";
		
                    #Intersect Permuted peak with both exon and promoter annotation bed
                    my $Command = "bedtools intersect -wa -u -a ".$CHROMER."_Temp.bed -b ../EXCLUDE_ExPro/".$CHROMER."_Exon_Promoter_COMB_SRT_MERGED.bed | wc -l";
                    my $Over= `$Command`;  		
   		
                    #If both have zero intersections, break the loop and keep the peak
                    if($Over == 0){
                            $Breaker = 0;
                    }else{
                            $Start = undef;
                            $End =undef;
                            system("rm ".$CHROMER."_Temp.bed");
                    } 
            }
            #Get Rid of the temp file anyways
            system("rm ".$CHROMER."_Temp.bed");
   	
            #Print the Enhancer Region to the Enhancer Prem out
            print $PPerm $line[0]."\t".$Start."\t".$End."\n";
   	
            #Load the cores into an array (use array to preserve sort!!!!)
            my @Cores = split ";", $line[3];
            #loop through the array of cores
            foreach my $c (@Cores){ 
                    #split chr and start stop
                    my @Core = split(/[:\-]/, $c);
   		
                    #Create a core at the same relative regions within the permuted enhancer
                    my $CoreLength = $Core[2]-$Core[1];
                    my $CoreStart = ($Core[1]-$line[1]) + $Start;
                    my $CoreEnd = $CoreStart + $CoreLength;
   		
                    #Print the cores to the cores file
                    print $CPerm $Core[0]."\t".$CoreStart."\t".$CoreEnd."\n";
            }  
    }
    close FILE2;

    #Intersect the Permuted Peaks with the Phastcons
    my $CommandA = "bedtools intersect -wa -u -a ../PHAST/".$CHROMER."_phastCons_elements.bed -b ".$CHROMER."_PermPeaks.bed | wc -l";
    my $peakOver = `$CommandA`;
    #Intersect the Permuted Cores with the Phastcons
    my $CommandB = "bedtools intersect -wa -u -a ../PHAST/".$CHROMER."_phastCons_elements.bed -b ".$CHROMER."_PermCores.bed | wc -l";
    my $coreOver = `$CommandB`;

    #Remove EOL
    $peakOver =~ s/[\n\r]//g;
    $coreOver =~ s/[\n\r]//g;

    #Calc Phastcons in peaks - Phastcons out of peaks
    my $OutofCore = $peakOver-$coreOver;

    #Print out All 3 values to final PermFile
    print $OUT $peakOver."\t".$coreOver."\t".$OutofCore."\n";

    ##Get rid of temp files
    system("rm ".$CHROMER."_PermPeaks.bed");
    system("rm ".$CHROMER."_PermCores.bed");

}
#Close Permutation loop here


