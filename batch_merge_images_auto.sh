#!/bin/bash

# Check for correct arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: ./batch_merge_images_auto.sh <overlay_image.png> <input_folder>"
    exit 1
fi

# Input arguments
OVERLAY_IMAGE="$1"
INPUT_FOLDER="$2"
OUTPUT_FOLDER_NAME="$(basename "$INPUT_FOLDER")_output"

# Check if input folder exists
if [ ! -d "$INPUT_FOLDER" ]; then
    echo "Error: Input folder $INPUT_FOLDER does not exist."
    exit 1
fi

# Get the parent directory of the input folder
PARENT_DIR=$(dirname "$INPUT_FOLDER")
# Get the directory of that the script file is run from
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Define the output folder path
OUTPUT_FOLDER="$PARENT_DIR/$OUTPUT_FOLDER_NAME"

# Create output folder if it doesn't exist
mkdir -p "$OUTPUT_FOLDER"

# Process each PNG file in the input folder
for BASE_IMAGE in "$INPUT_FOLDER"/*.png; do
    if [ -f "$BASE_IMAGE" ]; then
        # Extract filename without the path
        FILENAME=$(basename "$BASE_IMAGE")

        # Define the output image path
        OUTPUT_IMAGE="$OUTPUT_FOLDER/$FILENAME"

        # Call the first script to merge the images
        $SCRIPT_DIR/merge_images.sh "$BASE_IMAGE" "$OVERLAY_IMAGE" "$OUTPUT_IMAGE"

        # Check for success
        if [ $? -eq 0 ]; then
            echo "Processed: $FILENAME"
        else
            echo "Error processing: $FILENAME"
        fi
    fi
done

echo "Batch processing complete. Merged images are in $OUTPUT_FOLDER."
