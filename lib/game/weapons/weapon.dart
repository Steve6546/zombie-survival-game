import 'package:flame/components.dart';
import 'projectile.dart';

abstract class Weapon extends Component {
  final String name;
  final double damage;
  final double fireRate; // Attacks per second
  double lastFired = 0;

  Weapon({
    required this.name,
    required this.damage,
    required this.fireRate,
  });

  bool canFire(double currentTime) {
    return (currentTime - lastFired) >= (1.0 / fireRate);
  }

  void fire(double currentTime) {
    if (canFire(currentTime)) {
      lastFired = currentTime;
      performAttack();
    }
  }

  void performAttack();
}

class MeleeWeapon extends Weapon {
  final double range;

  MeleeWeapon({
    required super.name,
    required super.damage,
    required super.fireRate,
    required this.range,
  });

  @override
  void performAttack() {
    // Melee attack logic
    // This would typically check for enemies in range
    print('Performing melee attack with $name dealing $damage damage within $range range');
    
    // In a real implementation, we would:
    // 1. Check for nearby enemies within range
    // 2. Apply damage to those enemies
    // 3. Play attack animation/sound effects
    // 4. Handle any special effects (knockback, etc.)
  }
}

class RangedWeapon extends Weapon {
  final double projectileSpeed;

  RangedWeapon({
    required super.name,
    required super.damage,
    required super.fireRate,
    required this.projectileSpeed,
  });

  @override
  void performAttack() {
    // Ranged attack logic
    // This would typically spawn a projectile
    print('Performing ranged attack with $name dealing $damage damage at speed $projectileSpeed');
    
    // In a real implementation, we would:
    // 1. Determine the direction to fire (based on player aim)
    // 2. Create a projectile with the specified speed and damage
    // 3. Add the projectile to the game world
    // 4. Play attack animation/sound effects
  }
  
  void fireProjectile(Vector2 position, Vector2 direction) {
    try {
      final projectile = Projectile(
        position: position,
        direction: direction,
        speed: projectileSpeed,
        damage: damage,
      );
      
      // Add projectile to the game
      // This requires access to the game reference
      print('Firing projectile from $position in direction $direction');
    } catch (e) {
      print('Error firing projectile: $e');
    }
  }
}