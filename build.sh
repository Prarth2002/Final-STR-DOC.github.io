#!/bin/bash

# Exit on any error
set -e

# Update package lists and install Tesseract and its dependencies
echo "Installing Tesseract and dependencies..."
apt-get update && apt-get install -y \
    tesseract-ocr \
    libtesseract-dev \
    poppler-utils

# Build the Docker image
echo "Building the Docker image..."
docker build -t my-tesseract-app .

# Optionally, you can run the Docker container
# echo "Running the Docker container..."
# docker run -p 8501:8501 my-tesseract-app

echo "Build completed successfully."
