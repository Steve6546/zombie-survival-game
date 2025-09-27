import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends Component {
  final Function() onRestart;
  final Function() onMainMenu;
  final int score;
  final int wave;
  
  late TextComponent gameOverText;
  late TextComponent scoreText;
  late TextComponent waveText;
  late ButtonComponent restartButton;
  late ButtonComponent mainMenuButton;

  GameOverScreen({
    required this.onRestart,
    required this.onMainMenu,
    required this.score,
    required this.wave,
  });

  @override
  Future<void> onLoad() async {
    super.onLoad();
    
    // Game over text
    gameOverText = TextComponent(
      text: 'GAME OVER',
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 50,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
      position: Vector2(400, 150),
      anchor: Anchor.center,
    );
    
    // Score text
    scoreText = TextComponent(
      text: 'Score: $score',
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 30,
          color: Colors.white,
        ),
      ),
      position: Vector2(400, 220),
      anchor: Anchor.center,
    );
    
    // Wave text
    waveText = TextComponent(
      text: 'Wave Reached: $wave',
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 30,
          color: Colors.white,
        ),
      ),
      position: Vector2(400, 270),
      anchor: Anchor.center,
    );
    
    // Restart button
    restartButton = ButtonComponent(
      position: Vector2(400, 350),
      size: Vector2(200, 50),
      anchor: Anchor.center,
      onPressed: onRestart,
      children: [
        RectangleComponent(
          size: Vector2(200, 50),
          paint: Paint()..color = Colors.green,
        ),
        TextComponent(
          text: 'Play Again',
          textRenderer: TextPaint(
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          anchor: Anchor.center,
        ),
      ],
    );
    
    // Main menu button
    mainMenuButton = ButtonComponent(
      position: Vector2(400, 420),
      size: Vector2(200, 50),
      anchor: Anchor.center,
      onPressed: onMainMenu,
      children: [
        RectangleComponent(
          size: Vector2(200, 50),
          paint: Paint()..color = Colors.blue,
        ),
        TextComponent(
          text: 'Main Menu',
          textRenderer: TextPaint(
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          anchor: Anchor.center,
        ),
      ],
    );
    
    add(gameOverText);
    add(scoreText);
    add(waveText);
    add(restartButton);
    add(mainMenuButton);
  }
}