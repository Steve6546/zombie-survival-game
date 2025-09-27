import 'dart:math';
import 'package:flame/components.dart';
import '../components/zombie.dart';

class WaveManager {
  int currentWave = 1;
  int zombiesRemaining = 0;
  int zombiesSpawned = 0;
  final Random random = Random();
  
  // Wave configuration
  int get zombiesInWave => max(1, 5 + (currentWave * 2));
  double get zombieSpawnInterval => max(0.5, 2.0 - (currentWave * 0.1));
  double get zombieSpeed => max(50.0, 50.0 + (currentWave * 10.0));
  double get zombieHealth => max(50.0, 50.0 + (currentWave * 25.0));

  bool get waveComplete => zombiesRemaining <= 0 && zombiesSpawned >= zombiesInWave;
  
  void startWave() {
    try {
      zombiesRemaining = zombiesInWave;
      zombiesSpawned = 0;
      print('Starting wave $currentWave with $zombiesInWave zombies');
    } catch (e) {
      print('Error starting wave: $e');
    }
  }
  
  Zombie? spawnZombie(Vector2 playerPosition) {
    try {
      if (zombiesSpawned >= zombiesInWave || zombiesRemaining <= 0) {
        return null;
      }
      
      zombiesSpawned++;
      zombiesRemaining++;
      
      // Spawn zombie at a random edge of the map
      final spawnSide = random.nextInt(4);
      final zombie = Zombie();
      
      switch (spawnSide) {
        case 0: // Top
          zombie.position = Vector2(random.nextDouble() * 640, -32);
          break;
        case 1: // Right
          zombie.position = Vector2(640 + 32, random.nextDouble() * 480);
          break;
        case 2: // Bottom
          zombie.position = Vector2(random.nextDouble() * 640, 480 + 32);
          break;
        case 3: // Left
          zombie.position = Vector2(-32, random.nextDouble() * 480);
          break;
        default:
          // Default to top spawn if invalid spawnSide
          zombie.position = Vector2(random.nextDouble() * 640, -32);
      }
      
      // Configure zombie based on current wave
      zombie.speed = zombieSpeed;
      zombie.health = zombieHealth;
      
      return zombie;
    } catch (e) {
      print('Error spawning zombie: $e');
      return null;
    }
  }
  
  void onZombieKilled() {
    try {
      zombiesRemaining = max(0, zombiesRemaining - 1);
    } catch (e) {
      print('Error updating zombie count: $e');
    }
  }
  
  void nextWave() {
    try {
      currentWave++;
      print('Advancing to wave $currentWave');
    } catch (e) {
      print('Error advancing to next wave: $e');
    }
  }
}