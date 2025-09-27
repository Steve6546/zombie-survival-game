import 'package:flame_audio/flame_audio.dart';

class AudioManager {
  static const String backgroundMusic = 'background.mp3';
  static const String zombieSound = 'zombie.wav';
  static const String playerHitSound = 'player_hit.wav';
  static const String zombieDieSound = 'zombie_die.wav';
  static const String coinCollectSound = 'coin_collect.wav';
  static const String weaponSwingSound = 'weapon_swing.wav';
  static const String doorOpenSound = 'door_open.wav';

  bool soundEnabled = true;
  bool musicEnabled = true;
  double soundVolume = 1.0;
  double musicVolume = 0.7;

  void playSound(String soundFile) {
    try {
      if (soundEnabled) {
        FlameAudio.play(soundFile, volume: soundVolume);
      }
    } catch (e) {
      print('Error playing sound $soundFile: $e');
    }
  }

  void playMusic(String musicFile) {
    try {
      if (musicEnabled) {
        FlameAudio.bgm.play(musicFile, volume: musicVolume);
      }
    } catch (e) {
      print('Error playing music $musicFile: $e');
    }
  }

  void stopMusic() {
    try {
      FlameAudio.bgm.stop();
    } catch (e) {
      print('Error stopping music: $e');
    }
  }

  void toggleSound() {
    soundEnabled = !soundEnabled;
  }

  void toggleMusic() {
    musicEnabled = !musicEnabled;
    if (musicEnabled) {
      // Resume music if it was playing
    } else {
      stopMusic();
    }
  }
}