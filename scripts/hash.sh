#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <text-file>"
    exit 1
fi

# Input file
input_file="$1"

# Check if the file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Text file '$input_file' not found!"
    exit 1
fi

# Hash of the input file using b2sum
b2sum_hash=$(b2sum -l 256 "$input_file" | awk '{print $1}')

# Hash of the input file using cardano-cli
cardano_cli_hash=$(cardano-cli hash anchor-data --file-text "$(realpath "$input_file")")

# Output the result
echo "For text file: $input_file"
echo
echo "BLAKE2b-256 hash (using b2sum -l 256):"
echo "$b2sum_hash"
echo
echo "BLAKE2b-256 hash (using cardano-cli hash anchor-data):"
echo "$cardano_cli_hash"