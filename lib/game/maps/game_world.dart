import 'package:flame/components.dart';

class GameWorld extends PositionComponent {
  static const double tileSize = 32.0;
  static const int worldWidth = 20;
  static const int worldHeight = 15;

  @override
  Future<void> onLoad() async {
    try {
      super.onLoad();
      // Create a simple grid-based world
      await _generateWorld();
    } catch (e) {
      print('Error loading game world: $e');
    }
  }

  Future<void> _generateWorld() async {
    try {
      // Create floor tiles
      for (int x = 0; x < worldWidth; x++) {
        for (int y = 0; y < worldHeight; y++) {
          // Add floor tile
          final floor = RectangleComponent(
            size: Vector2(tileSize, tileSize),
            position: Vector2(x * tileSize, y * tileSize),
            paint: Paint()..color = const Color(0xFF333333),
          );
          add(floor);
        }
      }

      // Add some walls around the edges
      for (int x = 0; x < worldWidth; x++) {
        // Top wall
        final topWall = RectangleComponent(
          size: Vector2(tileSize, tileSize),
          position: Vector2(x * tileSize, 0),
          paint: Paint()..color = const Color(0xFF555555),
        );
        add(topWall);

        // Bottom wall
        final bottomWall = RectangleComponent(
          size: Vector2(tileSize, tileSize),
          position: Vector2(x * tileSize, (worldHeight - 1) * tileSize),
          paint: Paint()..color = const Color(0xFF555555),
        );
        add(bottomWall);
      }

      for (int y = 0; y < worldHeight; y++) {
        // Left wall
        final leftWall = RectangleComponent(
          size: Vector2(tileSize, tileSize),
          position: Vector2(0, y * tileSize),
          paint: Paint()..color = const Color(0xFF555555),
        );
        add(leftWall);

        // Right wall
        final rightWall = RectangleComponent(
          size: Vector2(tileSize, tileSize),
          position: Vector2((worldWidth - 1) * tileSize, y * tileSize),
          paint: Paint()..color = const Color(0xFF555555),
        );
        add(rightWall);
      }
    } catch (e) {
      print('Error generating game world: $e');
    }
  }
}