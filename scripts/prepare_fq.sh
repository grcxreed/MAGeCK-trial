#!/bin/bash

# Define input files and directories
REFERENCE_GENOME="references/reference_genome.fasta"
RAW_READS="raw_data/raw_reads.fastq"
COUNT_MATRIX="count_matrix.txt"
TREATMENT_FILE="treatment.txt"
CONTROL_FILE="control.txt"
OUTPUT_DIR="output/"  # Ensure OUTPUT_DIR is defined
MAGeCK_RESULTS="${OUTPUT_DIR}mageck_results.txt"
FINAL_RESULTS="${OUTPUT_DIR}final_results.csv"

# Step 1: Align raw reads (example using BWA)
echo "Aligning raw reads..."
bwa mem $REFERENCE_GENOME $RAW_READS > ${OUTPUT_DIR}aligned_reads.sam

# Step 2: Convert SAM to BAM and sort
echo "Converting SAM to BAM and sorting..."
samtools view -bS ${OUTPUT_DIR}aligned_reads.sam | samtools sort -o ${OUTPUT_DIR}sorted_reads.bam

# Step 3: Count guides
echo "Counting guides..."
mageck count -i $COUNT_MATRIX -o $OUTPUT_DIR

# Step 4: Perform MAGeCK analysis
echo "Performing MAGeCK analysis..."
mageck test -i $COUNT_MATRIX -t $TREATMENT_FILE -c $CONTROL_FILE -o $OUTPUT_DIR

# Step 5: Process MAGeCK output
echo "Processing MAGeCK output..."
python process_mageck_output.py $MAGeCK_RESULTS $FINAL_RESULTS

echo "MAGeCK analysis and processing completed."

