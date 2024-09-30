#!/bin/bash

# Install Python dependencies
echo "Installing Python dependencies..."
pip install -r requirements.txt

if [[ $? -ne 0 ]]; then
    echo "Python dependencies installation failed"
    exit 1
fi

# Download precompiled Tesseract binary from a trusted source
echo "Downloading precompiled Tesseract binary..."
curl -L -o tesseract.tar.gz https://github.com/tesseract-ocr/tesseract/releases/download/5.0.0/tesseract-5.0.0-linux-x86_64.tar.gz

if [[ $? -ne 0 ]]; then
    echo "Failed to download Tesseract binary"
    exit 1
fi

# Unpack the Tesseract binary
echo "Unpacking Tesseract..."
mkdir -p /tmp/tesseract
tar -xvzf tesseract.tar.gz -C /tmp/tesseract --strip-components=1 || { echo "Extraction failed"; exit 1; }

# Add Tesseract to PATH
echo "Adding Tesseract to PATH..."
export PATH=/tmp/tesseract/bin:$PATH

# Check if Tesseract is installed correctly
echo "Checking Tesseract installation..."
/tmp/tesseract/bin/tesseract --version

if [[ $? -ne 0 ]]; then
    echo "Tesseract installation failed"
    exit 1
else
    echo "Tesseract installed successfully"
fi

echo "Build completed successfully"





