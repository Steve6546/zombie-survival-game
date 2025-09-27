# Setup and Run Instructions

## Prerequisites

1. **Flutter SDK** (3.0 or higher)
2. **Dart SDK** (2.17 or higher)
3. **IDE** (VS Code with Flutter extension recommended)

## Installation

### 1. Install Flutter

If Flutter is not already installed on your system:

#### Windows
```bash
# Download Flutter SDK from https://flutter.dev/docs/get-started/install/windows
# Extract to C:\flutter
# Add C:\flutter\bin to your PATH environment variable
```

#### macOS
```bash
# Download Flutter SDK from https://flutter.dev/docs/get-started/install/macos
# Extract to ~/development
# Add to PATH: export PATH="$PATH:`pwd`/flutter/bin"
```

#### Linux
```bash
# Download Flutter SDK from https://flutter.dev/docs/get-started/install/linux
# Extract to ~/development
# Add to PATH: export PATH="$PATH:`pwd`/flutter/bin"
```

### 2. Verify Installation

```bash
flutter doctor
```

This command checks your environment and displays a report of the status of your Flutter installation.

### 3. Get Dependencies

Navigate to the project directory and get the required dependencies:

```bash
cd zombie_survival_game
flutter pub get
```

## Running the Game

### On Desktop (Windows, macOS, Linux)

```bash
flutter run -d windows
# or
flutter run -d macos
# or
flutter run -d linux
```

### On Mobile (Android, iOS)

#### Android
```bash
flutter run -d android
```

#### iOS
```bash
flutter run -d ios
```

Note: For iOS development, you need to be on a macOS system with Xcode installed.

### On Web

```bash
flutter run -d chrome
```

## Building Release Versions

### Desktop

#### Windows
```bash
flutter build windows
```

#### macOS
```bash
flutter build macos
```

#### Linux
```bash
flutter build linux
```

### Mobile

#### Android
```bash
flutter build apk
# or for app bundle
flutter build appbundle
```

#### iOS
```bash
flutter build ios
```

### Web
```bash
flutter build web
```

## Project Structure

```
zombie_survival_game/
├── lib/                    # Source code
│   ├── main.dart          # Entry point
│   └── game/              # Game logic
├── assets/                # Game assets
│   ├── images/            # Sprites and textures
│   └── audio/             # Sound files
├── docs/                  # Documentation
├── test/                  # Unit tests
├── pubspec.yaml           # Project configuration
└── README.md              # Project overview
```

## Development Workflow

1. **Make Changes**: Edit files in the `lib/` directory
2. **Hot Reload**: Press `r` in the terminal while the app is running to reload changes
3. **Hot Restart**: Press `R` in the terminal to restart the app
4. **Debug**: Use DevTools for debugging and profiling

## Adding New Assets

1. Place image files in `assets/images/`
2. Place audio files in `assets/audio/`
3. Reference them in code using relative paths
4. Update `pubspec.yaml` if needed (already configured for assets)

## Testing

Run unit tests:
```bash
flutter test
```

## Troubleshooting

### Common Issues

1. **"Flutter not found"**: Ensure Flutter is in your PATH
2. **"No devices found"**: Make sure an emulator is running or a device is connected
3. **"Pub get failed"**: Check internet connection and try `flutter pub pub cache repair`

### Getting Help

- Check the [Flutter documentation](https://flutter.dev/docs)
- Visit the [Flutter community](https://flutter.dev/community)
- File issues on the project repository