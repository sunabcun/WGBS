export baseP=/home/gunjanlab/
export homerP=$baseP/program/homer/bin
export outP=$baseP/test/count

tail -n +2 $outP/Differential_methylation_regions_KeloidsvsHDFs.txt |awk 'BEGIN{FS="\t";OFS="\t"}{print $1, $2 - 1, $3}' - |sort -k1,1 -k2,2n - > $outP/Differential_methylation_regions_KeloidsvsHDFs.bed


annotatePeaks.pl $outP/Differential_methylation_regions_KeloidsvsHDFs.bed hg38 -raw -gid -annStats $outP/homer.stats -go $outP/GO > $outP/Differential_methylation_regions_KeloidsvsHDFs.anno.txt

