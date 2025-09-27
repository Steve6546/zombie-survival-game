# Troubleshooting Guide

This guide helps resolve common issues when setting up and running the Zombie Survival Game across different platforms.

## General Issues

### Flutter Not Found

**Problem**: Command `flutter` is not recognized.

**Solutions**:
1. **Verify Flutter Installation**:
   ```bash
   # Check if Flutter directory exists
   ls flutter/bin/flutter  # Linux/macOS
   dir flutter\bin\flutter.bat  # Windows
   ```

2. **Add Flutter to PATH**:
   - **Windows**:
     ```powershell
     # Add to PATH (temporary)
     $env:PATH += ";C:\flutter\bin"
     
     # Add to PATH (permanent)
     # System Properties → Advanced → Environment Variables → Path → Edit → Add C:\flutter\bin
     ```
   
   - **Linux/macOS**:
     ```bash
     # Add to ~/.bashrc or ~/.zshrc
     export PATH="$PATH:/path/to/flutter/bin"
     source ~/.bashrc
     ```

3. **Restart Terminal**: Close and reopen your terminal/command prompt.

### Pub Get Failures

**Problem**: `flutter pub get` fails with network or dependency issues.

**Solutions**:
1. **Check Internet Connection**:
   ```bash
   ping pub.dev
   ```

2. **Use Flutter Pub Cache Repair**:
   ```bash
   flutter pub pub cache repair
   ```

3. **Clear Pub Cache**:
   ```bash
   flutter pub cache clean
   flutter pub get
   ```

4. **Check Proxy Settings** (if behind corporate firewall):
   ```bash
   # Set proxy if needed
   export HTTP_PROXY=http://proxy.company.com:8080
   export HTTPS_PROXY=http://proxy.company.com:8080
   ```

## Windows-Specific Issues

### PowerShell Script Execution Blocked

**Problem**: Scripts won't run with error about execution policy.

**Solution**:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Path with Spaces

**Problem**: Flutter installed in path with spaces causes issues.

**Solution**:
- Install Flutter in path without spaces (e.g., `C:\flutter` instead of `C:\Program Files\flutter`)

### Windows Defender SmartScreen

**Problem**: Windows blocks execution of downloaded scripts.

**Solution**:
- Right-click on script → Properties → Check "Unblock"

### CMD vs PowerShell

**Problem**: Some commands work in PowerShell but not CMD.

**Solution**:
- Use PowerShell for better compatibility
- For CMD, use `.bat` scripts instead of `.ps1`

## WSL-Specific Issues

### Flutter Not Found After Reboot

**Problem**: Flutter command not found after WSL restart.

**Solution**:
1. **Check PATH in shell configuration**:
   ```bash
   # Edit ~/.bashrc or ~/.zshrc
   nano ~/.bashrc
   
   # Add line:
   export PATH="$PATH:/path/to/flutter/bin"
   
   # Reload configuration
   source ~/.bashrc
   ```

2. **Verify Flutter location**:
   ```bash
   # Check if Flutter exists
   ls /path/to/flutter/bin/flutter
   ```

### Performance Issues in WSL

**Problem**: Game runs slowly in WSL.

**Solutions**:
1. **Use WSL 2**:
   ```powershell
   # Check WSL version
   wsl -l -v
   
   # Upgrade to WSL 2 if needed
   wsl --set-version <distro-name> 2
   ```

2. **Store Project in Linux Filesystem**:
   ```bash
   # Good: Store in ~/projects/
   # Bad: Store in /mnt/c/projects/
   ```

3. **Increase WSL Memory**:
   ```bash
   # Create or edit ~/.wslconfig
   nano ~/.wslconfig
   
   # Add:
   [wsl2]
   memory=4GB
   processors=2
   ```

### Audio Issues in WSL

**Problem**: No sound or audio distortion.

**Solutions**:
1. **Install PulseAudio**:
   ```bash
   sudo apt install pulseaudio
   ```

2. **Configure PulseAudio**:
   ```bash
   # Add to ~/.bashrc
   export PULSE_SERVER=tcp:127.0.0.1:4713
   ```

3. **Start PulseAudio**:
   ```bash
   pulseaudio --daemonize
   ```

## Web-Specific Issues

### Browser Compatibility

**Problem**: Game doesn't load in certain browsers.

**Solutions**:
1. **Use Supported Browsers**:
   - Chrome (recommended)
   - Firefox
   - Safari (macOS)
   - Edge

2. **Enable WebGL**:
   - Chrome: `chrome://flags/#enable-webgl` → Enable
   - Firefox: `about:config` → `webgl.force-enabled` → true

3. **Check Console for Errors**:
   - Press F12 → Console tab

### CORS Issues

**Problem**: Assets fail to load due to CORS policy.

**Solutions**:
1. **Serve from Same Origin**:
   ```bash
   # Use a local web server
   python -m http.server 8000
   ```

