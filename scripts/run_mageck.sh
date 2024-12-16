#!/bin/bash

# Define input files and directories
COUNT_MATRIX="processed_data/leukemia_dataset.csv"
OUTPUT_DIR="results/"

# Ensure output directory exists
mkdir -p $OUTPUT_DIR

# 1. Run MAGeCK count
echo "Counting guides..."
mageck count -k $COUNT_MATRIX --output-prefix $OUTPUT_DIR/leukemia

# 2. Run MAGeCK test
echo "Performing MAGeCK analysis..."
mageck test -k $COUNT_MATRIX -t HL60.final,KBM7.final -c HL60.initial,KBM7.initial -n $OUTPUT_DIR/leukemia

# 3. Plot results
echo "Plotting results..."
mageck plot -k $COUNT_MATRIX -g $OUTPUT_DIR/leukemia.gene_summary.txt --output-prefix $OUTPUT_DIR/leukemia

# Final message
echo "MAGeCK analysis completed. Results are in $OUTPUT_DIR"
