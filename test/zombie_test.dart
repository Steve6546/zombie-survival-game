import 'package:flutter_test/flutter_test.dart';
import 'package:flame/components.dart';
import 'package:flame_test/flame_test.dart';
import 'package:zombie_survival_game/game/components/zombie.dart';
import 'package:zombie_survival_game/game/zombie_survival_game.dart';

void main() {
  group('Zombie', () {
    testWithGame('zombie initializes with correct properties', ZombieSurvivalGame.new, (game) async {
      final zombie = Zombie();
      await game.ensureAdd(zombie);
      
      expect(zombie.health, equals(100.0));
      expect(zombie.maxHealth, equals(100.0));
      expect(zombie.speed, equals(100.0));
      expect(zombie.size, equals(Vector2(32, 32)));
    });

    testWithGame('zombie takes damage correctly', ZombieSurvivalGame.new, (game) async {
      final zombie = Zombie();
      await game.ensureAdd(zombie);
      
      final initialHealth = zombie.health;
      zombie.takeDamage(30.0);
      
      expect(zombie.health, equals(initialHealth - 30.0));
    });

    testWithGame('zombie dies when health reaches zero', ZombieSurvivalGame.new, (game) async {
      final zombie = Zombie();
      await game.ensureAdd(zombie);
      
      zombie.takeDamage(100.0);
      
      // Zombie should be removed from parent when dying
      expect(zombie.isRemoved, isTrue);
    });
  });
}