#!/bin/bash

# Check for dependencies
if ! command -v composite &> /dev/null; then
    echo "Error: ImageMagick is not installed. Please install it and try again."
    exit 1
fi

# Check for correct arguments
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <base_image.png> <overlay_image.png> <output_image.png>"
    exit 1
fi

# Input arguments
BASE_IMAGE="$1"
OVERLAY_IMAGE="$2"
OUTPUT_IMAGE="$3"

# Merge the images
composite -gravity center "$OVERLAY_IMAGE" "$BASE_IMAGE" "$OUTPUT_IMAGE"

# Verify output
if [ $? -eq 0 ]; then
    echo "Images merged successfully. Output saved to $OUTPUT_IMAGE"
else
    echo "Error: Failed to merge images."
fi
