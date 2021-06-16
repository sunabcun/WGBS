#!/bin/bash
#SBATCH --job-name ="trap"
#SBATCH -N 1
#SBATCH --mem=64G
#SBATCH -p medicine_q
#SBATCH --mail-type="ALL"
#SBATCH -t 48:48:15
#SBATCH -J fastqcat

for i in *_L003_R1_001.fastq.gz; do
cat $i ${i%_L003_R1_001.fastq.gz}_L004_R1_001.fastq.gz > ${i%_L003_R1_001.fastq.gz}_R1.fastq.gz

done

for i in *_L003_R2_001.fastq.gz; do
cat $i ${i%_L003_R2_001.fastq.gz}_L004_R2_001.fastq.gz > ${i%_L003_R2_001.fastq.gz}_R2.fastq.gz

done
