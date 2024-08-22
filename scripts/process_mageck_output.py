import argparse
import pandas as pd

# usage: python process_mageck_output.py path/to/mageck_results.txt path/to/final_results.csv

def main(input_file, output_file):
    # Read the MAGeCK output file into a DataFrame
    # Adjust delimiter and column names according to your MAGeCK output file
    df = pd.read_csv(input_file, delimiter='\t')

    # Extract and rename columns to match desired output
    # You may need to adjust these column names based on your MAGeCK results
    df_final = pd.DataFrame({
        'sgRNA': df['sgRNA'],
        'Gene': df['Gene'],
        'HL60.initial': df['HL60_initial'],
        'KBM7.initial': df['KBM7_initial'],
        'HL60.final': df['HL60_final'],
        'KBM7.final': df['KBM7_final']
    })

    # Save the DataFrame to a CSV file
    df_final.to_csv(output_file, index=False)

    print(f"Results have been saved to {output_file}")

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Process MAGeCK output file and convert it to a CSV format.')
    parser.add_argument('input_file', type=str, help='Path to the input MAGeCK results file')
    parser.add_argument('output_file', type=str, help='Path to the output CSV file')

    args = parser.parse_args()

    main(args.input_file, args.output_file)

