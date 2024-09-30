#!/bin/bash

# Set up environment variables (optional)
export TESSERACT_VERSION="5.3.0"  # Update the version if needed
export INSTALL_DIR="/tmp/tesseract"

# Create a directory to install Tesseract in a writable location
mkdir -p $INSTALL_DIR || { echo "Failed to create install directory"; exit 1; }

# Download Tesseract binary (ensure this is a valid link to a .tar.gz file)
echo "Downloading Tesseract version $TESSERACT_VERSION..."
curl -L https://github.com/tesseract-ocr/tesseract/releases/download/$TESSERACT_VERSION/tesseract-$TESSERACT_VERSION-linux-x86_64.tar.gz -o tesseract.tar.gz

# Check if download was successful
if [[ $? -ne 0 ]]; then
    echo "Download failed. Please check the URL."
    exit 1
fi

# Unpack the binary
echo "Extracting Tesseract..."
tar -xzf tesseract.tar.gz -C $INSTALL_DIR --strip-components=1

# Check if extraction was successful
if [[ $? -ne 0 ]]; then
    echo "Extraction failed"
    exit 1
fi

# Add Tesseract binary to PATH
export PATH=$INSTALL_DIR/bin:$PATH

# Check if Tesseract installed correctly
tesseract --version

if [[ $? -ne 0 ]]; then
    echo "Tesseract installation failed"
    exit 1
else
    echo "Tesseract installed successfully"
fi

# Install Python dependencies
echo "Installing Python dependencies..."
pip install -r requirements.txt

# Exit if pip install fails
if [[ $? -ne 0 ]]; then
    echo "Python dependencies installation failed"
    exit 1
fi

echo "Build completed successfully"



