#!/bin/bash

# Function to remove markdown styling from headings
remove_formatting_from_headings() {
  local input_file="$1"
  local output_file="$2"

  # Check if the input file exists
  if [ ! -f "$input_file" ]; then
    echo "Error: Input file $input_file does not exist."
    exit 1
  fi

  # Process the input file and remove markdown styling from headings
  awk '
  {
    if ($0 ~ /^#+ /) {
      gsub(/\*\*|__|\*|_|`|~~/, "", $0)
    }
    print
  }' "$input_file" > "$output_file"

  echo "Markdown styling has been removed from headings and saved to $output_file."
}

# Check if input and output files are provided
if [ $# -ne 2 ]; then
  echo "Usage: $0 <input_file> <output_file>"
  exit 1
fi

# Remove markdown styling from headings
remove_formatting_from_headings "$1" "$2"