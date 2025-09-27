# Check if Flutter is installed and in PATH
Write-Host "Checking Flutter installation..." -ForegroundColor Yellow

# Check if flutter command is available
try {
    $flutterVersion = flutter --version
    Write-Host "✓ Flutter is installed:" -ForegroundColor Green
    Write-Host $flutterVersion
} catch {
    Write-Host "✗ Flutter is not installed or not in PATH" -ForegroundColor Red
    Write-Host "Please install Flutter from https://flutter.dev/docs/get-started/install" -ForegroundColor Yellow
    Write-Host "After installation, make sure to add Flutter to your PATH environment variable" -ForegroundColor Yellow
    exit 1
}

# Check Flutter doctor
Write-Host "`nChecking Flutter environment..." -ForegroundColor Yellow
flutter doctor

# Check if pubspec.yaml exists
if (Test-Path "pubspec.yaml") {
    Write-Host "`n✓ Found pubspec.yaml" -ForegroundColor Green
    Write-Host "Getting dependencies..." -ForegroundColor Yellow
    flutter pub get
} else {
    Write-Host "`n✗ pubspec.yaml not found in current directory" -ForegroundColor Red
    exit 1
}

Write-Host "`n✓ Environment check completed successfully!" -ForegroundColor Green