#!/bin/bash

export baseP=/home/gunjanlab/
export homerP=$baseP/program/homer/bin
export inP=$baseP/test/count/BedGraph
export outP=$baseP/test/count/BedGraph/output
export refP = $baseP/ref


if [ ! -d "${outP}" ]; then
   mkdir -p ${outP}
fi

conda activate my_env

ID1=`head -n 1 allsamples.txt |tail -9`
ID2=`head -n 2 allsamples.txt |tail -10`
ID3=`head -n 3 allsamples.txt |tail -11`
ID4=`head -n 4 allsamples.txt |tail -12`
ID5=`head -n 5 allsamples.txt |tail -13`
ID6=`head -n 6 allsamples.txt |tail -14`
ID7=`head -n 7 allsamples.txt |tail -15`
ID8=`head -n 8 allsamples.txt |tail -16`
ID9=`head -n 9 allsamples.txt |tail -17`
ID10=`head -n 10 allsamples.txt |tail -18`
ID11=`head -n 11 allsamples.txt |tail -19`
ID12=`head -n 12 allsamples.txt |tail -20`

HDF1-1.HDF1-1_R1_bismark_bt2_pe.deduplicated.bedGraph.gz
for name in ${ID1} ${ID2} ${ID3} ${ID4} ${ID5} ${ID6} ${ID7} ${ID8} ${ID9} ${ID10} ${ID11} ${ID12}
do
  zcat ${inP}/${name}.${name}_R1_bismark_bt2_pe.deduplicated.bedGraph.gz |tail -n +2 - |sort -k1,1 -k2,2n - > ${inP}/${name}.input${name}_R1_bismark_bt2_pe.deduplicated.sorted.bedGraph

  bedGraphToBigWig ${inP}/${name}.${name}_R1_bismark_bt2_pe.deduplicated.sorted.bedGraph $refP/GRCh38.primary_assembly.genome.fa.fai ${outP}/${name}.${name}_R1_bismark_bt2_pe.deduplicated.bw

done

computeMatrix reference-point -S ${outP}/${ID1}.input${ID1}_R1_001_bismark_bt2_pe.deduplicated.bw ${outP}/${ID2}.input${ID2}_R1_001_bismark_bt2_pe.deduplicated.bw ${outP}/${ID3}.input${ID3}_R1_001_bismark_bt2_pe.deduplicated.bw -R ../References/transcripts.noexpressed.0.bed --referencePoint TSS -a 2000 -b 2000 --outFileName ${outP}/all.matrix_Genes_noexpressed.0.tab.gz --outFileNameMatrix ${outP}/all.matrix_Genes_noexpressed.0.tab

computeMatrix reference-point -S ${outP}/${ID1}.input${ID1}_R1_001_bismark_bt2_pe.deduplicated.bw ${outP}/${ID2}.input${ID2}_R1_001_bismark_bt2_pe.deduplicated.bw ${outP}/${ID3}.input${ID3}_R1_001_bismark_bt2_pe.deduplicated.bw -R ../References/transcripts.expressed.0.bed --referencePoint TSS -a 2000 -b 2000 --outFileName ${outP}/all.matrix_Genes_expressed.0.tab.gz --outFileNameMatrix ${outP}/all.matrix_Genes_expressed.0.tab


plotHeatmap -m ${outP}/all.matrix_Genes_noexpressed.0.tab.gz -out ${outP}/all.Genes_noexpressed.0.png --colorMap jet --missingDataColor "#FFF6EB" --heatmapHeight 15 --yMin 0 --yMax 100 --plotTitle 'Not expressed genes' --regionsLabel 'genes not expressed'

plotHeatmap -m ${outP}/all.matrix_Genes_expressed.0.tab.gz -out ${outP}/all.Genes_expressed.0.png --colorMap jet --missingDataColor "#FFF6EB" --heatmapHeight 15 --yMin 0 --yMax 100 --plotTitle 'Expressed genes' --regionsLabel 'Genes expressed'


end=`date +%s`
runtime=$((end - start ))
echo $runtime
