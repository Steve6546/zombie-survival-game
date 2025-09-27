@echo off
title Zombie Survival Game - Runner
color 0A

echo Zombie Survival Game - Runner Script
echo =====================================
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

echo Select platform to run on:
echo 1. Windows Desktop
echo 2. Chrome (Web)
echo 3. Android (if device/emulator connected)
echo 4. Exit
echo.

choice /c 1234 /m "Enter your choice"
if errorlevel 4 goto exit
if errorlevel 3 goto android
if errorlevel 2 goto web
if errorlevel 1 goto windows

:windows
echo Running on Windows Desktop...
flutter run -d windows
goto end

:web
echo Running on Chrome (Web)...
flutter run -d chrome
goto end

:android
echo Running on Android...
flutter run -d android
goto end

:exit
echo Exiting...
exit /b 0

:end
pause