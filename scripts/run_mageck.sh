#!/bin/bash

# Define input files and directories
COUNT_MATRIX="processed_data/leukemia_dataset.csv"
OUTPUT_DIR="results/"

# 1. Run MAGeCK count
echo "Counting guides..."
mageck count -k processed_data/leukemia_dataset.csv --output-prefix results/leukemia

# 2. Run MAGeCK test
echo "Performing MAGeCK analysis..."
mageck test -k processed_data/leukemia_dataset.csv  -t HL60.final,KBM7.final -c HL60.initial,KBM7.initial -n results/leukemia

echo "MAGeCK analysis completed. Results are in $OUTPUT_DIR"

