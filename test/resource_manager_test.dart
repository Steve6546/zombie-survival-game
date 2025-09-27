import 'package:flutter_test/flutter_test.dart';
import 'package:zombie_survival_game/game/resources/resource_manager.dart';

void main() {
  group('ResourceManager', () {
    late ResourceManager resourceManager;

    setUp(() {
      resourceManager = ResourceManager();
    });

    test('resource manager initializes with zero resources', () {
      expect(resourceManager.coins, equals(0));
      expect(resourceManager.wood, equals(0));
      expect(resourceManager.metal, equals(0));
      expect(resourceManager.food, equals(0));
    });

    test('can add resources', () {
      resourceManager.addCoins(100);
      resourceManager.addWood(50);
      resourceManager.addMetal(25);
      resourceManager.addFood(10);
      
      expect(resourceManager.coins, equals(100));
      expect(resourceManager.wood, equals(50));
      expect(resourceManager.metal, equals(25));
      expect(resourceManager.food, equals(10));
    });

    test('can check if can afford resources', () {
      resourceManager.addCoins(100);
      resourceManager.addWood(50);
      
      expect(resourceManager.canAfford(50, 25, 0, 0), isTrue);
      expect(resourceManager.canAfford(150, 25, 0, 0), isFalse);
    });

    test('can spend resources', () {
      resourceManager.addCoins(100);
      resourceManager.addWood(50);
      
      final success = resourceManager.spendResources(50, 25, 0, 0);
      
      expect(success, isTrue);
      expect(resourceManager.coins, equals(50));
      expect(resourceManager.wood, equals(25));
    });

    test('cannot spend more resources than available', () {
      resourceManager.addCoins(10);
      
      final success = resourceManager.spendResources(50, 0, 0, 0);
      
      expect(success, isFalse);
      expect(resourceManager.coins, equals(10)); // Should not have changed
    });

    test('can upgrade weapon', () {
      resourceManager.addCoins(100);
      resourceManager.addWood(50);
      resourceManager.addMetal(25);
      
      final initialDamage = resourceManager.weaponDamage;
      resourceManager.upgradeWeapon();
      
      expect(resourceManager.weaponDamage, greaterThan(initialDamage));
      expect(resourceManager.weaponLevel, equals(2));
    });
  });
}