#!/bin/bash

echo "Zombie Survival Game - Runner Script"
echo "====================================="
echo ""

# Check if we're in the correct directory
if [ ! -f "pubspec.yaml" ]; then
    echo "✗ Error: pubspec.yaml not found. Please run this script from the project root directory."
    exit 1
fi

# Check if Flutter is installed
if ! command -v flutter &> /dev/null
then
    echo "✗ Flutter is not installed or not in PATH"
    echo "Please run check_flutter.sh first to set up your environment"
    exit 1
fi

# Get user's preferred platform
echo "Select platform to run on:"
echo "1. Linux Desktop"
echo "2. Chrome (Web)"
echo "3. Android (if device/emulator connected)"
echo "4. Exit"
echo ""

read -p "Enter your choice (1-4): " choice

case $choice in
    1)
        echo "Running on Linux Desktop..."
        flutter run -d linux
        ;;
    2)
        echo "Running on Chrome (Web)..."
        flutter run -d chrome
        ;;
    3)
        echo "Running on Android..."
        flutter run -d android
        ;;
    4)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid choice. Exiting..."
        exit 1
        ;;
esac