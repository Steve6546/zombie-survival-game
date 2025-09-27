import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'game/zombie_survival_game.dart';

void main() {
  runApp(const ZombieSurvivalApp());
}

class ZombieSurvivalApp extends StatelessWidget {
  const ZombieSurvivalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zombie Survival',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      home: const GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late ZombieSurvivalGame game;
  bool gameStarted = false;

  @override
  void initState() {
    super.initState();
    try {
      game = ZombieSurvivalGame();
    } catch (e) {
      print('Error initializing game: $e');
    }
  }

  void startGame() {
    try {
      setState(() {
        gameStarted = true;
      });
    } catch (e) {
      print('Error starting game: $e');
    }
  }

  void resumeGame() {
    try {
      // Resume the game
    } catch (e) {
      print('Error resuming game: $e');
    }
  }

  void quitGame() {
    try {
      // Quit the game
      setState(() {
        gameStarted = false;
      });
    } catch (e) {
      print('Error quitting game: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        body: gameStarted 
          ? GameWidget(game: game)
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'ZOMBIE SURVIVAL',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: startGame,
                    child: const Text('Start Game'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: resumeGame,
                    child: const Text('Resume Game'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: quitGame,
                    child: const Text('Quit Game'),
                  ),
                ],
              ),
            ),
      );
    } catch (e) {
      print('Error building game screen: $e');
      return const Scaffold(
        body: Center(
          child: Text('Error loading game'),
        ),
      );
    }
  }
}