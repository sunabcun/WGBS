#!/bin/bash

export baseP=/home/gunjanlab
export homerP=$baseP/program/homer/bin
export refP=$baseP/ref

for i in *.gz; do
 zcat $i |tail -n +2 - |sort -k1,1 -k2,2n - > ${i%.bedGraph.gz}.sorted.bedGraph
done
## SOme how sort was not working?
for i in in *.bedGraph;do
LC_COLLATE=C sort -k1,1 -k2,2n $i > ${i%.sorted.bedGraph}_sort2.bedGraph
done

for i in *.bedGraph; do
 bedGraphToBigWig $i $refP/GRCh38.primary_assembly.genome.fa.fai ${i%_sort2.bedGraph}.bw
done
