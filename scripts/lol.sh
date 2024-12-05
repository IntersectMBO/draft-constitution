#!/bin/bash

# Function to remove trailing whitespace from each line
remove_trailing_whitespace() {
  local input_file="$1"
  local output_file="$2"

  # Check if the input file exists
  if [ ! -f "$input_file" ]; then
    echo "Error: Input file $input_file does not exist."
    exit 1
  fi

  # Process the input file and remove trailing whitespace from each line
  sed 's/[ \t]*$//' "$input_file" > "$output_file"

  echo "Trailing whitespace has been removed and saved to $output_file."
}

# Check if input and output files are provided
if [ $# -ne 2 ]; then
  echo "Usage: $0 <input_file> <output_file>"
  exit 1
fi

# Remove trailing whitespace from each line
remove_trailing_whitespace "$1" "$2"