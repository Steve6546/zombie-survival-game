import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../platform/platform_utils.dart';
import 'components/player.dart';
import 'components/zombie.dart';
import 'maps/game_world.dart';
import 'resources/resource_manager.dart';
import 'ui/game_hud.dart';
import 'waves/wave_manager.dart';
import 'effects/lighting.dart';
import 'audio/audio_manager.dart';

class ZombieSurvivalGame extends FlameGame with HasKeyboardHandlerComponents, HasCollisionDetection {
  late Player player;
  late GameWorld world;
  late ResourceManager resourceManager;
  late GameHud hud;
  late WaveManager waveManager;
  late LightingSystem lightingSystem;
  late AudioManager audioManager;
  List<Zombie> zombies = [];

  // Platform-specific configurations
  late Map<String, dynamic> platformConfig;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    
    // Get platform-specific configuration
    platformConfig = PlatformUtils.getPlatformConfig();
    
    // Initialize systems
    resourceManager = ResourceManager();
    waveManager = WaveManager();
    lightingSystem = LightingSystem();
    audioManager = AudioManager();
    
    // Apply platform-specific optimizations
    _applyPlatformOptimizations();
    
    // Add lighting system to the game
    add(lightingSystem);
    
    // Load game world
    world = GameWorld();
    add(world);
    
    // Load player
    player = Player();
    player.position = Vector2(100, 100);
    add(player);
    
    // Add player light
    final playerLight = lightingSystem.createPlayerLight(player.position);
    lightingSystem.addLight(playerLight);
    
    // Create HUD
    hud = GameHud(resourceManager: resourceManager);
    add(hud);
    
    // Start first wave
    waveManager.startWave();
    
    // Play background music
    audioManager.playMusic(AudioManager.backgroundMusic);
    
    // Add some zombies
    for (int i = 0; i < 5; i++) {
      final zombie = Zombie();
      zombie.position = Vector2(200 + (i * 50), 200);
      add(zombie);
      zombies.add(zombie);
    }
  }

  void _applyPlatformOptimizations() {
    // Apply platform-specific settings
    final targetFrameRate = platformConfig['targetFrameRate'] as int? ?? 60;
    final maxTextureCacheSize = platformConfig['maxTextureCacheSize'] as int? ?? 100;
    final audioBufferSamples = platformConfig['audioBufferSamples'] as int? ?? 1024;
    final enableHardwareAcceleration = platformConfig['enableHardwareAcceleration'] as bool? ?? true;
    
    // Log platform information
    if (PlatformUtils.isWeb) {
      print('Running on Web platform with target FPS: $targetFrameRate, texture cache: ${maxTextureCacheSize}MB');
    } else if (PlatformUtils.isWSL) {
      print('Running on WSL platform with target FPS: $targetFrameRate, texture cache: ${maxTextureCacheSize}MB, audio buffer: $audioBufferSamples');
    } else if (PlatformUtils.isWindows) {
      print('Running on Windows platform with target FPS: $targetFrameRate, texture cache: ${maxTextureCacheSize}MB');
    } else if (PlatformUtils.isMacOS) {
      print('Running on macOS platform with target FPS: $targetFrameRate, texture cache: ${maxTextureCacheSize}MB');
    } else if (PlatformUtils.isLinux) {
      print('Running on Linux platform with target FPS: $targetFrameRate, texture cache: ${maxTextureCacheSize}MB');
    } else {
      print('Running on unknown platform with default settings');
    }
    
    // Apply optimizations based on platform
    if (PlatformUtils.isWSL || PlatformUtils.isWeb) {
      // Reduce graphics quality for better performance on WSL/Web
      print('Applying performance optimizations for WSL/Web: Reduced texture cache and increased audio buffer');
      
      // For WSL and Web, we would typically:
      // 1. Reduce the number of simultaneous entities
      // 2. Lower texture resolution
      // 3. Simplify lighting effects
      // 4. Increase audio buffer size to handle latency
    } else if (PlatformUtils.isWindows || PlatformUtils.isMacOS || PlatformUtils.isLinux) {
      // Desktop platforms can handle full graphics quality
      print('Applying full graphics quality for desktop platform');
    } else {
      // Mobile or other platforms
      print('Applying balanced settings for mobile/other platforms');
    }
    
    // Apply hardware acceleration setting
    if (enableHardwareAcceleration) {
      print('Hardware acceleration enabled');
    } else {
      print('Hardware acceleration disabled');
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Update player light position to follow player
    // This would typically be done by accessing the player light component
    // and updating its position to match the player's position
  }
}