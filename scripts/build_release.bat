@echo off
title Zombie Survival Game - Build Release
color 0A

echo Zombie Survival Game - Build Release Script
echo ===========================================
echo.

REM Check if we're in the correct directory
if not exist "pubspec.yaml" (
    echo ✗ Error: pubspec.yaml not found. Please run this script from the project root directory.
    pause
    exit /b 1
)

REM Check if Flutter is installed
flutter --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ✗ Flutter is not installed or not in PATH
    echo Please run check_flutter.bat first to set up your environment
    pause
    exit /b 1
)

REM Create build directory if it doesn't exist
if not exist "build" mkdir build

echo Select platform to build for:
echo 1. Windows Desktop
echo 2. Web
echo 3. Android (APK)
echo 4. Android (App Bundle)
echo 5. All Platforms
echo 6. Exit
echo.

choice /c 123456 /m "Enter your choice"
if errorlevel 6 goto exit
if errorlevel 5 goto all
if errorlevel 4 goto appbundle
if errorlevel 3 goto apk
if errorlevel 2 goto web
if errorlevel 1 goto windows

:windows
echo Building Windows Desktop release...
flutter build windows
if %errorlevel% == 0 (
    echo ✓ Windows build completed successfully!
    echo Build location: build\windows\x64\runner\Release\
) else (
    echo ✗ Windows build failed!
)
goto end

:web
echo Building Web release...
flutter build web
if %errorlevel% == 0 (
    echo ✓ Web build completed successfully!
    echo Build location: build\web\
) else (
    echo ✗ Web build failed!
)
goto end

:apk
echo Building Android APK release...
flutter build apk
if %errorlevel% == 0 (
    echo ✓ Android APK build completed successfully!
    echo Build location: build\app\outputs\flutter-apk\
) else (
    echo ✗ Android APK build failed!
)
goto end

:appbundle
echo Building Android App Bundle release...
flutter build appbundle
if %errorlevel% == 0 (
    echo ✓ Android App Bundle build completed successfully!
    echo Build location: build\app\outputs\bundle\release\
) else (
    echo ✗ Android App Bundle build failed!
)
goto end

:all
echo Building all platforms...
echo Building Windows Desktop release...
flutter build windows
if %errorlevel% == 0 (
    echo ✓ Windows build completed successfully!
) else (
    echo ✗ Windows build failed!
)

echo Building Web release...
flutter build web
if %errorlevel% == 0 (
    echo ✓ Web build completed successfully!
) else (
    echo ✗ Web build failed!
)

echo Building Android APK release...
flutter build apk
if %errorlevel% == 0 (
    echo ✓ Android APK build completed successfully!
) else (
    echo ✗ Android APK build failed!
)
goto end

:exit
echo Exiting...
exit /b 0

:end
pause