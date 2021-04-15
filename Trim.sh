#!/bin/bash
#SBATCH --job-name="trap"
#SBATCH -N 3
#SBATCH --mem=16G
#SBATCH -p medicine_q
#SBATCH --mail-type="ALL"
#SBATCH -t 48:48:15
#SBATCH -J Trim
module load anaconda3.7.3

/gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/Practice/WGBS/tools/TrimGalore-0.6.6/trim_galore --illumina --trim-n --paired --cores 4 --fastqc -o /gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/Practice/WGBS/QCdata *.fastq.gz
