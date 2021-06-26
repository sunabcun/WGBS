#!/bin/bash
#SBATCH --job-name="trap"
#SBATCH -N 1
#SBATCH --mem=16G
#SBATCH -p medicine_q
#SBATCH --mail-type="ALL"
#SBATCH -t 128:48:15
#SBATCH -J Mbias
for i in *.deduplicated.bam; do
/gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGBS/Tools/Bismark-0.23.0/bismark_methylation_extracto$
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

