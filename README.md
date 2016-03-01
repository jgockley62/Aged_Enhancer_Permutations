###Permutation Analysis 
####Available at Github: github.com/jgockley62/Aged\_Enhancer\_Permutations

Same size peaks with cores located at corresponding positions were permuted randomly within the same chromosome. Permutions constraints prevented permuted peaks from overlapping annotated promoters. Exonic regions defined by [Ensembl release 67](ftp://ftp.ensembl.org/pub/release-67/gtf/homo_sapiens/). Promoters were defined as the region 1Kb upstream of Ensembl release 67 transcription start sites (TSS) to the actual TSS. 

Every induvidually permuted set of enhancers and cores were intersected with the repective chromosome's [PhastCons element](ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/phastCons46way/vertebrate/) annotation. 10,000 permutations were preformed in this manner with the script: [permuter.pl](https://github.com/jgockley62/Aged_Enhancer_Permutations/blob/master/Permuter.pl). Permutations were run on induvidual chromosomes for each age group. Permutations were complied across chromosomes for each age group with in R and the resulting distributuions were ploted. RCode is deposited in [RCode.R](https://github.com/jgockley62/Aged_Enhancer_Permutations/blob/master/RCode.R).