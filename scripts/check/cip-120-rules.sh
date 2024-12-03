#!/bin/bash

# Function to check UTF-8 encoding
check_utf8_encoding() {
  if ! file -i "$1" | grep -q 'charset=utf-8'; then
    echo "Error: File is not UTF-8 encoded."
    return 1
  fi
  echo "UTF-8 encoding check passed."
  return 0
}

# Function to check line length
check_line_length() {
  local error_found=0
  while IFS= read -r line || [ -n "$line" ]; do
    if [ ${#line} -gt 80 ]; then
      error_found=1
      break
    fi
  done < "$1"
  if [ $error_found -eq 1 ]; then
    echo "Error: One or more lines exceed 80 characters."
    return 1
  fi
  echo "Line length check passed."
  return 0
}

# Function to check sentences per line and capitalization
check_sentences() {
  local error_found=0
  while IFS= read -r line || [ -n "$line" ]; do
    if [[ ! "$line" =~ ^[A-Z] ]]; then
      error_found=1
      break
    fi
    if [[ $(echo "$line" | grep -o '\.' | wc -l) -gt 1 ]]; then
      error_found=1
      break
    fi
  done < "$1"
  if [ $error_found -eq 1 ]; then
    echo "Error: One or more lines do not start with a capital letter or contain more than one sentence."
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
  while IFS= read -r line || [ -n "$line" ]; do
    if [[ "$line" =~ ^#+ ]]; then
      if [[ ! "$line" =~ ^#+\  ]] || [[ ! "$line" =~ ^#{1,6}\ .*$ ]]; then
        error_found=1
        break
      fi
    fi

    if [[ "$line" =~ \*.*\* ]]; then
      if [[ $(echo "$line" | grep -o '\*' | wc -l) -ne 2 ]]; then
        error_found=1
        break
      fi
    fi

    if [[ "$line" =~ \*\*.*\*\* ]]; then
      if [[ $(echo "$line" | grep -o '\*\*' | wc -l) -ne 2 ]]; then
        error_found=1
        break
      fi
    fi

    if [[ "$line" =~ ^[0-9]+\.\ .* ]]; then
      if ! [[ "$line" =~ ^[0-9]+\. ]]; then
        error_found=1
        break
      fi
    fi

    if [[ "$line" =~ ^-.* ]]; then
      if ! [[ "$line" =~ ^- ]]; then
        error_found=1
        break
      fi
    fi
  done < "$1"
  if [ $error_found -eq 1 ]; then
    echo "Error: Formatting issues found in headers, emphasis, or lists."
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

  check_utf8_encoding "$1" || error_found=1
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