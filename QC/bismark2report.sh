#!/bin/bash
#SBATCH --job-name="trap"
#SBATCH -N 1
#SBATCH --mem=16G
#SBATCH -p medicine_q
#SBATCH --mail-type="ALL"
#SBATCH -t 128:48:15
#SBATCH -J Mbias
for i in *.deduplicated.bam; do
/gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGBS/Tools/Bismark-0.23.0/bismark2report \
--dir ./output \
--output ${i
-p \
--merge_non_CpG \
--gzip \
--mbias_only \
--no_overlap \
--output /gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGBS/BISMARK/Methylation/Mbias \
$i \
--parallel 8 --buffer_size 72G \
--genome_folder /gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGBS/Reference
done

bismark2report --dir $outP --output ${name}.bismark.report.html --alignment_report $bamP/${name}.input${name}_R1_001_bismark_bt2_PE_report.txt --dedup_report $bamP/${name}.input${name}_R1_001_bismark_bt2_pe.deduplication_report.txt --splitting_report $outP/${name}.input${name}_R1_001_bismark_bt2_pe.deduplicated_splitting_report.txt --mbias_report $outP/${name}.input${name}_R1_001_bismark_bt2_pe.deduplicated.M-bias.txt

P5-1.P5-1_R1_bismark_bt2_pe.deduplicated.M-bias.txt
-rw-rw-r-- 1 ys16b medicine   911 Jun  9 07:17 P5-1.P5-1_R1_bismark_bt2_pe.deduplicated_splitting_report.txt
-rw-rw-r-- 1 ys16b medicine   291 Apr 27 17:52 P5-1.P5-1_R1_bismark_bt2_pe.deduplication_report.txt
-rw-r--r-- 1 ys16b medicine  1986 Apr 26 14:15 P5-1.P5-1_R1_bismark_bt2_PE_report.txt
