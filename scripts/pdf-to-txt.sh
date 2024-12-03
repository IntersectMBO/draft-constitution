#!/bin/bash

# Function to convert PDF to markdown using the Marker API
convert_pdf_to_markdown() {
  local input_pdf="$1"
  local output_txt="$2"
  local api_key="$DATALAB_API_KEY"
  local url="https://www.datalab.to/api/v1/marker"

  # Check if the input file exists
  if [ ! -f "$input_pdf" ]; then
    echo "Error: Input file $input_pdf does not exist."
    exit 1
  fi

  # Perform the POST request using curl
  response=$(curl -s -X POST "$url" \
    -H "X-Api-Key: $api_key" \
    -F "file=@$input_pdf;type=application/pdf" \
    -F "langs=English" \
    -F "force_ocr=false" \
    -F "paginate=false" \
    -F "output_format=markdown")

  # Extract the request_check_url from the response
  request_check_url=$(echo "$response" | jq -r '.request_check_url')

  if [ "$request_check_url" == "null" ]; then
    echo "Error: Failed to get request_check_url from the response."
    exit 1
  fi

  echo "Polling $request_check_url for the conversion status..."

  # Poll the request_check_url until the status is complete
  max_polls=300
  for ((i=1; i<=max_polls; i++)); do
    sleep 2
    poll_response=$(curl -s -X GET "$request_check_url" -H "X-Api-Key: $api_key")
    status=$(echo "$poll_response" | jq -r '.status')

    if [ "$status" == "complete" ]; then
      echo "Conversion complete."
      markdown=$(echo "$poll_response" | jq -r '.markdown')
      echo "$markdown" > "$output_txt"
      echo "Markdown has been saved to $output_txt."
      return 0
    fi
  done

  echo "Error: Conversion did not complete within the maximum number of polls."
  exit 1
}

# Check if input and output files are provided
if [ $# -ne 2 ]; then
  echo "Usage: $0 <input_pdf> <output_txt>"
  exit 1
fi

# Convert the PDF to markdown
convert_pdf_to_markdown "$1" "$2"