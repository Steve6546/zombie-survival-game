import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/services.dart';
import '../weapons/weapon.dart';
import 'zombie.dart';

class Player extends SpriteComponent with KeyboardHandler, CollisionCallbacks {
  final double speed = 200.0;
  final Vector2 velocity = Vector2.zero();
  Weapon? currentWeapon;
  double health = 100.0;
  double maxHealth = 100.0;

  @override
  Future<void> onLoad() async {
    try {
      super.onLoad();
      // Load player sprite
      // For now, we'll use a simple rectangle as a placeholder
      size = Vector2(32, 32);
      anchor = Anchor.center;
      
      // Add collision detection
      add(CircleHitbox(radius: 16));
      
      // Start with a basic melee weapon
      currentWeapon = MeleeWeapon(
        name: "Fists",
        damage: 10.0,
        fireRate: 2.0,
        range: 40.0,
      );
    } catch (e) {
      print('Error loading player: $e');
    }
  }

  @override
  void update(double dt) {
    try {
      super.update(dt);
      
      // Reset velocity
      velocity.setZero();
      
      // Handle keyboard input
      if (KeyboardHandler.isKeyDown(LogicalKeyboardKey.keyA) || 
          KeyboardHandler.isKeyDown(LogicalKeyboardKey.arrowLeft)) {
        velocity.x = -speed;
      }
      if (KeyboardHandler.isKeyDown(LogicalKeyboardKey.keyD) || 
          KeyboardHandler.isKeyDown(LogicalKeyboardKey.arrowRight)) {
        velocity.x = speed;
      }
      if (KeyboardHandler.isKeyDown(LogicalKeyboardKey.keyW) || 
          KeyboardHandler.isKeyDown(LogicalKeyboardKey.arrowUp)) {
        velocity.y = -speed;
      }
      if (KeyboardHandler.isKeyDown(LogicalKeyboardKey.keyS) || 
          KeyboardHandler.isKeyDown(LogicalKeyboardKey.arrowDown)) {
        velocity.y = speed;
      }
      
      // Attack input
      if (KeyboardHandler.isKeyDown(LogicalKeyboardKey.space)) {
        currentWeapon?.fire(gameRef.currentTime());
      }
      
      // Update position based on velocity
      position += velocity * dt;
    } catch (e) {
      print('Error updating player: $e');
    }
  }
  
  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    try {
      super.onCollisionStart(intersectionPoints, other);
      
      if (other is Zombie) {
        // Player takes damage from zombie
        takeDamage(5.0);
      }
    } catch (e) {
      print('Error handling player collision: $e');
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
      // Handle player death
      // For now, we'll just reset health
      health = maxHealth;
      position = Vector2(100, 100); // Reset position
      print('Player died and respawned');
    } catch (e) {
      print('Error handling player death: $e');
    }
  }
}