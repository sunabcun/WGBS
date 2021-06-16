# WGBS

This is the code and files for WGBS analysis. 

# 1. Trimming the fastq files and get QC data.
  - TrimGalore: https://github.com/FelixKrueger/TrimGalore
  - To run this, need to have cutadapt and fastq
  - cutadapt: https://cutadapt.readthedocs.io/en/stable/installation.html
          python3 -m pip install --user --upgrade cutadapt
  - trim/fastqc: trim.sh
  - multiqc: multiqc.sh
  
# 2. BISMARK
A program to map bisulfite treated sequencing reads to a genome of interest and perform methylation calls in a single step. The output can be easily imported into a genome viewer, such as SeqMonk, and enables a researcher to analyse the methylation levels of their samples straight away. It's main features are:
- https://github.com/FelixKrueger/Bismark/releases
- Download index:
  - wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_34/GRCh38.primary_assembly.genome.fa.gz
  - gunzip GRCh38.primary_assembly.genome.fa.gz
- Build index: index.sh
- Align: align.sh
- Deduplication: This command will deduplicate the Bismark alignment BAM file and remove all reads but one which align to the the very same position and in the same orientation. This step is recommended for whole-genome bisulfite samples, but should not be used for reduced representation libraries such as RRBS, amplicon or target enrichment libraries.
  - dedup.sh
- Methylation extractor: check the document from Bismark github since its setting is pretty important (M-bias, --bedGraph, --cytosine_report etx.,)
  - https://github.com/FelixKrueger/Bismark/tree/master/Docs
  - methyl_ext.sh

# 3. DSS
- DSS is an R library performing differntial analysis for count-based sequencing data. It detectes differentially expressed genes (DEGs) from RNA-seq, and differentially methylated loci or regions (DML/DMRs) from bisulfite sequencing (BS-seq). The core of DSS is a new dispersion shrinkage method for estimating the dispersion parameter from Gamma-Poisson or Beta-Binomial distributions.
- http://bioconductor.org/packages/release/bioc/html/DSS.html
- Modify the Bismark bedgraph output for DSS
  - DSS can read in methylation calls in tab delimited files with the columns being “chromosome, pos, count total, count methylated”. 
  - The output (.bismark.cov.gz) from Bismark is in the format of “chromosome, start, end, methylation percentage, count methylated, count unmethylated”.
  - reform.sh
- Run DSS: dss.Rmd
  - I'm still running now but due to the data size it was impossible to run it in the normal HPC with small RAM size(<64GB). It seems that many people have similar issues and it probably needs at least 128GB - 500GB RAM to run WGBS data.
  - This is the DMLfit running discussion: https://github.com/haowulab/DSS/issues/10
  - Definitely needs huge RAM and right setting to run this data properly and may need to split them to chr groups by groups and make several BSobjects for parallel runnings? 
# 4. Annotation
# 1) Homer:
  - to create functional annotation of the regions. 
  - HOMER also can do enrichment analysis using the annotation results.
  - http://homer.ucsd.edu/homer/index.html
  - Annotating Regions in the Genome (annotatePeaks.pl)
    - perform Gene Ontology Analysis, genomic feature association analysis (Genome Ontology), associate peaks with gene expression data, calculate ChIP-Seq Tag densities from different experiments, and find motif occurrences in peaks.  annotatePeaks.pl can also be used to create histograms and heatmaps.

