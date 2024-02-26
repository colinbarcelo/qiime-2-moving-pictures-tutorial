#!/usr/bin/env bash

# Downloads Metadata file
wget \
  -O "/Users/colinbarcelo/Desktop/microbiomemeeting/qiime-2-moving-pictures-tutorial/data/sample-metadata.tsv" \
  "https://data.qiime2.org/2024.2/tutorials/moving-pictures/sample_metadata.tsv"

# Downloads barcode file
  wget \
  -O "/Users/colinbarcelo/Desktop/microbiomemeeting/qiime-2-moving-pictures-tutorial/data/barcodes.fastq.gz" \
  "https://data.qiime2.org/2024.2/tutorials/moving-pictures/emp-single-end-sequences/barcodes.fastq.gz"

#downloads sequences file
wget \
  -O "/Users/colinbarcelo/Desktop/microbiomemeeting/qiime-2-moving-pictures-tutorial/data/sequences.fastq.gz" \
  "https://data.qiime2.org/2024.2/tutorials/moving-pictures/emp-single-end-sequences/sequences.fastq.gz"

#downloads classifier file
wget \
  -O "/Users/colinbarcelo/Desktop/microbiomemeeting/qiime-2-moving-pictures-tutorial/data/gg-13-8-99-515-806-nb-classifier.qza" \
  "https://data.qiime2.org/2024.2/common/gg-13-8-99-515-806-nb-classifier.qza"