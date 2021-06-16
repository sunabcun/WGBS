#!/bin/bash
#SBATCH --job-name="trap"
#SBATCH -N 1
#SBATCH --mem=16G
#SBATCH -p medicine_q
#SBATCH --mail-type="ALL"
#SBATCH -t 348:48:15
#SBATCH -J Bismark_align
for i in *_R1.fq.gz; do

/gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGBS/Tools/Bismark-0.23.0/bismark \
--bowtie2 -p 4 \
--output_dir ./ \
--rg_tag --rg_id ${i%_R1.fq.gz} \
--rg_sample ${i%_R1.fq.gz} \
--prefix ${i%_R1.fq.gz} \
--unmapped --phred33-quals \
--fastq \
--genome_folder /gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGBS/Reference \
-1 $i -2 ${i%_R1.fq.gz}_R2.fq.gz > ./${i%_R1.fq.gz}.bismark.out
done
