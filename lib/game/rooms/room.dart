import 'package:flame/components.dart';

enum RoomType {
  storage,
  workshop,
  barricades,
  medical,
  kitchen,
}

class Room extends PositionComponent {
  final RoomType type;
  int level;
  final Vector2 size;
  
  // Room effects
  double storageMultiplier = 1.0;
  double craftingSpeed = 1.0;
  double defenseBonus = 0.0;
  double healingRate = 0.0;
  double foodProduction = 0.0;

  Room({
    required this.type,
    required this.level,
    required Vector2 position,
    required this.size,
  }) : super(position: position, size: size);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    
    // Visual representation based on room type
    Paint roomPaint;
    switch (type) {
      case RoomType.storage:
        roomPaint = Paint()..color = const Color(0xFF654321);
        storageMultiplier = 1.0 + (level * 0.5);
        break;
      case RoomType.workshop:
        roomPaint = Paint()..color = const Color(0xFF708090);
        craftingSpeed = 1.0 + (level * 0.3);
        break;
      case RoomType.barricades:
        roomPaint = Paint()..color = const Color(0xFF8B0000);
        defenseBonus = level * 5.0;
        break;
      case RoomType.medical:
        roomPaint = Paint()..color = const Color(0xFFFFFFFF);
        healingRate = level * 2.0;
        break;
      case RoomType.kitchen:
        roomPaint = Paint()..color = const Color(0xFFFFA500);
        foodProduction = level * 1.0;
        break;
    }
    
    add(RectangleComponent(
      size: size,
      paint: roomPaint,
    ));
  }

  void upgrade() {
    level++;
    updateEffects();
  }

  void updateEffects() {
    switch (type) {
      case RoomType.storage:
        storageMultiplier = 1.0 + (level * 0.5);
        break;
      case RoomType.workshop:
        craftingSpeed = 1.0 + (level * 0.3);
        break;
      case RoomType.barricades:
        defenseBonus = level * 5.0;
        break;
      case RoomType.medical:
        healingRate = level * 2.0;
        break;
      case RoomType.kitchen:
        foodProduction = level * 1.0;
        break;
    }
  }
}