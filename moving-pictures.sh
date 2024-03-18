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

# imports data file
qiime tools import --type EMPSingleEndSequences --input-path data/sequences --output-path emp-single-end-sequences.qz

# demultiplex
qiime demux emp-single --i-seqs emp-single-end-sequences.qz.qza --m-barcodes-file data/sample-metadata.tsv --m-barcodes-column barcode-sequence --o-per-sample-sequences demux.qza --o-error-correction-details demux-details.qza 

# demux summarize
qiime demux summarize --i-data demux.qza --o-visualization demux.qzv

# data cleanup
qiime dada2 denoise-single --i-demultiplexed-seqs demux.qza --p-trim-left 0 --p-trunc-len 120 --o-representative-sequences rep-seqs-dada2.qza --o-table table-dada2.qza --o-denoising-stats stats-dada2.qza 

# tabulate
qiime metadata tabulate --m-input-file stats-dada2.qza --o-visualization stats-dada2.qzv

# name changes
mv rep-seqs-dada2.qza rep-seqs-qza
mv table-dada2.qza table.qza




