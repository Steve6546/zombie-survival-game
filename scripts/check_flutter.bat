@echo off
echo Checking Flutter installation...

REM Check if flutter command is available
flutter --version >nul 2>&1
if %errorlevel% == 0 (
    echo ✓ Flutter is installed
    flutter --version
) else (
    echo ✗ Flutter is not installed or not in PATH
    echo Please install Flutter from https://flutter.dev/docs/get-started/install
    echo After installation, make sure to add Flutter to your PATH environment variable
    pause
    exit /b 1
)

echo.
echo Checking Flutter environment...
flutter doctor

echo.
echo Getting dependencies...
if exist pubspec.yaml (
    echo ✓ Found pubspec.yaml
    flutter pub get
) else (
    echo ✗ pubspec.yaml not found in current directory
    pause
    exit /b 1
)

echo.
echo ✓ Environment check completed successfully!
pause