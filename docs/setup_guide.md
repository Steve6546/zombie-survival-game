# Comprehensive Setup Guide

This guide provides detailed instructions for setting up the Zombie Survival Game on different platforms and environments.

## System Requirements

### Minimum Requirements
- **RAM**: 4 GB
- **Storage**: 500 MB available space
- **Graphics**: DirectX 10+ compatible graphics card
- **OS**: Windows 7+, macOS 10.14+, Ubuntu 18.04+, or compatible Linux distribution

### Recommended Requirements
- **RAM**: 8 GB
- **Storage**: 1 GB available space
- **Graphics**: DirectX 11+ compatible graphics card
- **OS**: Windows 10+, macOS 10.15+, Ubuntu 20.04+, or compatible Linux distribution

## Installing Flutter

### Windows

1. **Download Flutter SDK**
   - Visit [https://docs.flutter.dev/get-started/install/windows](https://docs.flutter.dev/get-started/install/windows)
   - Download the latest stable version

2. **Extract Flutter**
   - Extract to `C:\flutter` or your preferred location
   - Add `C:\flutter\bin` to your PATH environment variable

3. **Verify Installation**
   ```powershell
   flutter --version
   ```

### WSL (Windows Subsystem for Linux)

1. **Install WSL**
   ```powershell
   wsl --install
   ```

2. **Install Flutter in WSL**
   ```bash
   # In WSL terminal
   sudo apt update
   sudo apt install git curl unzip
   git clone https://github.com/flutter/flutter.git -b stable
   export PATH="$PATH:`pwd`/flutter/bin"
   ```

3. **Add to PATH permanently**
   ```bash
   echo 'export PATH="$PATH:`pwd`/flutter/bin"' >> ~/.bashrc
   source ~/.bashrc
   ```

### Linux

1. **Install Dependencies**
   ```bash
   sudo apt update
   sudo apt install git curl unzip
   ```

2. **Download Flutter**
   ```bash
   git clone https://github.com/flutter/flutter.git -b stable
   export PATH="$PATH:`pwd`/flutter/bin"
   ```

### macOS

1. **Install Xcode**
   - Download from App Store
   - Run `sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer`

2. **Install Flutter**
   ```bash
   git clone https://github.com/flutter/flutter.git -b stable
   export PATH="$PATH:`pwd`/flutter/bin"
   ```

## Setting Up the Project

### 1. Clone the Repository

```bash
git clone <repository-url>
cd zombie_survival_game
```

### 2. Run Environment Check Scripts

#### Windows (PowerShell)
```powershell
.\scripts\check_flutter.ps1
```

#### Windows (CMD)
```cmd
scripts\check_flutter.bat
```

#### WSL/Linux/macOS
```bash
chmod +x scripts/*.sh
./scripts/check_flutter.sh
```

### 3. Get Dependencies

```bash
flutter pub get
```

## Running the Game

### Quick Start Method

#### Windows
```powershell
# PowerShell
.\scripts\run_game.ps1

# CMD
scripts\run_game.bat
```

#### WSL/Linux/macOS
```bash
./scripts/run_game.sh
```

### Manual Method

#### Desktop
```bash
# Windows
flutter run -d windows

# macOS
flutter run -d macos

# Linux
flutter run -d linux
```

#### Web
```bash
flutter run -d chrome
```

#### Mobile
```bash
# Android (device/emulator required)
flutter run -d android

# iOS (macOS only, device/emulator required)
flutter run -d ios
```

## Building Release Versions

### Quick Build Method

#### Windows
```powershell
# PowerShell
.\scripts\build_release.ps1

# CMD
scripts\build_release.bat
```

#### WSL/Linux/macOS
```bash
./scripts/build_release.sh
```

### Manual Build Method

#### Windows Desktop
```bash
flutter build windows
```

#### macOS Desktop
```bash
flutter build macos
```

#### Linux Desktop
```bash
flutter build linux
```

#### Web
```bash
flutter build web
```

#### Android
```bash
# APK
flutter build apk

# App Bundle
flutter build appbundle
```

#### iOS
```bash
flutter build ios
```

## Platform-Specific Considerations

### Windows PowerShell vs CMD

Both PowerShell and CMD are fully supported. PowerShell is recommended for better script support.

### WSL Performance Tips

1. **Use WSL 2** for better performance
2. **Store project files in Linux filesystem** rather than Windows drives
3. **Use dedicated WSL terminal** for development

### Web Deployment

1. **Build for web**:
   ```bash
   flutter build web
   ```

2. **Deploy** the contents of `build/web` to any web server

### Mobile Development

#### Android
1. **Install Android Studio**
2. **Set up Android SDK**
3. **Connect device or start emulator**

#### iOS (macOS only)
1. **Install Xcode**
2. **Set up iOS Simulator or connect device**

## Troubleshooting

### Common Issues

#### Flutter Not Found
- Ensure Flutter is added to PATH
- Restart terminal/command prompt
- Verify with `flutter --version`

#### No Connected Devices
- **Desktop**: Should work out of the box
- **Web**: Install Chrome
- **Mobile**: Connect device or start emulator

#### Build Failures
- Clean build: `flutter clean`
- Get dependencies: `flutter pub get`
- Try again

### Windows-Specific Issues

#### PowerShell Execution Policy
If scripts won't run:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH Issues
- Ensure `C:\flutter\bin` is in your PATH
- Restart PowerShell/CMD after PATH changes

### WSL-Specific Issues

#### Flutter Not Found After Reboot
- Ensure PATH is set in `~/.bashrc` or `~/.zshrc`
- Source the file: `source ~/.bashrc`

#### Performance Issues
- Use WSL 2
- Store project in Linux filesystem (`~/projects/` not `/mnt/c/projects/`)

## Testing

### Run Unit Tests
```bash
flutter test
```

### Run Specific Test Files
```bash
# Player tests
flutter test test/player_test.dart

# Integration tests
flutter test test/integration_test.dart

# Performance tests
flutter test test/performance_test.dart
```

## Development Workflow

1. **Make changes** to Dart files in `lib/`
2. **Hot reload** by pressing `r` in the terminal
3. **Hot restart** by pressing `R` in the terminal
4. **Run tests** to ensure functionality
5. **Build release** when ready to deploy

## Updating Dependencies

### Check for Updates
```bash
flutter pub outdated
```

### Update Dependencies
```bash
flutter pub upgrade
```

### Add New Dependencies
1. Add to `pubspec.yaml`
2. Run `flutter pub get`

## Project Structure

```
zombie_survival_game/
├── lib/                    # Source code
│   ├── main.dart          # Entry point
│   ├── game/              # Game logic
│   ├── platform/          # Platform-specific code
│   └── ...                # Other source files
├── assets/                # Game assets
│   ├── images/            # Sprites and textures
│   └── audio/             # Sound files
├── docs/                  # Documentation
├── scripts/               # Helper scripts
├── test/                  # Unit tests
├── pubspec.yaml           # Project configuration
└── README.md              # Project overview
```

## Getting Help

- **Flutter Documentation**: [https://docs.flutter.dev](https://docs.flutter.dev)
- **Flame Documentation**: [https://flame-engine.org](https://flame-engine.org)
- **Community Support**: [https://flutter.dev/community](https://flutter.dev/community)