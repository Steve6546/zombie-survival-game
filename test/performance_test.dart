import 'package:flutter_test/flutter_test.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:zombie_survival_game/game/zombie_survival_game.dart';
import 'package:zombie_survival_game/game/components/player.dart';
import 'package:zombie_survival_game/game/components/zombie.dart';

void main() {
  group('Performance Tests', () {
    test('game maintains stable frame rate with multiple entities', () async {
      final game = ZombieSurvivalGame();
      await game.onLoad();
      
      // Add player
      final player = Player();
      player.position = Vector2(100, 100);
      await game.ensureAdd(player);
      
      // Add multiple zombies to test performance
      const zombieCount = 50;
      final zombies = <Zombie>[];
      
      for (int i = 0; i < zombieCount; i++) {
        final zombie = Zombie();
        zombie.position = Vector2(200 + (i * 10) % 400, 200 + (i * 15) % 300);
        zombies.add(zombie);
        await game.ensureAdd(zombie);
      }
      
      // Simulate game loop for 1 second (60 frames)
      final stopwatch = Stopwatch()..start();
      double totalTime = 0;
      
      for (int frame = 0; frame < 60; frame++) {
        final frameTime = stopwatch.elapsedMilliseconds;
        game.update(1/60); // 60 FPS
        totalTime += stopwatch.elapsedMilliseconds - frameTime;
      }
      
      final averageFrameTime = totalTime / 60;
      final fps = 1000 / averageFrameTime;
      
      // Expect at least 30 FPS (reasonable for a game with 50+ entities)
      expect(fps, greaterThan(30));
      
      print('Performance test results:');
      print('Entities: ${zombies.length + 1} (1 player + $zombieCount zombies)');
      print('Average frame time: ${averageFrameTime.toStringAsFixed(2)} ms');
      print('Estimated FPS: ${fps.toStringAsFixed(2)}');
    });
    
    test('component update performance', () async {
      final game = ZombieSurvivalGame();
      await game.onLoad();
      
      // Create components
      final player = Player();
      player.position = Vector2(100, 100);
      await game.ensureAdd(player);
      
      // Measure update performance
      final stopwatch = Stopwatch()..start();
      
      // Run 1000 update cycles
      for (int i = 0; i < 1000; i++) {
        player.update(1/60);
      }
      
      stopwatch.stop();
      final updateTime = stopwatch.elapsedMilliseconds;
      
      // Should complete in reasonable time (less than 100ms for 1000 updates)
      expect(updateTime, lessThan(100));
      
      print('Component update performance:');
      print('1000 player updates took ${updateTime}ms');
      print('Average update time: ${(updateTime / 1000).toStringAsFixed(4)}ms');
    });
  });
}