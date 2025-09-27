import 'package:flutter_test/flutter_test.dart';
import 'package:flame_test/flame_test.dart';
import 'package:zombie_survival_game/game/zombie_survival_game.dart';
import 'package:zombie_survival_game/game/components/player.dart';
import 'package:zombie_survival_game/game/components/zombie.dart';
import 'package:zombie_survival_game/game/resources/resource_manager.dart';

void main() {
  group('Integration Tests', () {
    testWithGame('game initializes correctly', ZombieSurvivalGame.new, (game) async {
      expect(game, isNotNull);
      expect(game is ZombieSurvivalGame, isTrue);
    });

    testWithGame('player and zombie can be added to game', ZombieSurvivalGame.new, (game) async {
      final player = Player();
      final zombie = Zombie();
      
      await game.ensureAdd(player);
      await game.ensureAdd(zombie);
      
      expect(game.children.length, greaterThanOrEqualTo(2));
      expect(player.isMounted, isTrue);
      expect(zombie.isMounted, isTrue);
    });

    test('resource manager functions correctly', () {
      final resourceManager = ResourceManager();
      
      // Test initial state
      expect(resourceManager.coins, equals(0));
      expect(resourceManager.wood, equals(0));
      expect(resourceManager.metal, equals(0));
      expect(resourceManager.food, equals(0));
      
      // Test adding resources
      resourceManager.addCoins(100);
      resourceManager.addWood(50);
      
      expect(resourceManager.coins, equals(100));
      expect(resourceManager.wood, equals(50));
      
      // Test spending resources
      final canAfford = resourceManager.canAfford(50, 25, 0, 0);
      expect(canAfford, isTrue);
      
      final spent = resourceManager.spendResources(50, 25, 0, 0);
      expect(spent, isTrue);
      
      expect(resourceManager.coins, equals(50));
      expect(resourceManager.wood, equals(25));
    });

    testWithGame('combat system works', ZombieSurvivalGame.new, (game) async {
      final player = Player();
      final zombie = Zombie();
      
      await game.ensureAdd(player);
      await game.ensureAdd(zombie);
      
      // Set positions close to each other
      player.position = Vector2(100, 100);
      zombie.position = Vector2(110, 100);
      
      // Test damage system
      final initialZombieHealth = zombie.health;
      zombie.takeDamage(25.0);
      
      expect(zombie.health, equals(initialZombieHealth - 25.0));
      
      // Test zombie death
      zombie.takeDamage(zombie.health); // Deal remaining damage
      expect(zombie.isRemoved, isTrue);
    });
  });
}