#!/bin/bash

# Function to restrict the number of characters per line to 80
restrict_chars_per_line() {
  local input_file="$1"
  local output_file="$2"

  # Check if the input file exists
  if [ ! -f "$input_file" ]; then
    echo "Error: Input file $input_file does not exist."
    exit 1
  fi

  # Process the input file and restrict lines to 80 characters
  fold -s -w 80 "$input_file" > "$output_file"

  echo "Lines have been restricted to 80 characters and saved to $output_file."
}

# Check if input and output files are provided
if [ $# -ne 2 ]; then
  echo "Usage: $0 <input_file> <output_file>"
  exit 1
fi

# Restrict the number of characters per line
restrict_chars_per_line "$1" "$2"