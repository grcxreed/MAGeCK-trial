#!/bin/bash

# Define input files and directories
REFERENCE_GENOME="references/GRCh38.p14.fasta"
RAW_READS_DIR="raw_data"
OUTPUT_DIR="processed_data" 

# Create output directory if it doesn't exist
mkdir -p $OUTPUT_DIR

# Step 1: Loop over each raw read file in the raw_data directory
for RAW_READS in $RAW_READS_DIR/*_R1.fastq; do
    # Extract base name of the raw read file (assumes paired-end reads, R1 and R2)
    BASENAME=$(basename $RAW_READS _R1.fastq)
    
    # Step 2: Align raw reads
    echo "Aligning raw reads for $BASENAME"
    bwa mem $REFERENCE_GENOME $RAW_READS_DIR/${BASENAME}_R1.fastq $RAW_READS_DIR/${BASENAME}_R2.fastq > ${OUTPUT_DIR}/${BASENAME}_aligned_reads.sam

    # Step 3: Convert SAM to BAM and sort
    echo "Converting SAM to BAM and sorting for $BASENAME"
    samtools view -bS -F 4 ${OUTPUT_DIR}/${BASENAME}_aligned_reads.sam | samtools sort -o ${OUTPUT_DIR}/${BASENAME}_sorted_reads.bam

    # Optional: Clean up SAM file
    rm ${OUTPUT_DIR}/${BASENAME}_aligned_reads.sam
done

echo "Processing completed."
