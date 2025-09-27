# Script to run the Zombie Survival Game
Write-Host "Zombie Survival Game - Runner Script" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan

# Check if we're in the correct directory
if (-not (Test-Path "pubspec.yaml")) {
    Write-Host "✗ Error: pubspec.yaml not found. Please run this script from the project root directory." -ForegroundColor Red
    exit 1
}

# Check if Flutter is installed
try {
    $flutterVersion = flutter --version
    Write-Host "✓ Flutter is installed" -ForegroundColor Green
} catch {
    Write-Host "✗ Flutter is not installed or not in PATH" -ForegroundColor Red
    Write-Host "Please run check_flutter.ps1 first to set up your environment" -ForegroundColor Yellow
    exit 1
}

# Get user's preferred platform
Write-Host "`nSelect platform to run on:" -ForegroundColor Yellow
Write-Host "1. Windows Desktop" -ForegroundColor White
Write-Host "2. Chrome (Web)" -ForegroundColor White
Write-Host "3. Android (if device/emulator connected)" -ForegroundColor White
Write-Host "4. Exit" -ForegroundColor White

$choice = Read-Host "`nEnter your choice (1-4)"

switch ($choice) {
    1 {
        Write-Host "Running on Windows Desktop..." -ForegroundColor Green
        flutter run -d windows
    }
    2 {
        Write-Host "Running on Chrome (Web)..." -ForegroundColor Green
        flutter run -d chrome
    }
    3 {
        Write-Host "Running on Android..." -ForegroundColor Green
        flutter run -d android
    }
    4 {
        Write-Host "Exiting..." -ForegroundColor Yellow
        exit 0
    }
    default {
        Write-Host "Invalid choice. Exiting..." -ForegroundColor Red
        exit 1
    }
}