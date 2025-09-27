import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class MainMenu extends Component {
  final Function() onStartGame;
  final Function() onResumeGame;
  final Function() onQuitGame;
  final bool gameInProgress;
  
  late TextComponent title;
  late ButtonComponent startButton;
  late ButtonComponent resumeButton;
  late ButtonComponent quitButton;

  MainMenu({
    required this.onStartGame,
    required this.onResumeGame,
    required this.onQuitGame,
    this.gameInProgress = false,
  });

  @override
  Future<void> onLoad() async {
    super.onLoad();
    
    // Title
    title = TextComponent(
      text: 'ZOMBIE SURVIVAL',
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 40,
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontFamily: 'Arial',
        ),
      ),
      position: Vector2(400, 100),
      anchor: Anchor.center,
    );
    
    // Start button
    startButton = ButtonComponent(
      position: Vector2(400, 250),
      size: Vector2(200, 50),
      anchor: Anchor.center,
      onPressed: onStartGame,
      children: [
        RectangleComponent(
          size: Vector2(200, 50),
          paint: Paint()..color = Colors.green,
        ),
        TextComponent(
          text: 'Start Game',
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
    
    // Resume button (only shown if game is in progress)
    resumeButton = ButtonComponent(
      position: Vector2(400, 320),
      size: Vector2(200, 50),
      anchor: Anchor.center,
      onPressed: onResumeGame,
      children: [
        RectangleComponent(
          size: Vector2(200, 50),
          paint: Paint()..color = Colors.blue,
        ),
        TextComponent(
          text: 'Resume Game',
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
    
    // Quit button
    quitButton = ButtonComponent(
      position: Vector2(400, 390),
      size: Vector2(200, 50),
      anchor: Anchor.center,
      onPressed: onQuitGame,
      children: [
        RectangleComponent(
          size: Vector2(200, 50),
          paint: Paint()..color = Colors.red,
        ),
        TextComponent(
          text: 'Quit Game',
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
    
    add(title);
    add(startButton);
    
    if (gameInProgress) {
      add(resumeButton);
    }
    
    add(quitButton);
  }
}