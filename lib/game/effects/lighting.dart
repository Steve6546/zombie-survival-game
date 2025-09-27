import 'dart:ui';
import 'package:flame/components.dart';

class DynamicLight extends PositionComponent {
  final double radius;
  final Color color;
  final double intensity;
  Paint? lightPaint;

  DynamicLight({
    required Vector2 position,
    required this.radius,
    required this.color,
    this.intensity = 1.0,
  }) : super(position: position, size: Vector2.all(radius * 2));

  @override
  Future<void> onLoad() async {
    try {
      super.onLoad();
      
      // Create a radial gradient for the light effect
      lightPaint = Paint()
        ..shader = RadialGradient(
          colors: [
            color.withOpacity(intensity),
            color.withOpacity(intensity * 0.5),
            color.withOpacity(0.0),
          ],
          stops: const [0.0, 0.7, 1.0],
        ).createShader(
          Rect.fromCircle(center: Offset.zero, radius: radius),
        );
    } catch (e) {
      print('Error loading dynamic light: $e');
    }
  }

  @override
  void render(Canvas canvas) {
    try {
      super.render(canvas);
      
      if (lightPaint != null) {
        canvas.drawCircle(
          Offset.zero,
          radius,
          lightPaint!,
        );
      }
    } catch (e) {
      print('Error rendering dynamic light: $e');
    }
  }
}

class LightingSystem extends Component {
  final List<DynamicLight> lights = [];
  
  void addLight(DynamicLight light) {
    try {
      lights.add(light);
      add(light);
    } catch (e) {
      print('Error adding light: $e');
    }
  }
  
  void removeLight(DynamicLight light) {
    try {
      lights.remove(light);
      light.removeFromParent();
    } catch (e) {
      print('Error removing light: $e');
    }
  }
  
  DynamicLight createPlayerLight(Vector2 position) {
    try {
      return DynamicLight(
        position: position,
        radius: 150.0,
        color: const Color(0xFFFFFF00), // Yellow light
        intensity: 0.8,
      );
    } catch (e) {
      print('Error creating player light: $e');
      // Return a default light if creation fails
      return DynamicLight(
        position: Vector2.zero(),
        radius: 100.0,
        color: const Color(0xFFFFFFFF),
        intensity: 0.5,
      );
    }
  }
}