#!/bin/bash

# Define input files and directories
COUNT_MATRIX="processed_data/leukemia_dataset.csv"
OUTPUT_DIR="results/"

# 1. Run MAGeCK count
echo "Counting guides..."
mageck count -i $COUNT_MATRIX -o $OUTPUT_DIR

# 2. Run MAGeCK test
echo "Performing MAGeCK analysis..."
mageck test -i $COUNT_MATRIX -t $TREATMENT_FILE -c $CONTROL_FILE -o $OUTPUT_DIR

echo "MAGeCK analysis completed. Results are in $OUTPUT_DIR"

