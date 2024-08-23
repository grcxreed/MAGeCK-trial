#!/bin/bash

# Define input files and directories
REFERENCE_GENOME="references/GRCh38.p14.fasta"
RAW_READS="raw_data"
OUTPUT_DIR="processed_data" 

# Step 1: Align raw reads
echo "Aligning raw reads" 
bwa mem $REFERENCE_GENOME $RAW_READS > ${OUTPUT_DIR}aligned_reads.sam

# Step 2: Convert SAM to BAM and sort
echo "Converting SAM to BAM and sorting"
samtools view -bS ${OUTPUT_DIR}aligned_reads.sam | samtools sort -o ${OUTPUT_DIR}sorted_reads.bam