2. **Disable CORS in Development**:
   - Chrome: Start with `--disable-web-security` flag
   - **Warning**: Only for development, not production

## Mobile-Specific Issues

### Android Emulator Issues

**Problem**: Android emulator won't start or is slow.

**Solutions**:
1. **Enable Hardware Acceleration**:
   - Intel: Enable VT-x in BIOS
   - AMD: Enable SVM in BIOS
   - Windows: Enable Hyper-V

2. **Use Physical Device**:
   - Enable Developer Options
   - Enable USB Debugging

3. **Create New AVD**:
   ```bash
   flutter emulators --create
   ```

### iOS Simulator Issues (macOS)

**Problem**: iOS simulator won't start.

**Solutions**:
1. **Install Xcode**:
   ```bash
   xcode-select --install
   ```

2. **Open Simulator Manually**:
   ```bash
   open -a Simulator
   ```

3. **Check Xcode Command Line Tools**:
   ```bash
   sudo xcode-select --switch /Applications/Xcode.app
   ```

## Performance Issues

### Low Frame Rate

**Problem**: Game runs slowly with low FPS.

**Solutions**:
1. **Check System Requirements**:
   - Ensure minimum RAM and CPU requirements are met

2. **Reduce Graphics Quality**:
   - Modify settings in platform configuration files

3. **Close Other Applications**:
   - Free up system resources

4. **Profile Performance**:
   ```bash
   flutter run --profile
   ```

### High Memory Usage

**Problem**: Game uses excessive memory.

**Solutions**:
1. **Reduce Texture Cache**:
   - Modify `maxTextureCacheSize` in platform config

2. **Optimize Assets**:
   - Compress images
   - Use appropriate resolutions

3. **Monitor Memory Usage**:
   ```bash
   flutter run --verbose
   ```

## Testing Issues

### Tests Fail to Run

**Problem**: Unit tests fail or don't execute.

**Solutions**:
1. **Check Test Dependencies**:
   ```bash
   flutter pub get
   ```

2. **Run Specific Tests**:
   ```bash
   flutter test test/player_test.dart
   ```

3. **Check Test Output**:
   ```bash
   flutter test --verbose
   ```

### Integration Tests Fail

**Problem**: Integration tests fail with timeout or connection issues.

**Solutions**:
1. **Increase Timeout**:
   ```dart
   // In test file
   testWithGame('test name', Game.new, (game) async {
     // Test code
   }, timeout: Timeout(Duration(seconds: 30)));
   ```

2. **Check Game Initialization**:
   - Ensure game loads completely before tests run

## Build Issues

### Build Fails

**Problem**: Release build fails with compilation errors.

**Solutions**:
1. **Clean Build**:
   ```bash
   flutter clean
   flutter pub get
   flutter build windows  # or other platform
   ```

2. **Check for Errors**:
   ```bash
   flutter analyze
   ```

3. **Update Dependencies**:
   ```bash
   flutter pub upgrade
   ```

### Build Takes Too Long

**Problem**: Build process is extremely slow.

**Solutions**:
1. **Use Build Cache**:
   ```bash
   flutter build windows --debug  # Faster debug builds
   ```

2. **Increase System Resources**:
   - Close other applications
   - Ensure sufficient disk space

3. **Split Large Builds**:
   ```bash
   # Build for one platform at a time
   flutter build windows
   flutter build web
   ```

## Environment Issues

### Multiple Flutter Versions

**Problem**: Conflicting Flutter installations.

**Solutions**:
1. **Check Current Version**:
   ```bash
   flutter --version
   which flutter  # Linux/macOS
   where flutter  # Windows
   ```

2. **Use Flutter Version Manager**:
   - FVM (Flutter Version Management)

3. **Remove Old Installations**:
   - Delete old Flutter directories
   - Update PATH to point to correct installation

### IDE Integration Issues

**Problem**: IDE doesn't recognize Flutter project.

**Solutions**:
1. **Restart IDE**:
   - Close and reopen IDE

2. **Reimport Project**:
   - File → Open → Select project directory

3. **Check Flutter Plugin**:
   - VS Code: Extensions → Flutter
   - Android Studio: Plugins → Flutter

## Getting Additional Help

### Community Resources

1. **Flutter Community**:
   - Discord: [Flutter Community](https://discord.gg/N7Yshp4)
   - Reddit: r/FlutterDev

2. **Stack Overflow**:
   - Tag questions with `flutter` and `flame`

3. **GitHub Issues**:
   - Check existing issues in Flutter and Flame repositories

### Reporting Issues

When reporting issues, include:
1. **Platform Information**:
   ```bash
   flutter doctor -v
   ```

2. **Error Messages**:
   - Complete error output
   - Steps to reproduce

3. **Project Information**:
   - Flutter version
   - Flame version
   - Operating system

4. **Screenshots** (if applicable):
   - Error dialogs
   - Performance graphs