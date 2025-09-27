# Game Architecture

## Overview

This document describes the architecture of the Zombie Survival game built with Flutter and Flame.

## Core Systems

### 1. Game Engine
- **Flame**: 2D game engine for Flutter
- **Components**: Entity-component system for game objects
- **Game Loop**: Update/render cycle

### 2. Main Game Class
- **ZombieSurvivalGame**: Main game class extending FlameGame
- Manages game state and systems
- Coordinates between different game components

### 3. Entity System

#### Player
- **Player**: Main character component
- Handles movement, combat, and collision
- Manages health and resources

#### Enemies
- **Zombie**: Enemy character component
- AI movement and behavior
- Health and damage system

#### Weapons
- **Weapon**: Abstract base class for weapons
- **MeleeWeapon**: Close combat weapons
- **RangedWeapon**: Projectile-based weapons
- **Projectile**: Moving projectiles

#### Resources
- **ResourceManager**: Manages player resources
- **Collectible**: Items that can be collected
- **Room**: Upgradeable areas with benefits

### 4. Game Systems

#### Combat System
- Weapon management
- Damage calculation
- Hit detection

#### Resource System
- Collection and management
- Upgrade mechanics
- Crafting system

#### Wave System
- **WaveManager**: Controls zombie waves
- Progressive difficulty
- Spawn management

#### Lighting System
- **DynamicLight**: Point light sources
- **LightingSystem**: Manages all lights
- Ambient and dynamic lighting

#### Audio System
- **AudioManager**: Handles sound effects and music
- Volume control
- Audio file management

#### Save System
- **SaveManager**: Game progress persistence
- Local storage (placeholder for Firebase)
- Data serialization

### 5. UI System

#### HUD
- **GameHud**: In-game user interface
- Resource display
- Wave information

#### Menus
- **MainMenu**: Main menu screen
- **GameOverScreen**: Game over screen
- Button interactions

### 6. World System

#### Maps
- **GameWorld**: Game environment
- Tile-based layout
- Collision boundaries

## Directory Structure

```
lib/
├── main.dart                 # App entry point
├── game/
│   ├── zombie_survival_game.dart  # Main game class
│   ├── components/           # Game entities
│   │   ├── player.dart       # Player character
│   │   └── zombie.dart       # Enemy characters
│   ├── weapons/              # Weapon system
│   │   ├── weapon.dart       # Weapon base classes
│   │   └── projectile.dart   # Projectile components
│   ├── resources/            # Resource management
│   │   ├── resource_manager.dart  # Resource handling
│   │   └── collectible.dart  # Collectible items
│   ├── rooms/                # Room system
│   │   └── room.dart         # Room components
│   ├── waves/                # Wave system
│   │   └── wave_manager.dart # Wave management
│   ├── effects/              # Visual effects
│   │   └── lighting.dart     # Lighting system
│   ├── audio/                # Audio system
│   │   └── audio_manager.dart # Audio management
│   ├── ui/                   # User interface
│   │   ├── game_hud.dart     # In-game HUD
│   ├── menu/                 # Menu screens
│   │   ├── main_menu.dart    # Main menu
│   │   └── game_over_screen.dart # Game over screen
│   ├── maps/                 # Game world
│   │   └── game_world.dart   # World generation
│   └── save/                 # Save system
│       └── save_manager.dart # Save/load functionality
assets/
├── images/                   # Game sprites and UI elements
└── audio/                    # Sound effects and music
docs/
└── architecture.md           # This document
```

## Data Flow

1. **Input Handling**: Keyboard/controller input is processed by the Player component
2. **Game Logic**: Update cycle processes movement, AI, collisions, and game state
3. **Rendering**: Components render themselves each frame
4. **UI Updates**: HUD displays current game state
5. **Persistence**: SaveManager handles game progress storage

## Future Enhancements

### Firebase Integration
- Online save system
- Leaderboards
- Multiplayer features

### Vertex AI Integration
- Procedural content generation
- Dynamic quest system
- Smart enemy AI

### Advanced Graphics
- Particle effects
- Shader-based lighting
- Animated sprites

### Mobile Features
- Touch controls
- Accelerometer input
- Vibration feedback