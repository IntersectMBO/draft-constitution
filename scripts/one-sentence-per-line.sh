#!/bin/bash

# Function to place each sentence on a new line
split_sentences() {
  local input_file="$1"
  local output_file="$2"

  # Read the input file and split sentences based on periods, ignoring lines that start with #
  awk '{
    if ($0 ~ /^#/) {
      print $0
    } else {
      gsub(/(\.) +/, ".\n")
      print
    }
  }' "$input_file" > "$output_file"
}

# Check if input and output files are provided
if [ $# -ne 2 ]; then
  echo "Usage: $0 <input_file> <output_file>"
  exit 1
fi

# Split sentences in the input file and write to the output file
split_sentences "$1" "$2"

echo "Sentences have been split and written to $2."