#!/bin/bash

# Function to check line length
check_line_length() {
  local error_found=0
  local line_number=0
  while IFS= read -r line || [ -n "$line" ]; do
    line_number=$((line_number + 1))
    if [ ${#line} -gt 80 ]; then
      echo "Error: Line $line_number exceeds 80 characters."
      error_found=1
    fi
  done < "$1"
  if [ $error_found -eq 1 ]; then
    return 1
  fi
  echo "Line length check passed."
  return 0
}

# Function to check sentences per line and capitalization
check_sentences() {
  local error_found=0
  local line_number=0
  while IFS= read -r line || [ -n "$line" ]; do
    line_number=$((line_number + 1))
    if [[ ! "$line" =~ ^[A-Z] ]]; then
      echo "Error: Line $line_number does not start with a capital letter."
      error_found=1
    fi
    if [[ $(echo "$line" | grep -o '\.' | wc -l) -gt 1 ]]; then
      echo "Error: Line $line_number contains more than one sentence."
      error_found=1
    fi
  done < "$1"
  if [ $error_found -eq 1 ]; then
    return 1
  fi
  echo "Sentence and capitalization check passed."
  return 0
}

# Function to check file name pattern
check_file_name() {
  filename=$(basename -- "$1")
  if [[ ! "$filename" =~ ^(preview-)?cardano-constitution-[0-9]+\.txt$ ]]; then
    echo "Error: File name does not follow the pattern 'cardano-constitution-{i}.txt' or 'preview-cardano-constitution-{i}.txt'."
    return 1
  fi
  echo "File name pattern check passed."
  return 0
}

# Function to check headers, emphasis, and lists
check_formatting() {
  local error_found=0
  local line_number=0
  while IFS= read -r line || [ -n "$line" ]; do
    line_number=$((line_number + 1))
    if [[ "$line" =~ ^#+ ]]; then
      if [[ ! "$line" =~ ^#+\  ]]; then
        echo "Error: Header formatting error at line $line_number: $line"
        error_found=1
      fi
      if [[ ! "$line" =~ ^#{1,6}\ .*$ ]]; then
        echo "Error: Header level out of range at line $line_number: $line"
        error_found=1
      fi
    fi

    if [[ "$line" =~ \*.*\* ]]; then
      if [[ $(echo "$line" | grep -o '\*' | wc -l) -ne 2 ]]; then
        echo "Error: Emphasis formatting error at line $line_number: $line"
        error_found=1
      fi
    fi

    if [[ "$line" =~ \*\*.*\*\* ]]; then
      if [[ $(echo "$line" | grep -o '\*\*' | wc -l) -ne 2 ]]; then
        echo "Error: Bold formatting error at line $line_number: $line"
        error_found=1
      fi
    fi

    if [[ "$line" =~ ^[0-9]+\.\ .* ]]; then
      if ! [[ "$line" =~ ^[0-9]+\. ]]; then
        echo "Error: Ordered list formatting error at line $line_number: $line"
        error_found=1
      fi
    fi

    if [[ "$line" =~ ^-.* ]]; then
      if ! [[ "$line" =~ ^- ]]; then
        echo "Error: Unordered list formatting error at line $line_number: $line"
        error_found=1
      fi
    fi
  done < "$1"
  if [ $error_found -eq 1 ]; then
    return 1
  fi
  echo "Formatting check passed."
  return 0
}

# Function to check for an empty last line
check_last_line_empty() {
  last_line=$(tail -n 1 "$1")
  if [ -n "$last_line" ]; then
    echo "Error: The last line of the document is not empty."
    return 1
  fi
  echo "Empty last line check passed."
  return 0
}

# Main function to run all checks
validate_document() {
  local error_found=0

  check_line_length "$1" || error_found=1
  check_sentences "$1" || error_found=1
  # check_file_name "$1" || error_found=1
  check_formatting "$1" || error_found=1
  check_last_line_empty "$1" || error_found=1

  if [ $error_found -eq 1 ]; then
    echo "Document validation failed."
    return 1
  fi

  echo "Document is valid according to the specification."
  return 0
}

# Check if a file is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <file>"
  exit 1
fi

# Validate the document
validate_document "$1"