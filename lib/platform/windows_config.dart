import 'package:flutter/foundation.dart';

class WindowsConfig {
  // Windows-specific optimizations
  static const bool enableHighPerformanceMode = true;
  
  // Rendering settings
  static const int targetFrameRate = 60;
  static const bool useHardwareAcceleration = true;
  
  // Memory management
  static const int maxTextureCacheSize = 100; // MB
  static const bool enableTextureCompression = true;
  
  // Audio settings
  static const int audioBufferSamples = 1024;
  static const int audioSampleRate = 44100;
  
  // Input settings
  static const bool enableRawInput = true;
  static const bool enableHighPrecisionMouse = true;
  
  // File system settings
  static const String saveDirectory = 'AppData/Local/ZombieSurvival';
  
  // Performance monitoring
  static const bool enablePerformanceLogging = false;
  
  // Check if we're running on Windows
  static bool get isWindows => defaultTargetPlatform == TargetPlatform.windows;
  
  // Get optimized settings for Windows
  static WindowsConfig get optimizedSettings {
    return WindowsConfig();
  }
}