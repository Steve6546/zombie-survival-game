import 'package:flutter/foundation.dart';

class WSLConfig {
  // WSL-specific optimizations
  static const bool enableWSLOptimizations = true;
  
  // Rendering settings
  static const int targetFrameRate = 60;
  static const bool useHardwareAcceleration = true;
  
  // Memory management
  static const int maxTextureCacheSize = 50; // MB (lower for WSL)
  static const bool enableTextureCompression = true;
  
  // Audio settings
  static const int audioBufferSamples = 2048; // Larger buffer for WSL
  static const int audioSampleRate = 44100;
  
  // File system settings
  static const String saveDirectory = '.local/share/ZombieSurvival';
  
  // Performance monitoring
  static const bool enablePerformanceLogging = false;
  
  // Check if we're running on WSL
  static bool get isWSL {
    // This is a simplified check - in reality, you might need more sophisticated detection
    return false; // Placeholder
  }
  
  // Get optimized settings for WSL
  static WSLConfig get optimizedSettings {
    return WSLConfig();
  }
}