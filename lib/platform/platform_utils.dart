import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';

class PlatformUtils {
  // Platform detection
  static bool get isWindows {
    try {
      return defaultTargetPlatform == TargetPlatform.windows;
    } catch (e) {
      print('Error detecting Windows platform: $e');
      return false;
    }
  }
  
  static bool get isMacOS {
    try {
      return defaultTargetPlatform == TargetPlatform.macOS;
    } catch (e) {
      print('Error detecting macOS platform: $e');
      return false;
    }
  }
  
  static bool get isLinux {
    try {
      return defaultTargetPlatform == TargetPlatform.linux;
    } catch (e) {
      print('Error detecting Linux platform: $e');
      return false;
    }
  }
  
  static bool get isAndroid {
    try {
      return defaultTargetPlatform == TargetPlatform.android;
    } catch (e) {
      print('Error detecting Android platform: $e');
      return false;
    }
  }
  
  static bool get isIOS {
    try {
      return defaultTargetPlatform == TargetPlatform.iOS;
    } catch (e) {
      print('Error detecting iOS platform: $e');
      return false;
    }
  }
  
  static bool get isFuchsia {
    try {
      return defaultTargetPlatform == TargetPlatform.fuchsia;
    } catch (e) {
      print('Error detecting Fuchsia platform: $e');
      return false;
    }
  }
  
  // Web detection
  static bool get isWeb {
    try {
      return kIsWeb;
    } catch (e) {
      print('Error detecting web platform: $e');
      return false;
    }
  }
  
  // WSL detection
  static bool get isWSL {
    try {
      if (!isWindows) return false;
      
      // Check if running in WSL environment
      // This is a simplified check - in reality, you might need more sophisticated detection
      try {
        final envVars = Platform.environment;
        return envVars.containsKey('WSL_DISTRO_NAME') || 
               (envVars.containsKey('PATH') && envVars['PATH']!.contains('/mnt/c'));
      } catch (e) {
        return false;
      }
    } catch (e) {
      print('Error detecting WSL environment: $e');
      return false;
    }
  }
  
  // Get appropriate configuration based on platform
  static Map<String, dynamic> getPlatformConfig() {
    try {
      if (isWeb) {
        return _webConfig;
      } else if (isWSL) {
        return _wslConfig;
      } else if (isWindows) {
        return _windowsConfig;
      } else if (isMacOS) {
        return _macOSConfig;
      } else if (isLinux) {
        return _linuxConfig;
      } else if (isAndroid) {
        return _androidConfig;
      } else if (isIOS) {
        return _iOSConfig;
      } else {
        return _defaultConfig;
      }
    } catch (e) {
      print('Error getting platform configuration: $e');
      return _defaultConfig;
    }
  }
  
  // Configuration maps
  static final Map<String, dynamic> _webConfig = {
    'targetFrameRate': 60,
    'maxTextureCacheSize': 50,
    'audioBufferSamples': 2048,
    'enableHardwareAcceleration': true,
  };
  
  static final Map<String, dynamic> _wslConfig = {
    'targetFrameRate': 60,
    'maxTextureCacheSize': 50,
    'audioBufferSamples': 2048,
    'enableHardwareAcceleration': true,
  };
  
  static final Map<String, dynamic> _windowsConfig = {
    'targetFrameRate': 60,
    'maxTextureCacheSize': 100,
    'audioBufferSamples': 1024,
    'enableHardwareAcceleration': true,
  };
  
  static final Map<String, dynamic> _macOSConfig = {
    'targetFrameRate': 60,
    'maxTextureCacheSize': 100,
    'audioBufferSamples': 1024,
    'enableHardwareAcceleration': true,
  };
  
  static final Map<String, dynamic> _linuxConfig = {
    'targetFrameRate': 60,
    'maxTextureCacheSize': 100,
    'audioBufferSamples': 1024,
    'enableHardwareAcceleration': true,
  };
  
  static final Map<String, dynamic> _androidConfig = {
    'targetFrameRate': 60,
    'maxTextureCacheSize': 50,
    'audioBufferSamples': 1024,
    'enableHardwareAcceleration': true,
  };
  
  static final Map<String, dynamic> _iOSConfig = {
    'targetFrameRate': 60,
    'maxTextureCacheSize': 50,
    'audioBufferSamples': 1024,
    'enableHardwareAcceleration': true,
  };
  
  static final Map<String, dynamic> _defaultConfig = {
    'targetFrameRate': 60,
    'maxTextureCacheSize': 50,
    'audioBufferSamples': 1024,
    'enableHardwareAcceleration': true,
  };
}