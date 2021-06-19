#!/bin/bash
ID1=`head -n 1 allsamples.txt |tail -1 | tr -d '\r'`
ID2=`head -n 2 allsamples.txt |tail -1 | tr -d '\r'`
ID3=`head -n 3 allsamples.txt |tail -1 | tr -d '\r'`
ID4=`head -n 4 allsamples.txt |tail -1 | tr -d '\r'`
ID5=`head -n 5 allsamples.txt |tail -1 | tr -d '\r'`
ID6=`head -n 6 allsamples.txt |tail -1 | tr -d '\r'`
ID7=`head -n 7 allsamples.txt |tail -1 | tr -d '\r'`
ID8=`head -n 8 allsamples.txt |tail -1 | tr -d '\r'`
ID9=`head -n 9 allsamples.txt |tail -1 | tr -d '\r'`
ID10=`head -n 10 allsamples.txt |tail -1 | tr -d '\r'`
ID11=`head -n 11 allsamples.txt |tail -1 | tr -d '\r'`
ID12=`head -n 12 allsamples.txt |tail -1 | tr -d '\r'`
other="_R1_bismark_bt2_pe.deduplicated.bw"
echo ${ID11}${other}

#less expressed genes
computeMatrix reference-point -S ${ID1}${other} ${ID2}${other} ${ID3}${other} \
${ID4}${other} ${ID5}${other} ${ID6}${other} \
${ID7}${other} ${ID8}${other} ${ID9}${other} \
${ID10}${other} ${ID11}${other} ${ID12}${other} \
-R keloid_low_expressed_gene.0.bed \
--referencePoint TSS \
-a 2000 -b 2000 \
--outFileName all.matrix_Genes_noexpressed.0.tab.gz \
--outFileNameMatrix all.matrix_Genes_noexpressed.0.tab

#Highly expressed genes
computeMatrix reference-point -S ${ID1}${other} ${ID2}${other} ${ID3}${other} \
${ID4}${other} ${ID5}${other} ${ID6}${other} \
${ID7}${other} ${ID8}${other} ${ID9}${other} \
${ID10}${other} ${ID11}${other} ${ID12}${other} \
-R keloid_expressed_gene.0.bed \
--referencePoint TSS \
-a 2000 -b 2000 \
--outFileName all.matrix_Genes_expressed.0.tab.gz \
--outFileNameMatrix all.matrix_Genes_expressed.0.tab

plotHeatmap -m all.matrix_Genes_noexpressed.0.tab.gz \
-out all.Genes_noexpressed.0.png \
--colorMap jet --missingDataColor "#FFF6EB" --heatmapHeight 15 \
--yMin 0 --yMax 100 --plotTitle 'Low expressed genes' \
--regionsLabel 'genes low expressed'

plotHeatmap -m all.matrix_Genes_expressed.0.tab.gz \
-out all.Genes_expressed.0.png --colorMap jet \
--missingDataColor "#FFF6EB" --heatmapHeight 15 --yMin 0 --yMax 100 \
--plotTitle 'Expressed genes' --regionsLabel 'Genes expressed'
