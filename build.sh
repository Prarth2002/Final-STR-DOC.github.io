#!/bin/bash

# Set up environment variables (optional)
export TESSERACT_VERSION=5.0.0
export INSTALL_DIR="/tmp/tesseract"

# Create a directory to install Tesseract in a writable location
mkdir -p $INSTALL_DIR

# Download Tesseract binary (ensure this is a valid link to a .tar.gz file)
curl -L https://github.com/tesseract-ocr/tesseract/releases/download/$TESSERACT_VERSION/tesseract-$TESSERACT_VERSION-linux-x86_64.tar.gz -o tesseract.tar.gz

# Unpack the binary
tar -xzf tesseract.tar.gz -C $INSTALL_DIR --strip-components=1 || { echo "Extraction failed"; exit 1; }

# Add Tesseract binary to PATH
export PATH=$INSTALL_DIR/bin:$PATH

# Check if Tesseract installed correctly
tesseract --version || { echo "Tesseract installation failed"; exit 1; }


