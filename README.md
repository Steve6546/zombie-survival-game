# Zombie Survival Game

A 2D top-down zombie survival game built with Flutter and Flame engine.

## Game Concept

- **Genre**: 2D Top-down Action/Survival
- **Art Style**: Pixel Art with dynamic lighting and shadows
- **Gameplay**: 
  - Control a pixel art character navigating through a house/map
  - Fight off waves of zombies
  - Collect resources (coins, materials)
  - Upgrade rooms and stations within the game

## Features

- Smooth character movement with keyboard/controller support
- Dynamic lighting system for depth despite pixel art simplicity
- Interactive elements: weapons, traps, treasure chests, upgradeable rooms
- Progressive difficulty with increasingly challenging zombie waves
- Resource collection and management system
- Room/station upgrade mechanics

## Technical Implementation

### Frameworks & Libraries

- **Flutter + Flame**: 2D game engine for web and mobile with excellent pixel art support
- **Firebase**: Save progress, database for stores, player authentication, asset storage
- **Vertex AI** (optional): Smart content generation or random quests in the future
- **Audio + Light Plugins**: Sound effects and dynamic lighting within the game

### Project Structure

```
lib/
├── main.dart              # App entry point
├── game/
│   ├── zombie_survival_game.dart  # Main game logic
│   └── components/
│       ├── player.dart    # Player character
│       └── zombie.dart    # Enemy characters
assets/
├── images/                # Game sprites and UI elements
└── audio/                 # Sound effects and music
```

## Getting Started

1. Install Flutter (if not already installed)
2. Clone this repository
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the game

## Controls

- **WASD** or **Arrow Keys**: Move character
- **Mouse** or **Touch**: Aim and interact
- **Space**: Primary attack
- **Shift**: Sprint (when stamina available)

## Planned Features

- [ ] Basic player movement and zombie AI
- [ ] Combat system (melee and ranged weapons)
- [ ] Resource collection (coins, materials)
- [ ] Room upgrade system
- [ ] Dynamic lighting and shadows
- [ ] Sound effects and background music
- [ ] Progressive difficulty waves
- [ ] Save/load game progress with Firebase
- [ ] Multiple weapon types and crafting system
- [ ] Procedurally generated maps