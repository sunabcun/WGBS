#!/bin/bash
#SBATCH --job-name="trap"
#SBATCH -N 1
#SBATCH --mem=16G
#SBATCH -p genacc_q
#SBATCH --mail-type="ALL"
#SBATCH -t 128:48:15
#SBATCH -J reform
for i in *.bismark.cov.gz; do
zcat $i |awk 'BEGIN{FS="\t";OFS="\t"}{print $1, $2, ($5 + $6), $5}' - > ${i%.bismark.cov.gz}.CpG.counts.txt
done

