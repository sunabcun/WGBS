#!/bin/bash
#SBATCH --job-name="trap"
#SBATCH -N 1
#SBATCH --mem=16G
#SBATCH -p medicine_q
#SBATCH --mail-type="ALL"
#SBATCH -t 128:48:15
#SBATCH -J BISMARK2REPORT

for i in *_PE_report.txt; do
/gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGBS/Tools/Bismark-0.23.0/bismark2report \
--dir ./output \
--output ${i%_PE_report.txt}.bismark.report.html \
--alignment_report $i \
--dedup_report ${i%_PE_report.txt}_pe.deduplication_report.txt \
--splitting_report ${i%_PE_report.txt}_pe.deduplicated_splitting_report.txt \
--mbias_report ${i%_PE_report.txt}_pe.deduplicated.M-bias.txt
done
