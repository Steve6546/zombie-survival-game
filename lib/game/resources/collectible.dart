import 'package:flame/components.dart';
import 'package:flame/collisions.dart';

enum ResourceType {
  coin,
  wood,
  metal,
  food,
  weapon,
}

class Collectible extends PositionComponent {
  final ResourceType type;
  final int value;
  final CircleHitbox hitbox;

  Collectible({
    required this.type,
    required this.value,
    required Vector2 position,
  }) : hitbox = CircleHitbox(radius: 16),
       super(position: position, size: Vector2.all(32)) {
    add(hitbox);
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    
    // Visual representation based on type
    switch (type) {
      case ResourceType.coin:
        add(CircleComponent(
          radius: 16,
          paint: Paint()..color = const Color(0xFFFFD700),
        ));
        break;
      case ResourceType.wood:
        add(RectangleComponent(
          size: Vector2.all(32),
          paint: Paint()..color = const Color(0xFF8B4513),
        ));
        break;
      case ResourceType.metal:
        add(RectangleComponent(
          size: Vector2.all(32),
          paint: Paint()..color = const Color(0xFFC0C0C0),
        ));
        break;
      case ResourceType.food:
        add(RectangleComponent(
          size: Vector2.all(32),
          paint: Paint()..color = const Color(0xFF32CD32),
        ));
        break;
      case ResourceType.weapon:
        add(RectangleComponent(
          size: Vector2.all(32),
          paint: Paint()..color = const Color(0xFF4169E1),
        ));
        break;
    }
  }

  void collect() {
    // Logic for collecting the item
    removeFromParent();
  }
}