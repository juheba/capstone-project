#!/bin/bash

# Define paths
OPENAPI_CONTRACT_PATH="specs/collector-openapi.yml"
OPENAPI_CONFIG_PATH="specs/collector-openapi-config.json"
TEMP_OUTPUT_DIRECTORY=".generator_temp/collector-api"
TEMP_SRC_FOLDER="$TEMP_OUTPUT_DIRECTORY/lib/src"
OUTPUT_DIRECTORY="lib/generated/openapi/collector-api"
NEW_SRC_FOLDER="generated/openapi/collector-api/src"
GENERATOR="dart-dio"

# Check if openapi-generator-cli is installed
if ! command -v openapi-generator-cli &> /dev/null
then
    echo "Error: openapi-generator-cli not found. Please install it first."
    echo "Installation: https://openapi-generator.tech/docs/installation"
    exit 1
fi

# Step 1: Validate OpenAPI Contract
echo "Validating OpenAPI contract at $OPENAPI_CONTRACT_PATH..."
openapi-generator-cli validate -i "$OPENAPI_CONTRACT_PATH"

if [ $? -ne 0 ]; then
    echo "Error: OpenAPI contract validation failed."
    exit 1
fi

# Step 2: Remove Existing Generated Files
echo "Removing existing generated API files in $OUTPUT_DIRECTORY..."
rm -rf "$OUTPUT_DIRECTORY"
rm -rf "$TEMP_TEMP_OUTPUT_DIRECTORY"

# Step 3: Regenerate API Client
echo "Generating API client from OpenAPI contract..."
openapi-generator-cli generate -i $OPENAPI_CONTRACT_PATH -g $GENERATOR -c $OPENAPI_CONFIG_PATH -o $TEMP_OUTPUT_DIRECTORY

if [ $? -ne 0 ]; then
    echo "Error: Failed to generate API client."
    exit 1
fi

# Step 3.1: Build
echo "Building API client..."
cd "$TEMP_OUTPUT_DIRECTORY"
dart run build_runner build --delete-conflicting-outputs
cd ../..

# Step 3.2: Replace 'package:collector_api_client' and 'src' folder
echo "Replacing 'collector_api_client' and 'src' folder..."

# Ensure the SRC_FOLDER exists
if [ ! -d "$TEMP_SRC_FOLDER" ]; then
    echo "Error: Directory $TEMP_SRC_FOLDER does not exist."
    exit 1
fi

# Find and replace export and import statements in all files
find "$TEMP_OUTPUT_DIRECTORY" \( -name "*.dart" -o -name "*.md" \) -type f | while read -r file; do
    echo "Processing $file"

    # Replace 'export' statements
    sed -i.bak "s|export 'package:collector_api_client/|export 'package:collector/|g" "$file"

    # Replace 'import' statements
    sed -i.bak "s|import 'package:collector_api_client/src/|import 'package:collector/$NEW_SRC_FOLDER/|g" "$file"
    sed -i.bak "s|import 'package:collector_api_client/|import 'package:collector/$NEW_SRC_FOLDER/|g" "$file"

    # Remove backup file created by sed (.bak extension)
    rm -f "${file}.bak"
done

echo "Replacement complete."

# Step 4: Format Dart Code
echo "Formatting generated Dart code..."
dart format "$TEMP_OUTPUT_DIRECTORY"

if [ $? -ne 0 ]; then
    echo "Warning: Formatting failed. Please check the generated code manually."
else
    echo "Code formatted successfully."
fi

# Step 5: Move Generated Files to Output Directory
echo "Moving generated API files to $OUTPUT_DIRECTORY..."
mkdir -p "$OUTPUT_DIRECTORY"

# Check if generated directories exist
if [ -d "$TEMP_OUTPUT_DIRECTORY/doc" ]; then
    mv "$TEMP_OUTPUT_DIRECTORY/doc" "$OUTPUT_DIRECTORY"
else
    echo "Warning: No doc directory found in the generated files."
fi


if [ -d "$TEMP_OUTPUT_DIRECTORY/lib/src" ]; then
    mv "$TEMP_OUTPUT_DIRECTORY/lib/src" "$OUTPUT_DIRECTORY"
else
    echo "Warning: No lib directory found in the generated files."
fi


# Step 6: Remove Temporary Files
echo "Removing temporary files..."
rm -rf "$TEMP_OUTPUT_DIRECTORY"
rm -rf ".generator_temp"

echo "API client updated successfully at $OUTPUT_DIRECTORY."
