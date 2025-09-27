import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import '../resources/resource_manager.dart';

class GameHud extends Component {
  final ResourceManager resourceManager;
  late TextComponent coinText;
  late TextComponent woodText;
  late TextComponent metalText;
  late TextComponent foodText;
  late TextComponent waveText;

  int currentWave = 1;

  GameHud({required this.resourceManager}) : super();

  @override
  Future<void> onLoad() async {
    try {
      super.onLoad();

      // Create UI elements
      coinText = TextComponent(
        text: 'Coins: ${resourceManager.coins}',
        textRenderer: TextPaint(
          style: const TextStyle(
            fontSize: 20,
            color: Colors.yellow,
            fontFamily: 'Arial',
          ),
        ),
        position: Vector2(10, 10),
      );

      woodText = TextComponent(
        text: 'Wood: ${resourceManager.wood}',
        textRenderer: TextPaint(
          style: const TextStyle(
            fontSize: 20,
            color: Colors.brown,
            fontFamily: 'Arial',
          ),
        ),
        position: Vector2(10, 40),
      );

      metalText = TextComponent(
        text: 'Metal: ${resourceManager.metal}',
        textRenderer: TextPaint(
          style: const TextStyle(
            fontSize: 20,
            color: Colors.grey,
            fontFamily: 'Arial',
          ),
        ),
        position: Vector2(10, 70),
      );

      foodText = TextComponent(
        text: 'Food: ${resourceManager.food}',
        textRenderer: TextPaint(
          style: const TextStyle(
            fontSize: 20,
            color: Colors.green,
            fontFamily: 'Arial',
          ),
        ),
        position: Vector2(10, 100),
      );

      waveText = TextComponent(
        text: 'Wave: $currentWave',
        textRenderer: TextPaint(
          style: const TextStyle(
            fontSize: 20,
            color: Colors.red,
            fontFamily: 'Arial',
          ),
        ),
        position: Vector2(10, 130),
      );

      add(coinText);
      add(woodText);
      add(metalText);
      add(foodText);
      add(waveText);
    } catch (e) {
      print('Error loading game HUD: $e');
    }
  }

  @override
  void update(double dt) {
    try {
      super.update(dt);
      
      // Update UI text
      coinText.text = 'Coins: ${resourceManager.coins}';
      woodText.text = 'Wood: ${resourceManager.wood}';
      metalText.text = 'Metal: ${resourceManager.metal}';
      foodText.text = 'Food: ${resourceManager.food}';
      waveText.text = 'Wave: $currentWave';
    } catch (e) {
      print('Error updating game HUD: $e');
    }
  }

  void nextWave() {
    try {
      currentWave++;
    } catch (e) {
      print('Error advancing to next wave: $e');
    }
  }
}