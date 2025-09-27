# Script to build release versions of the Zombie Survival Game
Write-Host "Zombie Survival Game - Build Release Script" -ForegroundColor Cyan
Write-Host "===========================================" -ForegroundColor Cyan

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

# Create build directory if it doesn't exist
if (-not (Test-Path "build")) {
    New-Item -ItemType Directory -Name "build" | Out-Null
}

# Get user's preferred platform
Write-Host "`nSelect platform to build for:" -ForegroundColor Yellow
Write-Host "1. Windows Desktop" -ForegroundColor White
Write-Host "2. Web" -ForegroundColor White
Write-Host "3. Android (APK)" -ForegroundColor White
Write-Host "4. Android (App Bundle)" -ForegroundColor White
Write-Host "5. All Platforms" -ForegroundColor White
Write-Host "6. Exit" -ForegroundColor White

$choice = Read-Host "`nEnter your choice (1-6)"

switch ($choice) {
    1 {
        Write-Host "Building Windows Desktop release..." -ForegroundColor Green
        flutter build windows
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✓ Windows build completed successfully!" -ForegroundColor Green
            Write-Host "Build location: build\windows\x64\runner\Release\" -ForegroundColor White
        } else {
            Write-Host "✗ Windows build failed!" -ForegroundColor Red
        }
    }
    2 {
        Write-Host "Building Web release..." -ForegroundColor Green
        flutter build web
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✓ Web build completed successfully!" -ForegroundColor Green
            Write-Host "Build location: build\web\" -ForegroundColor White
        } else {
            Write-Host "✗ Web build failed!" -ForegroundColor Red
        }
    }
    3 {
        Write-Host "Building Android APK release..." -ForegroundColor Green
        flutter build apk
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✓ Android APK build completed successfully!" -ForegroundColor Green
            Write-Host "Build location: build\app\outputs\flutter-apk\" -ForegroundColor White
        } else {
            Write-Host "✗ Android APK build failed!" -ForegroundColor Red
        }
    }
    4 {
        Write-Host "Building Android App Bundle release..." -ForegroundColor Green
        flutter build appbundle
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✓ Android App Bundle build completed successfully!" -ForegroundColor Green
            Write-Host "Build location: build\app\outputs\bundle\release\" -ForegroundColor White
        } else {
            Write-Host "✗ Android App Bundle build failed!" -ForegroundColor Red
        }
    }
    5 {
        Write-Host "Building all platforms..." -ForegroundColor Green
        Write-Host "Building Windows Desktop release..." -ForegroundColor Yellow
        flutter build windows
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✓ Windows build completed successfully!" -ForegroundColor Green
        } else {
            Write-Host "✗ Windows build failed!" -ForegroundColor Red
        }
        
        Write-Host "Building Web release..." -ForegroundColor Yellow
        flutter build web
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✓ Web build completed successfully!" -ForegroundColor Green
        } else {
            Write-Host "✗ Web build failed!" -ForegroundColor Red
        }
        
        Write-Host "Building Android APK release..." -ForegroundColor Yellow
        flutter build apk
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✓ Android APK build completed successfully!" -ForegroundColor Green
        } else {
            Write-Host "✗ Android APK build failed!" -ForegroundColor Red
        }
    }
    6 {
        Write-Host "Exiting..." -ForegroundColor Yellow
        exit 0
    }
    default {
        Write-Host "Invalid choice. Exiting..." -ForegroundColor Red
        exit 1
    }
}