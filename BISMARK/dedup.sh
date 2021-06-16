#!/bin/bash
#SBATCH --job-name="trap"
#SBATCH -N 1
#SBATCH --mem=32G
#SBATCH -p medicine_q
#SBATCH --mail-type="ALL"
#SBATCH -t 348:48:15
#SBATCH -J Bismark_deduplicate
for i in *.bam; do
/gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGBS/Tools/Bismark-0.23.0/deduplicate_bismark \
--bam --paired $i \
--samtools_path /gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/HISAT2/Tools/samtools-1.11
done
