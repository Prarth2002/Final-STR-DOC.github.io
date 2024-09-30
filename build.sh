#!/bin/bash

# Set up environment variables (optional)
export TESSERACT_VERSION=5.0.0
export INSTALL_DIR="/opt/tesseract"

# Create a directory to install Tesseract
mkdir -p $INSTALL_DIR

# Download Tesseract binary (example from GitHub or any other reliable source)
# Replace this with the URL of the prebuilt binary for your environment (e.g., Linux or Mac)
curl -L https://github.com/tesseract-ocr/tesseract/releases/download/$TESSERACT_VERSION/tesseract-$TESSERACT_VERSION-linux-x86_64.tar.gz -o tesseract.tar.gz

# Unpack the binary
tar -xzf tesseract.tar.gz -C $INSTALL_DIR --strip-components=1

# Add Tesseract binary to PATH
export PATH=$INSTALL_DIR/bin:$PATH

# Check if Tesseract installed correctly (optional)
tesseract --version

