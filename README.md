# AnnotWizR

R shiny apps for annotating SNPs or genomic windows file 

## Dependencies
This app will need the following packages installed:

* rtracklayer

* GenomicRanges

### Install dependencies

For installing dependencies start R (or RStudio) and type:

    source('https://bioconductor.org/biocLite.R')
    biocLite(c('rtracklayer', 'GenomicRanges'))

If you have trouble installing the packages look in the [bioconductor web-page](https://www.bioconductor.org/)
## Run the app

### Input format:

1. **GFF3 file**: gene annotation file. Usually I download them from [Phytozome](https://phytozome.jgi.doe.gov/pz/portal.html)

2. **Position file**: a CSV file with 3 columns named CHR, POS, and P with the chromosome name (CHR), the SNP position (POS), and the p-value (P). I suggest to use a p-value corrected for multiple testing for obtaining statistically significant associations. For Genomic windows file CHR, START, END.


