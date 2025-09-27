#!/bin/bash

echo "Checking Flutter installation..."

# Check if flutter command is available
if command -v flutter &> /dev/null
then
    echo "✓ Flutter is installed"
    flutter --version
else
    echo "✗ Flutter is not installed or not in PATH"
    echo "Please install Flutter from https://flutter.dev/docs/get-started/install"
    echo "After installation, make sure to add Flutter to your PATH environment variable"
    exit 1
fi

echo ""
echo "Checking Flutter environment..."
flutter doctor

echo ""
echo "Getting dependencies..."
if [ -f "pubspec.yaml" ]; then
    echo "✓ Found pubspec.yaml"
    flutter pub get
else
    echo "✗ pubspec.yaml not found in current directory"
    exit 1
fi

echo ""
echo "✓ Environment check completed successfully!"