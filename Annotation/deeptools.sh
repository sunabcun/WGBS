#!/bin/bash

export baseP=/home/gunjanlab
export homerP=$baseP/program/homer/bin
export inP=$baseP/test/count/BedGraph
export outP=$baseP/test/count/BedGraph/output
export refP=$baseP/ref

for i in *.gz; do
 zcat $i |tail -n +2 - |sort -k1,1 -k2,2n - > ${i%.bedGraph.gz}.sorted.bedGraph
 bedGraphToBigWig ${i%.bedGraph.gz}.sorted.bedGraph $refP/GRCh38.primary_assembly.genome.fa.fai $outP/${i%.bedGraph.gz}.bw
done

for i in in *.bedGraph;do
LC_COLLATE=C sort -k1,1 -k2,2n $i > ${i%.sorted.bedGraph}_sort2.bedGraph
done



computeMatrix reference-point -S ${outP}/${ID1}.input${ID1}_R1_001_bismark_bt2_pe.deduplicated.bw ${outP}/${ID2}.input${ID2}_R1_001_bismark_bt2_pe.deduplicated.bw ${outP}/${ID3}.input${ID3}_R1_001_bismark_bt2_pe.deduplicated.bw -R ../References/transcripts.noexpressed.0.bed --referencePoint TSS -a 2000 -b 2000 --outFileName ${outP}/all.matrix_Genes_noexpressed.0.tab.gz --outFileNameMatrix ${outP}/all.matrix_Genes_noexpressed.0.tab

computeMatrix reference-point -S ${outP}/${ID1}.input${ID1}_R1_001_bismark_bt2_pe.deduplicated.bw ${outP}/${ID2}.input${ID2}_R1_001_bismark_bt2_pe.deduplicated.bw ${outP}/${ID3}.input${ID3}_R1_001_bismark_bt2_pe.deduplicated.bw -R ../References/transcripts.expressed.0.bed --referencePoint TSS -a 2000 -b 2000 --outFileName ${outP}/all.matrix_Genes_expressed.0.tab.gz --outFileNameMatrix ${outP}/all.matrix_Genes_expressed.0.tab


plotHeatmap -m ${outP}/all.matrix_Genes_noexpressed.0.tab.gz -out ${outP}/all.Genes_noexpressed.0.png --colorMap jet --missingDataColor "#FFF6EB" --heatmapHeight 15 --yMin 0 --yMax 100 --plotTitle 'Not expressed genes' --regionsLabel 'genes not expressed'

plotHeatmap -m ${outP}/all.matrix_Genes_expressed.0.tab.gz -out ${outP}/all.Genes_expressed.0.png --colorMap jet --missingDataColor "#FFF6EB" --heatmapHeight 15 --yMin 0 --yMax 100 --plotTitle 'Expressed genes' --regionsLabel 'Genes expressed'


end=`date +%s`
runtime=$((end - start ))
echo $runtime
