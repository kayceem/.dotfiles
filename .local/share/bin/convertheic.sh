#!/bin/env sh

# Check if the required directories are provided
if [[ -z "$1" || -z "$2" ]]; then
  echo "Usage: $0 <source_directory> <destination_directory>"
  exit 1
fi

SOURCE_DIR="$1"
DEST_DIR="$2"

# Create the destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Loop through each HEIC file in the source directory
for heic_file in "$SOURCE_DIR"/*.HEIC; do
  # Skip if no .HEIC files are found
  if [[ ! -e "$heic_file" ]]; then
    echo "No HEIC files found in $SOURCE_DIR"
    exit 1
  fi

  # Extract filename without extension
  filename=$(basename "$heic_file" .HEIC)
  
  # Convert HEIC to JPEG using heif-convert
  # heif-convert "$heic_file" "$DEST_DIR/$filename.jpeg"
  /home/kayc/Downloads/tifig -q 100 -p -v "$heic_file" -o "$DEST_DIR/$filename.jpeg"

  
  echo "Converted $heic_file to $DEST_DIR/$filename.jpeg"
done

echo "Conversion completed."
