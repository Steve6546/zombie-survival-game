import 'package:flame/components.dart';
import 'package:flame/collisions.dart';

class Zombie extends SpriteComponent with CollisionCallbacks {
  double speed = 100.0;
  double health = 100.0;
  double maxHealth = 100.0;
  final Vector2 velocity = Vector2.zero();

  @override
  Future<void> onLoad() async {
    try {
      super.onLoad();
      // Load zombie sprite
      // For now, we'll use a simple rectangle as a placeholder
      size = Vector2(32, 32);
      anchor = Anchor.center;
      
      // Add collision detection
      add(CircleHitbox(radius: 16));
    } catch (e) {
      print('Error loading zombie: $e');
    }
  }

  @override
  void update(double dt) {
    try {
      super.update(dt);
      // Zombie AI logic would go here
      // For now, just move randomly
    } catch (e) {
      print('Error updating zombie: $e');
    }
  }

  void takeDamage(double damage) {
    try {
      health -= damage;
      if (health <= 0) {
        die();
      }
    } catch (e) {
      print('Error taking damage: $e');
    }
  }

  void die() {
    try {
      // Handle zombie death
      removeFromParent();
    } catch (e) {
      print('Error handling zombie death: $e');
    }
  }
  
  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    try {
      super.onCollisionStart(intersectionPoints, other);
      // Zombie collision logic would go here
    } catch (e) {
      print('Error handling zombie collision: $e');
    }
  }
}