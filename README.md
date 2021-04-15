# WGBS

This is the code and files for WGBS analysis. 

1. Trimming the fastq files and get QC data.
  - TrimGalore: https://github.com/FelixKrueger/TrimGalore
  - To run this, need to have cutadapt and fastq
  - cutadapt: https://cutadapt.readthedocs.io/en/stable/installation.html
          python3 -m pip install --user --upgrade cutadapt

2. BISCUIT: is a utility for analyzing sodium bisulfite conversion-based DNA methylation/modification data. It was written to perform alignment, DNA methylation and mutation calling, and allele specific methylation from bisulfite sequencing data.
  - BISCUIT: https://github.com/huishenlab/biscuit
  - Installation(Download precompiled Binaries, since HPC doesn't allow many compilation dependent libraries):
    $ curl -OL $(curl -s https://api.github.com/repos/huishenlab/biscuit/releases/latest |
    grep browser_download_url | grep linux_amd64 | cut -d '"' -f 4)
    $ chmod +x biscuit_*
