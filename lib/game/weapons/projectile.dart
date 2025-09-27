import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import '../components/zombie.dart';

class Projectile extends PositionComponent with CollisionCallbacks {
  final double speed;
  final double damage;
  final Vector2 direction;
  bool isActive = true;

  Projectile({
    required Vector2 position,
    required this.direction,
    required this.speed,
    required this.damage,
  }) : super(position: position, size: Vector2.all(8)) {
    try {
      // Normalize direction vector
      this.direction.normalize();
    } catch (e) {
      print('Error normalizing direction vector: $e');
    }
  }

  @override
  Future<void> onLoad() async {
    try {
      super.onLoad();
      
      // Visual representation of the projectile
      add(CircleComponent(
        radius: 4,
        paint: Paint()..color = const Color(0xFFFF0000),
      ));
      
      // Add collision detection
      add(CircleHitbox(radius: 4));
    } catch (e) {
      print('Error loading projectile: $e');
    }
  }

  @override
  void update(double dt) {
    try {
      super.update(dt);
      
      if (!isActive) return;
      
      // Move the projectile in the specified direction
      position += direction * speed * dt;
      
      // Remove projectile if it goes off-screen (simplified check)
      if (position.x < -50 || position.x > 800 || position.y < -50 || position.y > 600) {
        removeFromParent();
      }
    } catch (e) {
      print('Error updating projectile: $e');
    }
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    try {
      super.onCollisionStart(intersectionPoints, other);
      
      if (other is Zombie && isActive) {
        // Hit a zombie
        (other as Zombie).takeDamage(damage);
        isActive = false;
        removeFromParent();
      } else if (other is PositionComponent && 
                 other != parent && 
                 other is! Zombie) {
        // Hit something else (wall, etc.)
        isActive = false;
        removeFromParent();
      }
    } catch (e) {
      print('Error handling projectile collision: $e');
    }
  }
}