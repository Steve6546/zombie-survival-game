import 'package:flutter_test/flutter_test.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_test/flame_test.dart';
import 'package:zombie_survival_game/game/components/player.dart';

void main() {
  group('Player', () {
    testWithGame('player initializes with correct properties', ZombieSurvivalGame.new, (game) async {
      final player = Player();
      await game.ensureAdd(player);
      
      expect(player.health, equals(100.0));
      expect(player.maxHealth, equals(100.0));
      expect(player.size, equals(Vector2(32, 32)));
    });

    testWithGame('player takes damage correctly', ZombieSurvivalGame.new, (game) async {
      final player = Player();
      await game.ensureAdd(player);
      
      final initialHealth = player.health;
      player.takeDamage(25.0);
      
      expect(player.health, equals(initialHealth - 25.0));
    });

    testWithGame('player dies when health reaches zero', ZombieSurvivalGame.new, (game) async {
      final player = Player();
      await game.ensureAdd(player);
      
      player.takeDamage(100.0);
      
      // Player should reset health and position when "dying"
      expect(player.health, equals(player.maxHealth));
      expect(player.position, equals(Vector2(100, 100)));
    });
  });
}