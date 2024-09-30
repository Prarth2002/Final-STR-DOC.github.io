#!/bin/bash

# Install Python dependencies
echo "Installing Python dependencies..."
pip install -r requirements.txt

if [[ $? -ne 0 ]]; then
    echo "Python dependencies installation failed"
    exit 1
fi

# Check Tesseract installation
echo "Checking Tesseract installation..."
tesseract --version

if [[ $? -ne 0 ]]; then
    echo "Tesseract installation failed"
    exit 1
else
    echo "Tesseract installed successfully"
fi

echo "Build completed successfully"




