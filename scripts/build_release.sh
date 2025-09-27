#!/bin/bash

echo "Zombie Survival Game - Build Release Script"
echo "==========================================="
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

# Create build directory if it doesn't exist
if [ ! -d "build" ]; then
    mkdir build
fi

# Get user's preferred platform
echo "Select platform to build for:"
echo "1. Linux Desktop"
echo "2. Web"
echo "3. Android (APK)"
echo "4. Android (App Bundle)"
echo "5. All Platforms"
echo "6. Exit"
echo ""

read -p "Enter your choice (1-6): " choice

case $choice in
    1)
        echo "Building Linux Desktop release..."
        flutter build linux
        if [ $? -eq 0 ]; then
            echo "✓ Linux build completed successfully!"
            echo "Build location: build/linux/x64/release/bundle/"
        else
            echo "✗ Linux build failed!"
        fi
        ;;
    2)
        echo "Building Web release..."
        flutter build web
        if [ $? -eq 0 ]; then
            echo "✓ Web build completed successfully!"
            echo "Build location: build/web/"
        else
            echo "✗ Web build failed!"
        fi
        ;;
    3)
        echo "Building Android APK release..."
        flutter build apk
        if [ $? -eq 0 ]; then
            echo "✓ Android APK build completed successfully!"
            echo "Build location: build/app/outputs/flutter-apk/"
        else
            echo "✗ Android APK build failed!"
        fi
        ;;
    4)
        echo "Building Android App Bundle release..."
        flutter build appbundle
        if [ $? -eq 0 ]; then
            echo "✓ Android App Bundle build completed successfully!"
            echo "Build location: build/app/outputs/bundle/release/"
        else
            echo "✗ Android App Bundle build failed!"
        fi
        ;;
    5)
        echo "Building all platforms..."
        echo "Building Linux Desktop release..."
        flutter build linux
        if [ $? -eq 0 ]; then
            echo "✓ Linux build completed successfully!"
        else
            echo "✗ Linux build failed!"
        fi
        
        echo "Building Web release..."
        flutter build web
        if [ $? -eq 0 ]; then
            echo "✓ Web build completed successfully!"
        else
            echo "✗ Web build failed!"
        fi
        
        echo "Building Android APK release..."
        flutter build apk
        if [ $? -eq 0 ]; then
            echo "✓ Android APK build completed successfully!"
        else
            echo "✗ Android APK build failed!"
        fi
        ;;
    6)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid choice. Exiting..."
        exit 1
        ;;
esac