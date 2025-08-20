#!/bin/bash
################################################################################
# PURPOSE      : Convert mermaid js .mmd file to .svg image file
# PARAMETERS   : input.mmd - the input file to be converted
# RETURNS      : 0 on success, non-zero on failure
# DEPENDENCIES : docker
# REMARKS      : None
################################################################################

# Exit on error
set -e

# Set tag if a specific version is required
MERMAID_TAG=latest
MERMAID_IMAGE=minlag/mermaid-cli:${MERMAID_TAG}

# Check if input is provided
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 input.mmd"
  exit 1
fi

INPUT_FILE="$1"

# Check if input file exists
if [ ! -f "$INPUT_FILE" ]; then
  echo "Error: File '$INPUT_FILE' not found!"
  exit 1
fi

# Get full path and filename info
INPUT_ABS_PATH=$(realpath "$INPUT_FILE")
INPUT_DIR=$(dirname "$INPUT_ABS_PATH")
INPUT_FILENAME=$(basename "$INPUT_FILE")
OUTPUT_FILENAME="${INPUT_FILENAME%.mmd}.svg"

# Pull the mermaid-cli docker image to make sure we have the latest
# Ignore errors to fall back to cached image
docker pull ${MERMAID_IMAGE} || true

# Run the mermaid-cli docker container
docker run --rm \
  -u ${UID} \
  -v "$INPUT_DIR":/data \
  ${MERMAID_IMAGE} \
  -i "/data/$INPUT_FILENAME" \
  -o "/data/$OUTPUT_FILENAME"

echo "SVG file generated: $INPUT_DIR/$OUTPUT_FILENAME"
