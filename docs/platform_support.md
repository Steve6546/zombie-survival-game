# Platform Support and Configuration

This document explains how the Zombie Survival Game supports different platforms and the optimizations applied for each.

## Supported Platforms

1. **Windows Desktop** (Primary target)
2. **WSL** (Windows Subsystem for Linux)
3. **Linux Desktop**
4. **macOS Desktop**
5. **Web** (Chrome, Firefox, Safari)
6. **Android** (Mobile/Tablet)
7. **iOS** (Mobile/Tablet)

## Platform Detection

The game automatically detects the platform it's running on and applies appropriate optimizations:

```dart
import 'package:zombie_survival_game/platform/platform_utils.dart';

// Check current platform
if (PlatformUtils.isWindows) {
  // Windows-specific code
} else if (PlatformUtils.isWSL) {
  // WSL-specific code
} else if (PlatformUtils.isWeb) {
  // Web-specific code
}
```

## Platform-Specific Optimizations

### Windows Desktop

**Configuration:**
- Target Frame Rate: 60 FPS
- Texture Cache Size: 100 MB
- Audio Buffer: 1024 samples
- Hardware Acceleration: Enabled

**Optimizations:**
- Full graphics quality
- High-performance rendering
- Raw input support
- Hardware-accelerated audio

### WSL (Windows Subsystem for Linux)

**Configuration:**
- Target Frame Rate: 60 FPS
- Texture Cache Size: 50 MB
- Audio Buffer: 2048 samples
- Hardware Acceleration: Enabled

**Optimizations:**
- Reduced texture cache to minimize memory usage
- Larger audio buffer to handle WSL audio latency
- Graphics quality balanced for performance

### Web

**Configuration:**
- Target Frame Rate: 60 FPS
- Texture Cache Size: 50 MB
- Audio Buffer: 2048 samples
- Hardware Acceleration: Enabled

**Optimizations:**
- WebGL rendering
- Compressed textures
- Reduced asset quality
- Larger audio buffers for browser compatibility

### Linux Desktop

**Configuration:**
- Target Frame Rate: 60 FPS
- Texture Cache Size: 100 MB
- Audio Buffer: 1024 samples
- Hardware Acceleration: Enabled

**Optimizations:**
- Native Linux performance
- OpenGL rendering
- Full graphics quality

### macOS Desktop

**Configuration:**
- Target Frame Rate: 60 FPS
- Texture Cache Size: 100 MB
- Audio Buffer: 1024 samples
- Hardware Acceleration: Enabled

**Optimizations:**
- Metal rendering support
- Native macOS performance
- Full graphics quality

### Mobile Platforms (Android/iOS)

**Configuration:**
- Target Frame Rate: 60 FPS
- Texture Cache Size: 50 MB
- Audio Buffer: 1024 samples
- Hardware Acceleration: Enabled

**Optimizations:**
- Touch input support
- Adaptive UI for different screen sizes
- Reduced graphics quality for battery life
- Orientation handling

## Adding New Platform Support

To add support for a new platform:

1. Create a new configuration file in `lib/platform/`
2. Add platform detection logic to `platform_utils.dart`
3. Update the platform configuration map
4. Implement platform-specific optimizations in the main game class

Example for a new platform:

```dart
// lib/platform/new_platform_config.dart
class NewPlatformConfig {
  static const int targetFrameRate = 60;
  static const int maxTextureCacheSize = 75;
  // ... other settings
}

// lib/platform/platform_utils.dart
static final Map<String, dynamic> _newPlatformConfig = {
  'targetFrameRate': 60,
  'maxTextureCacheSize': 75,
  // ... other settings
};

static bool get isNewPlatform => /* detection logic */;

// In game class
if (PlatformUtils.isNewPlatform) {
  // Apply new platform optimizations
}
```

## Performance Considerations

### Windows PowerShell vs CMD vs WSL

The game runs optimally on all three Windows environments:

1. **PowerShell**: Full support with no additional configuration
2. **CMD**: Full support with no additional configuration
3. **WSL**: Slight performance reduction due to subsystem overhead

### Path Handling

All paths in the project use relative paths to ensure compatibility across platforms:

```yaml
# pubspec.yaml
flutter:
  assets:
    - assets/images/
    - assets/audio/
```

No absolute paths like `C:\Windows\System32` are used anywhere in the project.

## Testing Platform Compatibility

To test on different platforms:

1. **Windows**: Run `scripts\run_game.bat` or `scripts\run_game.ps1`
2. **WSL**: Run `./scripts/run_game.sh` from WSL terminal
3. **Web**: Run `flutter run -d chrome`
4. **Linux**: Run `./scripts/run_game.sh`
5. **macOS**: Run `./scripts/run_game.sh`

## Build and Deployment

Platform-specific build scripts are provided:

1. **Windows**: `scripts\build_release.bat` or `scripts\build_release.ps1`
2. **WSL/Linux/macOS**: `./scripts/build_release.sh`

Each script builds for the appropriate platform with optimized settings.