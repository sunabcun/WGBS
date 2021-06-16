#!/bin/bash
#SBATCH --job-name="trap"
#SBATCH -N 1
#SBATCH --mem=16G
#SBATCH -p genacc_q
#SBATCH --mail-type="ALL"
#SBATCH -t 128:48:15
#SBATCH -J Methylaation_extractor
for i in *.deduplicated.bam; do
/gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGBS/Tools/Bismark-0.23.0/bismark_methylation_extractor \
-p \
--merge_non_CpG \
--gzip \
--mbias_off \
--no_overlap \
--output /gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGBS/BISMARK/Methylation/${i%.deduplicated.bam} \
$i \
--parallel 8 --buffer_size 72G \
--genome_folder /gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGBS/Reference
done
